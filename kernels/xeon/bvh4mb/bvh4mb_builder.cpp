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

#include "bvh4mb.h"
#include "bvh4mb_builder.h"
//#include "bvh4mb_refit.h"
//#include "bvh4mb_rotate.h"
//#include "bvh4mb_statistics.h"

#include "geometry/triangle1.h"
#include "geometry/triangle4.h"
#include "geometry/triangle8.h"
#include "geometry/triangle1v.h"
#include "geometry/triangle4v.h"
#include "geometry/triangle4i.h"

#define ROTATE_TREE 1
#define RESTRUCTURE_TREE 0

#include "common/scene_triangle_mesh.h"

namespace embree
{
  namespace isa
  {
    template<> BVH4MBBuilderT<Triangle1vMB>::BVH4MBBuilderT (BVH4MB* bvh, Scene* scene, size_t mode) : BVH4MBBuilder(bvh,scene,NULL,mode,0,0,1.0f,false,sizeof(Triangle1v),2,inf) {}
    template<> BVH4MBBuilderT<Triangle1vMB>::BVH4MBBuilderT (BVH4MB* bvh, TriangleMesh* mesh, size_t mode) : BVH4MBBuilder(bvh,mesh->parent,mesh,mode,0,0,1.0f,false,sizeof(Triangle1v),2,inf) {}

    BVH4MBBuilder::BVH4MBBuilder (BVH4MB* bvh, Scene* scene, TriangleMesh* mesh, size_t mode,
				size_t logBlockSize, size_t logSAHBlockSize, float intCost, 
				bool needVertices, size_t primBytes, const size_t minLeafSize, const size_t maxLeafSize)
      : scene(scene), mesh(mesh), bvh(bvh), enableSpatialSplits(mode > 0), remainingReplications(0),
	logBlockSize(logBlockSize), logSAHBlockSize(logSAHBlockSize), intCost(intCost), 
	needVertices(needVertices), primBytes(primBytes), minLeafSize(minLeafSize), maxLeafSize(maxLeafSize)
     {
       size_t maxLeafPrims = BVH4MB::maxLeafBlocks*(size_t(1)<<logBlockSize);
       if (maxLeafPrims < this->maxLeafSize) this->maxLeafSize = maxLeafPrims;
       needAllThreads = true;
    }
    
    BVH4MBBuilder::~BVH4MBBuilder() {
      //bvh->alloc.shrink(); // FIXME
    }

///////////////////////////////////////////////////////////////////////////////////////

#if 0
    struct RestructureNode
    {
      struct Partition3
      {
        __forceinline Partition3 () 
          : set0(0), set1(0), set2(0), sah(inf) {}
      public:
        int set0,set1,set2;
        float sah;
      };

      struct Item 
      {
        __forceinline Item () {}
        __forceinline Item (BVH4MB::NodeRef ref, const BBox3fa& b) 
          : ref(ref), bounds(b) { bounds.lower.a = ref.isLeaf() ? 0.0f : area(b); }

        __forceinline friend bool operator<(const Item& a, const Item& b) { 
          return a.bounds.lower.a < b.bounds.lower.a; 
        }
        
      public:
        BBox3fa bounds;
        BVH4MB::NodeRef ref;
      };

