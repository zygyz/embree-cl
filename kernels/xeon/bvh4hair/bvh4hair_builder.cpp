// ======================================================================== //
// Copyright 2009-2014 Intel Corporation                                    //
//                                                                          //
// Licensed under the Apache License, Version 2.0 (the "License");          //
// you may not use this file except in compliance with the License.         //
// You may obtain a copy of the License at                                  //
//                                                                          //
//     http://www.apache.org/licenses/LICENSE-2.0                           //
//                                                                          //
// Unless required by applicable law or agreed to in writing, software      //
// distributed under the License is distributed on an "AS IS" BASIS,        //
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. //
// See the License for the specific language governing permissions and      //
// limitations under the License.                                           //
// ======================================================================== //

#include "bvh4hair.h"
#include "bvh4hair_builder.h"
#include "bvh4hair_statistics.h"
#include "common/scene_bezier_curves.h"
#include "../builders/bezierrefgen.h"
#include <algorithm>

namespace embree
{
  extern double g_hair_builder_replication_factor;
 
  namespace isa
  {
    template<> BVH4HairBuilderT<Bezier1 >::BVH4HairBuilderT (BVH4Hair* bvh, Scene* scene, size_t mode) : BVH4HairBuilder(bvh,scene,mode) {}
    template<> BVH4HairBuilderT<Bezier1i>::BVH4HairBuilderT (BVH4Hair* bvh, Scene* scene, size_t mode) : BVH4HairBuilder(bvh,scene,mode) {}

    BVH4HairBuilder::BVH4HairBuilder (BVH4Hair* bvh, Scene* scene, size_t mode)
      : scene(scene), minLeafSize(1), maxLeafSize(inf), enableSpatialSplits(mode > 0), bvh(bvh), remainingReplications(0)
    {
      if (BVH4Hair::maxLeafBlocks < this->maxLeafSize) 
	this->maxLeafSize = BVH4Hair::maxLeafBlocks;
    }
    
    void BVH4HairBuilder::build(size_t threadIndex, size_t threadCount) 
    {
      /* fast path for empty BVH */
      size_t numPrimitives = scene->numBezierCurves;
      bvh->init(numPrimitives,numPrimitives+(size_t)(g_hair_builder_replication_factor*numPrimitives));
      if (numPrimitives == 0) return;
      numGeneratedPrims = 0;
      
      //while (true)
      {
	double t0 = 0.0;
	if (g_verbose >= 2) 
	{
	  std::cout << "building ";
#if BVH4HAIR_COMPRESS_UNALIGNED_NODES
	  std::cout << "Compressed";
#endif
	  std::cout << "BVH4Hair<" + bvh->primTy.name + "> using " << TOSTRING(isa) << "::BVH4HairBuilder ..." << std::flush;
	  t0 = getSeconds();
	}
	
	size_t N = 0;
	float r = 0;
	
	/* create initial curve list */
	size_t numVertices = 0;
	BezierRefGen gen(threadIndex,threadCount,&alloc,scene);
	PrimInfo pinfo = gen.pinfo;
	BezierRefList prims = gen.prims;
	
	bvh->numPrimitives = scene->numBezierCurves;
	bvh->numVertices = 0;
	if (&bvh->primTy == &SceneBezier1i::type) bvh->numVertices = numVertices;
	
	/* start recursive build */
	remainingReplications = g_hair_builder_replication_factor*numPrimitives;
	bvh->bounds = pinfo.geomBounds;
	
#if 0
	const Split split = find_split(threadIndex,threadCount,prims,pinfo,pinfo.geomBounds);
	BuildTask task(&bvh->root,0,prims,pinfo,pinfo.geomBounds,split); recurseTask(threadIndex,task);
	/*bvh->root = recurse(threadIndex,0,prims,pinfo,pinfo.geomBounds,split);*/
#else
	const Split split = find_split<true>(threadIndex,threadCount,prims,pinfo,pinfo.geomBounds,pinfo);
	BuildTask task(&bvh->root,0,prims,pinfo,pinfo.geomBounds,pinfo,split);
	numActiveTasks = 1;
	tasks.push_back(task);
	std::push_heap(tasks.begin(),tasks.end());
	
#if 1
	while (tasks.front().pinfo.size() > 200000)
	{
	  BuildTask task = tasks.front();
	  std::pop_heap(tasks.begin(),tasks.end());
	  tasks.pop_back();
	  
	  size_t numChildren;
	  BuildTask ctasks[BVH4Hair::N];
	  processTask<true>(threadIndex,threadCount,task,ctasks,numChildren);
	  
	  for (size_t i=0; i<numChildren; i++) {
	    atomic_add(&numActiveTasks,+1);
	    tasks.push_back(ctasks[i]);
	    std::push_heap(tasks.begin(),tasks.end());
	  }
	  atomic_add(&numActiveTasks,-1);
	}
#endif
	
	TaskScheduler::executeTask(threadIndex,threadCount,_task_build_parallel,this,threadCount,"BVH4Builder::build_parallel");
#endif
	
	if (g_verbose >= 2) {
	  double t1 = getSeconds();
	  std::cout << " [DONE]" << std::endl;
	  std::cout << "  dt = " << 1000.0f*(t1-t0) << "ms, perf = " << 1E-6*double(numPrimitives)/(t1-t0) << " Mprim/s" << std::endl;
	  std::cout << BVH4HairStatistics(bvh).str();
	}
      }
    }

    template<typename Primitive>
    BVH4Hair::NodeRef BVH4HairBuilderT<Primitive>::createLeaf(size_t threadIndex, size_t depth, BezierRefList& prims, const PrimInfo& pinfo)
    {
      size_t N = pinfo.size();
      
      if (N > (size_t)BVH4Hair::maxLeafBlocks) {
	//std::cout << "WARNING: Loosing " << N-BVH4Hair::maxLeafBlocks << " primitives during build!" << std::endl;
	std::cout << "!" << std::flush;
	N = (size_t)BVH4Hair::maxLeafBlocks;
      }
      if (g_verbose >= 1) {
        size_t numGeneratedPrimsOld = atomic_add(&numGeneratedPrims,N); 
        if (numGeneratedPrimsOld%10000 > (numGeneratedPrimsOld+N)%10000) std::cout << "." << std::flush; 
      }
      //assert(N <= (size_t)BVH4Hair::maxLeafBlocks);
     
      Primitive* leaf = (Primitive*) bvh->allocPrimitiveBlocks(threadIndex,N);
      BezierRefList::block_iterator_unsafe iter(prims);
      for (size_t i=0; i<N; i++) leaf[i].fill(iter,scene);
      assert(!iter);
      
      /* free all primitive blocks */
      while (BezierRefList::item* block = prims.take())
	alloc.free(threadIndex,block);
      
      return bvh->encodeLeaf((char*)leaf,N);
    }

    BVH4Hair::NodeRef BVH4HairBuilder::createLargeLeaf(size_t threadIndex, BezierRefList& prims, const PrimInfo& pinfo, size_t depth)
    {
#if defined(_DEBUG)
      if (depth >= BVH4Hair::maxBuildDepthLeaf) 
	throw std::runtime_error("ERROR: Loosing primitives during build.");
#endif
      
      /* create leaf for few primitives */
      if (pinfo.size() <= BVH4Hair::maxLeafBlocks)
	return createLeaf(threadIndex,depth,prims,pinfo);
      
      /* first level */
      BezierRefList prims0, prims1;
      PrimInfo   cinfo0, cinfo1;
      FallBackSplit::find(threadIndex,alloc,prims,prims0,cinfo0,prims1,cinfo1);
      
      /* second level */
      BezierRefList cprims[4];
      PrimInfo   cinfo[4];
      FallBackSplit::find(threadIndex,alloc,prims0,cprims[0],cinfo[0],cprims[1],cinfo[1]);
      FallBackSplit::find(threadIndex,alloc,prims1,cprims[2],cinfo[2],cprims[3],cinfo[3]);
      
      /*! create an inner node */
      BVH4Hair::AlignedNode* node = bvh->allocAlignedNode(threadIndex);
      for (size_t i=0; i<4; i++) {
        node->set(i,cinfo[i].geomBounds);
        node->set(i,createLargeLeaf(threadIndex,cprims[i],cinfo[i],depth+1));
      }
      return bvh->encodeNode(node);
    }  