      RestructureNode (BVH4MB::Node* node2) 
      {
        for (size_t i=0; i< (1<<12); i++) 
          sa[i] = inf;

        numItems = 0;
        for (size_t c=0; c<4; c++) {
          if (node2->child(c) == BVH4MB::emptyNode) continue;
          items[numItems++] = Item(node2->child(c),node2->bounds(c));
        }
        if (numItems <= 1) return;
        std::sort(&items[0],&items[numItems]);

        BVH4MB::NodeRef ref0 = items[--numItems].ref;
        if (ref0.isLeaf()) return;
        BVH4MB::NodeRef ref1 = items[--numItems].ref;
        if (ref1.isLeaf()) return;
    
        BVH4MB::Node* node0 = ref0.node();
        for (size_t c=0; c<4; c++) {
          if (node0->child(c) == BVH4MB::emptyNode) continue;
          items[numItems++] = Item(node0->child(c),node0->bounds(c));
        }

        BVH4MB::Node* node1 = ref1.node();
        for (size_t c=0; c<4; c++) {
          if (node1->child(c) == BVH4MB::emptyNode) continue;
          items[numItems++] = Item(node1->child(c),node1->bounds(c));
        }

        Partition3 best;
        find012(0,0,0,0,best);
        //PRINT(numItems);
        //printf("set0 = "); for (size_t i=0; i<32; i++) if (best.set0 & (1<< i)) printf("1"); else printf("0"); printf("\n");
        //printf("set1 = "); for (size_t i=0; i<32; i++) if (best.set1 & (1<< i)) printf("1"); else printf("0"); printf("\n");
        //printf("set2 = "); for (size_t i=0; i<32; i++) if (best.set2 & (1<< i)) printf("1"); else printf("0"); printf("\n");
        //assert(__popcnt(best.set0 | best.set1 | best.set2) == numItems);

        int i0 = 0; node0->clear();
        int set0 = best.set0;
        int set1 = best.set1;
        int set2 = best.set2;
        while (set0) {
          const size_t j = __bscf(set0);
          node0->set(i0++,items[j].bounds,items[j].ref);
        }

        int i1 = 0; node1->clear();
        while (set1) {
          const size_t j = __bscf(set1);
          node1->set(i1++,items[j].bounds,items[j].ref);
        }

        int i2 = 0; node2->clear();
        while (set2) {
          const size_t j = __bscf(set2);
          node2->set(i2++,items[j].bounds,items[j].ref);
        }
        if (best.set0) {
          if (__popcnt(best.set0) == 1) {
            const size_t j = __bsf(best.set0);
            node2->set(i2++,items[j].bounds,items[j].ref);
          } else {
            node2->set(i2++,setBounds(best.set0),ref0);
          }
        }
        if (best.set1) {
          if (__popcnt(best.set1) == 1) {
            const size_t j = __bsf(best.set1);
            node2->set(i2++,items[j].bounds,items[j].ref);
          } else {
            node2->set(i2++,setBounds(best.set1),ref1);
          }
        }
      }

      void find012(int i, int set0, int set1, int set2, Partition3& best) 
      {
        if (i == numItems) return selectBest(set0,set1,set2,best);
        if (__popcnt(set0) == 4) return find12(i,set0,set1,set2,best);
        if (__popcnt(set1) == 4) return find02(i,set0,set1,set2,best);
        if (__popcnt(set2) == 2) return find01(i,set0,set1,set2,best);
        find012(i+1,set0|(1<<i),set1,set2,best);
        find012(i+1,set0,set1|(1<<i),set2,best);
        find012(i+1,set0,set1,set2|(1<<i),best);
      }

      void find01(int i, int set0, int set1, int set2, Partition3& best) 
      {
        if (i == numItems) return selectBest(set0,set1,set2,best);
        if (__popcnt(set0) == 4) return find1(i,set0,set1,set2,best);
        if (__popcnt(set1) == 4) return find0(i,set0,set1,set2,best);
        find01(i+1,set0|(1<<i),set1,set2,best);
        find01(i+1,set0,set1|(1<<i),set2,best);
      }

      void find02(int i, int set0, int set1, int set2, Partition3& best) 
      {
        if (i == numItems) return selectBest(set0,set1,set2,best);
        if (__popcnt(set0) == 4) return find2(i,set0,set1,set2,best);
        if (__popcnt(set2) == 2) return find0(i,set0,set1,set2,best);
        find02(i+1,set0|(1<<i),set1,set2,best);
        find02(i+1,set0,set1,set2|(1<<i),best);
      }

      void find12(int i, int set0, int set1, int set2, Partition3& best) 
      {
        if (i == numItems) return selectBest(set0,set1,set2,best);
        if (__popcnt(set1) == 4) return find2(i,set0,set1,set2,best);
        if (__popcnt(set2) == 2) return find1(i,set0,set1,set2,best);
        find12(i+1,set0,set1|(1<<i),set2,best);
        find12(i+1,set0,set1,set2|(1<<i),best);
      }
      