    template<bool Parallel>
    Split BVH4HairBuilder::find_split(size_t threadIndex, size_t threadCount, BezierRefList& prims, const PrimInfo& pinfo, const NAABBox3fa& bounds, const PrimInfo& sinfo)
    {
      /* variable to track the SAH of the best splitting approach */
      float bestSAH = inf;
      const float leafSAH = BVH4Hair::intCost*float(pinfo.size())*halfArea(bounds.bounds);
      
      /* perform standard binning in aligned space */
      ObjectPartition::Split alignedObjectSplit;
      float alignedObjectSAH = inf;
      alignedObjectSplit = ObjectPartition::find<Parallel>(threadIndex,threadCount,prims,pinfo,0); // FIXME: hardcoded 0
      alignedObjectSAH = BVH4Hair::travCostAligned*halfArea(bounds.bounds) + BVH4Hair::intCost*alignedObjectSplit.splitSAH();
      bestSAH = min(bestSAH,alignedObjectSAH);
      
      /* perform spatial split in aligned space */
      SpatialSplit::Split alignedSpatialSplit;
      float alignedSpatialSAH = inf;
      if (enableSpatialSplits && remainingReplications > 0) {
	alignedSpatialSplit = SpatialSplit::find<Parallel>(threadIndex,threadCount,scene,prims,pinfo,0); // FIXME: hardcoded 0
	alignedSpatialSAH = BVH4Hair::travCostAligned*halfArea(bounds.bounds) + BVH4Hair::intCost*alignedSpatialSplit.splitSAH();
	bestSAH = min(bestSAH,alignedSpatialSAH);
      }
      
      /* perform standard binning in unaligned space */
      ObjectPartitionUnaligned::Split unalignedObjectSplit;
      float unalignedObjectSAH = inf;
      if (alignedObjectSAH > 0.7f*leafSAH) {
	if (sinfo.size()) 
	  unalignedObjectSplit = ObjectPartitionUnaligned::find<Parallel>(threadIndex,threadCount,prims,bounds.space,sinfo);
	else {
	  const LinearSpace3fa space = ObjectPartitionUnaligned::computeAlignedSpace<Parallel>(threadIndex,threadCount,prims); 
	  const PrimInfo       sinfo = ObjectPartitionUnaligned::computePrimInfo    <Parallel>(threadIndex,threadCount,prims,space);
	  unalignedObjectSplit = ObjectPartitionUnaligned::find<Parallel>(threadIndex,threadCount,prims,space,sinfo);
	}    	
	unalignedObjectSAH = BVH4Hair::travCostUnaligned*halfArea(bounds.bounds) + BVH4Hair::intCost*unalignedObjectSplit.splitSAH();
	bestSAH = min(bestSAH,unalignedObjectSAH);
      }
      
      /* perform splitting into two strands */
      StrandSplit::Split strandSplit;
      float strandSAH = inf;
      if (alignedObjectSAH > 0.6f*leafSAH) {
	strandSplit = StrandSplit::find<Parallel>(threadIndex,threadCount,prims);
	strandSAH = BVH4Hair::travCostUnaligned*halfArea(bounds.bounds) + BVH4Hair::intCost*strandSplit.splitSAH();
	bestSAH = min(bestSAH,strandSAH);
      }

      
      /* return best split */
      if      (bestSAH == float(inf)        ) return Split();
      else if (bestSAH == alignedObjectSAH  ) return Split(alignedObjectSplit);
      else if (bestSAH == alignedSpatialSAH ) return Split(alignedSpatialSplit);
      else if (bestSAH == unalignedObjectSAH) return Split(unalignedObjectSplit);
      else if (bestSAH == strandSAH         ) return Split(strandSplit);
      else throw std::runtime_error("bvh4hair_builder: internal error");
    }
    
#if !BVH4HAIR_COMPRESS_UNALIGNED_NODES

    template<bool Parallel>
    __forceinline void BVH4HairBuilder::processTask(size_t threadIndex, size_t threadCount, BuildTask& task, BuildTask task_o[BVH4Hair::N], size_t& numTasks_o)
    {
      /* create enforced leaf */
      const float leafSAH  = BVH4Hair::intCost*task.pinfo.leafSAH();
      const float splitSAH = BVH4Hair::travCostUnaligned*halfArea(task.bounds.bounds)+BVH4Hair::intCost*task.split.splitSAH();
      
      if (task.pinfo.size() <= minLeafSize || task.depth >= BVH4Hair::maxBuildDepth || (task.pinfo.size() <= maxLeafSize && leafSAH <= splitSAH)) {
	*task.dst = createLargeLeaf(threadIndex,task.prims,task.pinfo,task.depth);
	numTasks_o = 0;
	return;
      }
      
      /*! initialize child list */
      bool isAligned = true;
      PrimInfo cpinfo     [BVH4Hair::N]; cpinfo [0] = task.pinfo; 
      PrimInfo csinfo     [BVH4Hair::N]; csinfo [0] = task.sinfo; 
      NAABBox3fa cbounds  [BVH4Hair::N]; cbounds[0] = task.bounds;
      BezierRefList cprims[BVH4Hair::N]; cprims [0] = task.prims;
      Split csplit        [BVH4Hair::N]; csplit [0] = task.split;        
      size_t numChildren = 1;
      
      /*! split until node is full or SAH tells us to stop */
      do {
	
	/*! find best child to split */
	float bestSAH = 0; 
	ssize_t bestChild = -1;
	for (size_t i=0; i<numChildren; i++) 
	{
	  float dSAH = csplit[i].splitSAH()-cpinfo[i].leafSAH();
	  if (cpinfo[i].size() <= minLeafSize) continue; 
	  if (cpinfo[i].size() > maxLeafSize) dSAH = min(0.0f,dSAH); //< force split for large jobs
	  if (dSAH <= bestSAH) { bestChild = i; bestSAH = dSAH; }
	}
	if (bestChild == -1) break;
	
	/*! split selected child */
	PrimInfo linfo(empty), rinfo(empty);
	BezierRefList lprims, rprims;
	csplit[bestChild].split<Parallel>(threadIndex,threadCount,alloc,scene,cprims[bestChild],lprims,linfo,rprims,rinfo);
	const ssize_t replications = linfo.size()+rinfo.size()-cpinfo[bestChild].size(); assert(replications >= 0);
	isAligned &= csplit[bestChild].isAligned;
	LinearSpace3fa lspace,rspace;
	PrimInfo lsinfo(empty),rsinfo(empty);
	if (!isAligned) {
	  lspace = ObjectPartitionUnaligned::computeAlignedSpace<Parallel>(threadIndex,threadCount,lprims); 
	  rspace = ObjectPartitionUnaligned::computeAlignedSpace<Parallel>(threadIndex,threadCount,rprims); 
	  lsinfo = ObjectPartitionUnaligned::computePrimInfo    <Parallel>(threadIndex,threadCount,lprims,lspace);
	  rsinfo = ObjectPartitionUnaligned::computePrimInfo    <Parallel>(threadIndex,threadCount,rprims,rspace);
	}
	const NAABBox3fa lbounds = isAligned ? linfo.geomBounds : NAABBox3fa(lspace,lsinfo.geomBounds); 
	const NAABBox3fa rbounds = isAligned ? rinfo.geomBounds : NAABBox3fa(rspace,rsinfo.geomBounds); 
	const Split lsplit = find_split<Parallel>(threadIndex,threadCount,lprims,linfo,lbounds,lsinfo);
	const Split rsplit = find_split<Parallel>(threadIndex,threadCount,rprims,rinfo,rbounds,rsinfo);
	cprims[numChildren] = rprims; cpinfo[numChildren] = rinfo; cbounds[numChildren] = rbounds; csinfo[numChildren] = lsinfo; csplit[numChildren] = rsplit;
	cprims[bestChild  ] = lprims; cpinfo[bestChild  ] = linfo; cbounds[bestChild  ] = lbounds; csinfo[bestChild  ] = rsinfo; csplit[bestChild  ] = lsplit;
	if (replications) atomic_add(&remainingReplications,-replications); 
	numChildren++;
	
      } while (numChildren < BVH4Hair::N);
      
      /* create aligned node */
      if (isAligned) 
      {
	BVH4Hair::AlignedNode* node = bvh->allocAlignedNode(threadIndex);
	for (size_t i=0; i<numChildren; i++) {
	  node->set(i,cpinfo[i].geomBounds);
	  new (&task_o[i]) BuildTask(&node->child(i),task.depth+1,cprims[i],cpinfo[i],cbounds[i],csinfo[i],csplit[i]);
	}
	numTasks_o = numChildren;
	*task.dst = bvh->encodeNode(node);
      }
      
      /* create unaligned node */
      else {
	BVH4Hair::UnalignedNode* node = bvh->allocUnalignedNode(threadIndex);
	for (size_t i=0; i<numChildren; i++) {
	  node->set(i,cbounds[i]);
	  new (&task_o[i]) BuildTask(&node->child(i),task.depth+1,cprims[i],cpinfo[i],cbounds[i],csinfo[i],csplit[i]);
	}
	numTasks_o = numChildren;
	*task.dst = bvh->encodeNode(node);
      }
    }

#else