      void find0(int i, int set0, int set1, int set2, Partition3& best) 
      {
        if (i == numItems) return selectBest(set0,set1,set2,best);
        find0(i+1,set0|(1<<i),set1,set2,best);
      }

      void find1(int i, int set0, int set1, int set2, Partition3& best) 
      {
        if (i == numItems) return selectBest(set0,set1,set2,best);
        find1(i+1,set0,set1|(1<<i),set2,best);
      }
      
      void find2(int i, int set0, int set1, int set2, Partition3& best) 
      {
        if (i == numItems) return selectBest(set0,set1,set2,best);
        find2(i+1,set0,set1,set2|(1<<i),best);
      }

      void selectBest(int set0, int set1, int set2, Partition3& best)
      {
        if (sa[set0] == float(inf)) sa[set0] = setArea(set0);
        if (sa[set1] == float(inf)) sa[set1] = setArea(set1);
        const float sah = sa[set0] + sa[set1];
        if (best.sah < sah) return;
        best.sah  = sah;
        best.set0 = set0;
        best.set1 = set1;
        best.set2 = set2;
      }
      
      float setArea(size_t set) 
      {
        if (set == 0) 
          return 0.0f;
        
        BBox3fa bounds = empty;
        while (set) {
          bounds.extend(items[__bscf(set)].bounds);
        }
        return area(bounds);
      }

      BBox3fa setBounds(size_t set) 
      {
        if (set == 0) 
          return empty;
        
        BBox3fa bounds = empty;
        while (set) {
          bounds.extend(items[__bscf(set)].bounds);
        }
        return bounds;
      }
      
    private:
      float sa[1<<12];
      Item items[12];
      size_t numItems;
    };

    void BVH4MBBuilder::restructureTree(NodeRef& ref, size_t depth)
    {
      if (depth > 5) return;
      if (ref.isLeaf()) return;
      Node* node = ref.node();
      RestructureNode temp(node);
      for (size_t c=0; c<4; c++) {
        if (node->child(c) == BVH4MB::emptyNode) continue;
        restructureTree(node->child(c),depth+1);
      }
    }
#endif

///////////////////////////////////////////////////////////////////////////////////////
    template<typename Triangle>
    typename BVH4MBBuilder::NodeRef BVH4MBBuilderT<Triangle>::createLeaf(size_t threadIndex, PrimRefList& prims, const PrimInfo& pinfo)
    {
      /* allocate leaf node */
      size_t N = blocks(pinfo.size());
      Triangle* leaf = (Triangle*) bvh->allocPrimitiveBlocks(threadIndex,N);
      assert(N <= (size_t)BVH4MB::maxLeafBlocks);
      
      /* insert all triangles */
      PrimRefList::block_iterator_unsafe iter(prims);
      for (size_t i=0; i<N; i++) leaf[i].fill(iter,scene);
      assert(!iter);
      
      /* free all primitive blocks */
      while (PrimRefList::item* block = prims.take())
	alloc.free(threadIndex,block);
      
      return bvh->encodeLeaf(leaf,N);
    }
    
    BVH4MBBuilder::NodeRef BVH4MBBuilder::createLargeLeaf(size_t threadIndex, PrimRefList& prims, const PrimInfo& pinfo, size_t depth)
    {
#if defined(_DEBUG)
      if (depth >= BVH4MB::maxBuildDepthLeaf) 
	throw std::runtime_error("ERROR: Loosing primitives during build.");
#endif
      
      /* create leaf for few primitives */
      if (pinfo.size() <= maxLeafSize)
	return createLeaf(threadIndex,prims,pinfo);
      
      /* first level */
      PrimRefList prims0, prims1;
      PrimInfo   cinfo0, cinfo1;
      FallBackSplit::find(threadIndex,alloc,prims,prims0,cinfo0,prims1,cinfo1);
      
      /* second level */
      PrimRefList cprims[4];
      PrimInfo   cinfo[4];
      FallBackSplit::find(threadIndex,alloc,prims0,cprims[0],cinfo[0],cprims[1],cinfo[1]);
      FallBackSplit::find(threadIndex,alloc,prims1,cprims[2],cinfo[2],cprims[3],cinfo[3]);
      
      /*! create an inner node */
      Node* node = bvh->allocNode(threadIndex);
      for (size_t i=0; i<4; i++) 
	if (cinfo[i].size())
	  node->set(i,cinfo[i].geomBounds,createLargeLeaf(threadIndex,cprims[i],cinfo[i],depth+1));

      //BVH4MB::compact(node); // move empty nodes to the end
      return bvh->encodeNode(node);
    }  