	/*! scales orthonormal transformation into the range -127 to +127 */
  __forceinline const LinearSpace3fa compressTransform(const LinearSpace3fa& xfm)
  {
    assert(xfm.vx.x >= -1.0f && xfm.vx.x <= 1.0f);
    assert(xfm.vx.y >= -1.0f && xfm.vx.y <= 1.0f);
    assert(xfm.vx.z >= -1.0f && xfm.vx.z <= 1.0f);
    assert(xfm.vy.x >= -1.0f && xfm.vy.x <= 1.0f);
    assert(xfm.vy.y >= -1.0f && xfm.vy.y <= 1.0f);
    assert(xfm.vy.z >= -1.0f && xfm.vy.z <= 1.0f);
    assert(xfm.vz.x >= -1.0f && xfm.vz.x <= 1.0f);
    assert(xfm.vz.y >= -1.0f && xfm.vz.y <= 1.0f);
    assert(xfm.vz.z >= -1.0f && xfm.vz.z <= 1.0f);
    return LinearSpace3fa (clamp(trunc(127.0f*xfm.vx),Vec3fa(-127.0f),Vec3fa(+127.0f))/127.0f,
                           clamp(trunc(127.0f*xfm.vy),Vec3fa(-127.0f),Vec3fa(+127.0f))/127.0f,
                           clamp(trunc(127.0f*xfm.vz),Vec3fa(-127.0f),Vec3fa(+127.0f))/127.0f);
  }