    template<bool PARALLEL>
    const Split BVH4MBBuilder::find(size_t threadIndex, size_t threadCount, size_t depth, PrimRefList& prims, const PrimInfo& pinfo, bool spatial)
    {
      ObjectPartition::Split osplit = ObjectPartition::find<PARALLEL>(threadIndex,threadCount,      prims,pinfo,logSAHBlockSize);
      if (!spatial) {
	if (osplit.sah == float(inf)) return Split();
	else return osplit;
      }
      SpatialSplit   ::Split ssplit = SpatialSplit   ::find<PARALLEL>(threadIndex,threadCount,scene,prims,pinfo,logSAHBlockSize);
      const float bestSAH = min(osplit.sah,ssplit.sah);
      if      (bestSAH == osplit.sah) return osplit; 
      else if (bestSAH == ssplit.sah) return ssplit;
      else                            return Split();
    }
    
    template<bool PARALLEL>
    __forceinline size_t BVH4MBBuilder::createNode(size_t threadIndex, size_t threadCount, BVH4MBBuilder* parent, BuildRecord& record, BuildRecord records_o[BVH4MB::N])
    {
      /*! compute leaf and split cost */
      const float leafSAH  = parent->intCost*record.pinfo.leafSAH(parent->logSAHBlockSize);
      const float splitSAH = BVH4MB::travCost*halfArea(record.pinfo.geomBounds)+parent->intCost*record.split.splitSAH();
      //assert(PrimRefList::block_iterator_unsafe(prims).size() == record.pinfo.size());
      assert(record.pinfo.size() == 0 || leafSAH >= 0 && splitSAH >= 0);
      
      /*! create a leaf node when threshold reached or SAH tells us to stop */
      if (record.pinfo.size() <= parent->minLeafSize || record.depth > BVH4MB::maxBuildDepth || (record.pinfo.size() <= parent->maxLeafSize && leafSAH <= splitSAH)) {
	*record.dst = parent->createLargeLeaf(threadIndex,record.prims,record.pinfo,record.depth+1); return 0;
      }
      
      /*! initialize child list */
      records_o[0] = record;
      size_t numChildren = 1;
      
      /*! split until node is full or SAH tells us to stop */
      do {
	
	/*! find best child to split */
	float bestSAH = 0; 
	ssize_t bestChild = -1;
	for (size_t i=0; i<numChildren; i++) 
	{
	  float dSAH = records_o[i].split.splitSAH()-records_o[i].pinfo.leafSAH(parent->logSAHBlockSize);
	  if (records_o[i].pinfo.size() <= parent->minLeafSize) continue; 
	  if (records_o[i].pinfo.size() > parent->maxLeafSize) dSAH = min(0.0f,dSAH); //< force split for large jobs
	  if (dSAH <= bestSAH) { bestChild = i; bestSAH = dSAH; }
	}
	if (bestChild == -1) break;
	
	/* perform best found split */
	BuildRecord lrecord(record.depth+1);
	BuildRecord rrecord(record.depth+1);
	records_o[bestChild].split.split<PARALLEL>(threadIndex,threadCount,parent->alloc,parent->scene,records_o[bestChild].prims,lrecord.prims,lrecord.pinfo,rrecord.prims,rrecord.pinfo);

	/* fallback if spatial split did fail for corner case */
	if (lrecord.pinfo.size() == 0) {
	  rrecord.split = parent->find<PARALLEL>(threadIndex,threadCount,record.depth,rrecord.prims,rrecord.pinfo,false);
	  records_o[bestChild] = rrecord;
	  continue;
	}

	/* fallback if spatial split did fail for corner case */
	if (rrecord.pinfo.size() == 0) {
	  lrecord.split = parent->find<PARALLEL>(threadIndex,threadCount,record.depth,lrecord.prims,lrecord.pinfo,false);
	  records_o[bestChild] = lrecord;
	  continue;
	}
	
	/* count number of replications caused by spatial splits */
	ssize_t remaining = 0;
	const ssize_t replications = lrecord.pinfo.size()+rrecord.pinfo.size()-records_o[bestChild].pinfo.size(); 
	assert(replications >= 0);
	if (replications >= 0) 
	  remaining = atomic_add(&parent->remainingReplications,-replications);

	/* find new splits */
	lrecord.split = parent->find<PARALLEL>(threadIndex,threadCount,record.depth,lrecord.prims,lrecord.pinfo,parent->enableSpatialSplits && remaining > 0);
	rrecord.split = parent->find<PARALLEL>(threadIndex,threadCount,record.depth,rrecord.prims,rrecord.pinfo,parent->enableSpatialSplits && remaining > 0);
	records_o[bestChild  ] = lrecord;
	records_o[numChildren] = rrecord;
	numChildren++;
	
      } while (numChildren < BVH4MB::N);
      
      /*! create an inner node */
      Node* node = parent->bvh->allocNode(threadIndex);
      for (size_t i=0; i<numChildren; i++) {
	node->set(i,records_o[i].pinfo.geomBounds);
	records_o[i].dst = &node->child[i];
      }
      *record.dst = parent->bvh->encodeNode(node);
      return numChildren;
    }