    template<bool Parallel>
    __forceinline void BVH4HairBuilder::processTask(size_t threadIndex, size_t threadCount, BuildTask& task, BuildTask task_o[BVH4Hair::N], size_t& numTasks_o)
    {
      /* create enforced leaf */
      const float leafSAH  = BVH4Hair::intCost*task.pinfo.leafSAH();
      const float splitSAH = BVH4Hair::travCostUnaligned*halfArea(task.bounds.bounds)+BVH4Hair::intCost*task.split.splitSAH();

      if (task.pinfo.size() <= minLeafSize || task.depth >= BVH4Hair::maxBuildDepth || (task.pinfo.size() <= maxLeafSize && leafSAH <= splitSAH)) {
	*task.dst = createLargeLeaf(threadIndex,task.prims,task.pinfo,task.depth);
	numTasks_o = 0;
	return;
      }

      /* compute common hair space for this node */
      const LinearSpace3fa space = compressTransform(ObjectPartitionUnaligned::computeAlignedSpace<Parallel>(threadIndex,threadCount,task.prims)); 
      task.sinfo = ObjectPartitionUnaligned::computePrimInfo<Parallel>(threadIndex,threadCount,task.prims,space);
      
      /*! initialize child list */
      bool isAligned = true;
      PrimInfo cpinfo     [BVH4Hair::N]; cpinfo [0] = task.pinfo; 
      PrimInfo csinfo     [BVH4Hair::N]; csinfo [0] = task.sinfo; 
      NAABBox3fa cbounds  [BVH4Hair::N]; cbounds[0] = task.bounds;
      BezierRefList cprims[BVH4Hair::N]; cprims [0] = task.prims;
      Split csplit        [BVH4Hair::N]; csplit [0] = task.split;        
      size_t numChildren = 1;
      
      /*! split until node is full or SAH tells us to stop */
      do {
	
	/*! find best child to split */
	float bestSAH = 0; 
	ssize_t bestChild = -1;
	for (size_t i=0; i<numChildren; i++) 
	{
	  float dSAH = csplit[i].splitSAH()-cpinfo[i].leafSAH();
	  if (cpinfo[i].size() <= minLeafSize) continue; 
	  if (cpinfo[i].size() > maxLeafSize) dSAH = min(0.0f,dSAH); //< force split for large jobs
	  if (dSAH <= bestSAH) { bestChild = i; bestSAH = dSAH; }
	}
	if (bestChild == -1) break;
	
	/*! split selected child */
	PrimInfo linfo, rinfo;
	BezierRefList lprims, rprims;
	csplit[bestChild].split<Parallel>(threadIndex,threadCount,alloc,cprims[bestChild],lprims,linfo,rprims,rinfo);
	const ssize_t replications = linfo.size()+rinfo.size()-cpinfo[bestChild].size(); assert(replications >= 0);
	isAligned &= csplit[bestChild].isAligned;
	PrimInfo lsinfo,rsinfo;
	if (!isAligned) {
	  lsinfo = ObjectPartitionUnaligned::computePrimInfo    <Parallel>(threadIndex,threadCount,lprims,space);
	  rsinfo = ObjectPartitionUnaligned::computePrimInfo    <Parallel>(threadIndex,threadCount,rprims,space);
	}
	const NAABBox3fa lbounds = isAligned ? linfo.geomBounds : NAABBox3fa(space,lsinfo.geomBounds); 
	const NAABBox3fa rbounds = isAligned ? rinfo.geomBounds : NAABBox3fa(space,rsinfo.geomBounds); 
	const Split lsplit = find_split<Parallel>(threadIndex,threadCount,lprims,linfo,lbounds,lsinfo);
	const Split rsplit = find_split<Parallel>(threadIndex,threadCount,rprims,rinfo,rbounds,rsinfo);
	cprims[numChildren] = rprims; cpinfo[numChildren] = rinfo; cbounds[numChildren] = rbounds; csinfo[numChildren] = lsinfo; csplit[numChildren] = rsplit;
	cprims[bestChild  ] = lprims; cpinfo[bestChild  ] = linfo; cbounds[bestChild  ] = lbounds; csinfo[bestChild  ] = rsinfo; csplit[bestChild  ] = lsplit;
	if (replications) atomic_add(&remainingReplications,-replications); 
	numChildren++;
	
      } while (numChildren < BVH4Hair::N);
      
      /* create aligned node */
      if (isAligned) 
      {
	BVH4Hair::AlignedNode* node = bvh->allocAlignedNode(threadIndex);
	for (ssize_t i=0; i<numChildren; i++) {
	  node->set(i,cpinfo[i].geomBounds);
	  new (&task_o[i]) BuildTask(&node->child(i),task.depth+1,cprims[i],cpinfo[i],cbounds[i],csinfo[i],csplit[i]);
	}
	numTasks_o = numChildren;
	*task.dst = bvh->encodeNode(node);
      }
      
      /* create unaligned node */
      else {
	BVH4Hair::UnalignedNode* node = bvh->allocUnalignedNode(threadIndex);
	BBox3fa b = empty; // recomputing bounds as spatial splits might generate bounds slightly due to accuracy issues
	for (size_t i=0; i<numChildren; i++) {
	  csinfo[i] = ObjectPartitionUnaligned::computePrimInfo<Parallel>(threadIndex,threadCount,cprims[i],space);
	  cbounds[i] = NAABBox3fa(space,csinfo[i].geomBounds);
	  b.extend(csinfo[i].geomBounds);
	}
	node->set(NAABBox3fa(space,b));
	for (ssize_t i=numChildren-1; i>=0; i--) {
	  node->set(i,cbounds[i].bounds);
	  new (&task_o[i]) BuildTask(&node->child(i),task.depth+1,cprims[i],cpinfo[i],cbounds[i],csinfo[i],csplit[i]);
	}
	numTasks_o = numChildren;
	*task.dst = bvh->encodeNode(node);
      }
    }

#endif
    