    void BVH4MBBuilder::finish_build(size_t threadIndex, size_t threadCount, BuildRecord& record)
    {
      BuildRecord children[BVH4MB::N];
      size_t N = createNode<false>(threadIndex,threadCount,this,record,children);
      for (size_t i=0; i<N; i++)
	finish_build(threadIndex,threadCount,children[i]);
    }

    void BVH4MBBuilder::continue_build(size_t threadIndex, size_t threadCount, BuildRecord& record)
    {
      /* finish small tasks */
      if (record.pinfo.size() < 4*1024) 
      {
	finish_build(threadIndex,threadCount,record);
/*#if ROTATE_TREE
	for (int i=0; i<5; i++) 
	  BVH4MBRotate::rotate(bvh,*record.dst); 
	  #endif*/
	bvh->refit(scene,*record.dst);
	//record.dst->setBarrier();
      }

      /* and split large tasks */
      else
      {
	BuildRecord children[BVH4MB::N];
	size_t N = createNode<false>(threadIndex,threadCount,this,record,children);
      	taskMutex.lock();
	for (size_t i=0; i<N; i++) {
	  tasks.push_back(children[i]);
	  atomic_add(&activeBuildRecords,1);
	}
	taskMutex.unlock();
      }
    }

    void BVH4MBBuilder::build_parallel(size_t threadIndex, size_t threadCount, size_t taskIndex, size_t taskCount, TaskScheduler::Event* event) 
    {
      while (activeBuildRecords)
      {
	taskMutex.lock();
	if (tasks.size() == 0) {
	  taskMutex.unlock();
	  continue;
	}
	BuildRecord record = tasks.back();
	tasks.pop_back();
	taskMutex.unlock();
	continue_build(threadIndex,threadCount,record);
	atomic_add(&activeBuildRecords,-1);
      }
    }

#if 0
    BVH4MB::NodeRef BVH4MBBuilder::layout_top_nodes(size_t threadIndex, NodeRef node)
    {
      if (node.isBarrier()) {
	node.clearBarrier();
	return node;
      }
      else if (!node.isLeaf()) 
      {
	Node* src = node.node();
	Node* dst = bvh->allocNode(threadIndex);
	for (size_t i=0; i<BVH4MB::N; i++) {
	  dst->set(i,src->bounds(i),layout_top_nodes(threadIndex,src->child(i)));
	}
	return bvh->encodeNode(dst);
      }
      else
	return node;
    }
#endif