    void BVH4HairBuilder::recurseTask(size_t threadIndex, size_t threadCount, BuildTask& task)
    {
      size_t numChildren;
      BuildTask tasks[BVH4Hair::N];
      processTask<false>(threadIndex,threadCount,task,tasks,numChildren);
      for (size_t i=0; i<numChildren; i++) 
	recurseTask(threadIndex,threadCount,tasks[i]);
    }
    
    void BVH4HairBuilder::task_build_parallel(size_t threadIndex, size_t threadCount, size_t taskIndex, size_t taskCount, TaskScheduler::Event* event) 
    {
      while (numActiveTasks) 
      {
	taskMutex.lock();
	if (tasks.size() == 0) {
	  taskMutex.unlock();
	  continue;
	}
	
	/* take next task from heap */
	BuildTask task = tasks.back(); tasks.pop_back();
	taskMutex.unlock();
	
	/* recursively finish task */
	if (task.pinfo.size() < 1024) {
	  atomic_add(&numActiveTasks,-1);
	  recurseTask(threadIndex,threadCount,task);
	}
	
	/* execute task and add child tasks */
	else 
	{
	  size_t numChildren;
	  BuildTask ctasks[BVH4Hair::N];
	  processTask<false>(threadIndex,threadCount,task,ctasks,numChildren);
	  taskMutex.lock();
	  for (size_t i=0; i<numChildren; i++) {
	    atomic_add(&numActiveTasks,+1);
	    tasks.push_back(ctasks[i]);
	  }
	  atomic_add(&numActiveTasks,-1);
	  taskMutex.unlock();
	}
      }
    }

    /*! entry functions for the builder */
    Builder* BVH4HairBezier1Builder  (void* bvh, Scene* scene, size_t mode) { return new class BVH4HairBuilderT<Bezier1> ((BVH4Hair*)bvh,scene,mode); }
    Builder* BVH4HairBezier1iBuilder (void* bvh, Scene* scene, size_t mode) { return new class BVH4HairBuilderT<Bezier1i> ((BVH4Hair*)bvh,scene,mode); }
  }
}