    void BVH4MBBuilder::build(size_t threadIndex, size_t threadCount) 
    {
      /*! calculate number of primitives */
      size_t numPrimitives = 0;
      if (mesh) numPrimitives = mesh->numTriangles;
      else      numPrimitives = scene->numTriangles2;

      /*! set maximal amount of primitive replications for spatial split mode */
      if (enableSpatialSplits)
	remainingReplications = numPrimitives;

      /*! initialize internal buffers of BVH */
      //bvh->init(numPrimitives+remainingReplications);
      bvh->clear();
      
      /*! skip build for empty scene */
      if (numPrimitives == 0) 
	return;
      
      /*! verbose mode */
      if (g_verbose >= 2) {
	std::cout << "building BVH4MB<" << bvh->primTy.name << "> with " << TOSTRING(isa) "::BVH4MBBuilder(";
	if (enableSpatialSplits) std::cout << "spatialsplits";
	std::cout << ") ... " << std::flush;
      }

      /*! benchmark mode */
      double t0 = 0.0, t1 = 0.0f;
      if (g_verbose >= 2 || g_benchmark)
	t0 = getSeconds();
      
      /* generate list of build primitives */
      PrimRefList prims; PrimInfo pinfo(empty);
      if (mesh) PrimRefListGenFromGeometry<TriangleMesh>::generate(threadIndex,threadCount,&alloc,mesh ,prims,pinfo);
      else      PrimRefListGen                          ::generate(threadIndex,threadCount,&alloc,scene,TRIANGLE_MESH,2,prims,pinfo);
      
      /* perform initial split */
      const Split split = find<true>(threadIndex,threadCount,1,prims,pinfo,enableSpatialSplits);
      const BuildRecord record(1,prims,pinfo,split,&bvh->root);
      tasks.push_back(record); 
      activeBuildRecords=1;

      /* work in multithreaded toplevel mode until sufficient subtasks got generated */
      while (tasks.size() > 0 && tasks.size() < threadCount)
      {
	/* pop largest item for better load balancing */
	BuildRecord task = tasks.front();
	std::pop_heap(tasks.begin(),tasks.end());
	tasks.pop_back();
	activeBuildRecords--;
	
	/* process this item in parallel */
	BuildRecord children[BVH4MB::N];
	size_t N = createNode<true>(threadIndex,threadCount,this,task,children);
	for (size_t i=0; i<N; i++) {
	  tasks.push_back(children[i]);
	  std::push_heap(tasks.begin(),tasks.end());
	  activeBuildRecords++;
	}
      }
      
      /*! process each generated subtask in its own thread */
      TaskScheduler::executeTask(threadIndex,threadCount,_build_parallel,this,threadCount,"BVH4MBBuilder::build");
                  
      /* perform tree rotations of top part of the tree */
/*#if ROTATE_TREE
      for (int i=0; i<5; i++) 
	BVH4MBRotate::rotate(bvh,bvh->root);
	#endif*/

      /* layout top nodes */
      //bvh->root = layout_top_nodes(threadIndex,bvh->root);
      bvh->refit(scene,bvh->root);
      //bvh->clearBarrier(bvh->root);
      //bvh->numPrimitives = pinfo.size();
      bvh->bounds = pinfo.geomBounds;

#if RESTRUCTURE_TREE
      for (int i=0; i<5; i++) 
        restructureTree(bvh->root,0);
#endif
      
      /* free all temporary memory blocks */
      Alloc::global.clear();

      if (g_verbose >= 2 || g_benchmark) 
	t1 = getSeconds();

      /*! verbose mode */
      if (g_verbose >= 2) {
      	std::cout << "[DONE]" << std::endl;
	std::cout << "  dt = " << 1000.0f*(t1-t0) << "ms, perf = " << 1E-6*double(numPrimitives)/(t1-t0) << " Mprim/s" << std::endl;
        //std::cout << BVH4MBStatistics(bvh).str();
      }

      /* benchmark mode */
      if (g_benchmark) {
	//BVH4MBStatistics stat(bvh);
	//std::cout << "BENCHMARK_BUILD " << t1-t0 << " " << double(numPrimitives)/(t1-t0) << " " << stat.sah() << " " << stat.bytesUsed() << std::endl;
      }
    }
    
    /*! entry functions for the builder */
    Builder* BVH4MBTriangle1vBuilder (void* bvh, Scene* scene, size_t mode) { return new class BVH4MBBuilderT<Triangle1vMB>((BVH4MB*)bvh,scene,mode); }
  }
}
