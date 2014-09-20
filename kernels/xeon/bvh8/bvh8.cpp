
#include "bvh8.h"
#include "geometry/triangle8.h"
#include "common/accelinstance.h"

namespace embree
{
  DECLARE_SYMBOL(Accel::Intersector1,BVH8Triangle8Intersector1Moeller);
  DECLARE_SYMBOL(Accel::Intersector4,BVH8Triangle8Intersector4HybridMoeller);
  DECLARE_SYMBOL(Accel::Intersector4,BVH8Triangle8Intersector4HybridMoellerNoFilter);
  DECLARE_SYMBOL(Accel::Intersector8,BVH8Triangle8Intersector8ChunkMoeller);
  DECLARE_SYMBOL(Accel::Intersector8,BVH8Triangle8Intersector8HybridMoeller);
  DECLARE_SYMBOL(Accel::Intersector8,BVH8Triangle8Intersector8HybridMoellerNoFilter);

  DECLARE_SCENE_BUILDER(BVH8Triangle8Builder);

  void BVH8Register () 
  {
    int features = getCPUFeatures();
    cout << "in BVH8Register "  << endl;
    /* select builders */
    SELECT_SYMBOL_AVX(features,BVH8Triangle8Builder);

    /* select intersectors1 */
    SELECT_SYMBOL_AVX_AVX2(features,BVH8Triangle8Intersector1Moeller);

    /* select intersectors4 */
    SELECT_SYMBOL_AVX_AVX2(features,BVH8Triangle8Intersector4HybridMoeller);
    SELECT_SYMBOL_AVX_AVX2(features,BVH8Triangle8Intersector4HybridMoellerNoFilter);

    /* select intersectors8 */
    SELECT_SYMBOL_AVX_AVX2(features,BVH8Triangle8Intersector8ChunkMoeller);
    SELECT_SYMBOL_AVX_AVX2(features,BVH8Triangle8Intersector8HybridMoeller);
    SELECT_SYMBOL_AVX_AVX2(features,BVH8Triangle8Intersector8HybridMoellerNoFilter);
    cout << "end BVH8Register " << endl;
  }

  BVH8::BVH8 (const PrimitiveType& primTy, void* geometry)
  : primTy(primTy), geometry(geometry), root(emptyNode),
    numPrimitives(0), numVertices(0) {}

  BVH8::~BVH8 () {
    for (size_t i=0; i<objects.size(); i++) 
      delete objects[i];
  }

  void BVH8::init(size_t numPrimitives, size_t numThreads)
  {
    /* allocate as much memory as likely needed and reserve conservative amounts of memory */
    cout << "BVH8::init(size_t, size_t) , will I be called and who calls me?" << numPrimitives <<  " " << numThreads <<  endl; 
    
    size_t blockSize = LinearAllocatorPerThread::allocBlockSize;
    cout << "BHV8: blockSize " << blockSize << endl;
    
    size_t numPrimBlocks = primTy.blocks(numPrimitives);
    cout << "BVH8: numPrimBlocks " << numPrimBlocks << endl;
    size_t numAllocatedNodes = min(size_t(0.6*numPrimBlocks),numPrimitives);
    cout << "BVH8: numAllocatedNodes " << numAllocatedNodes << endl;   
    size_t numAllocatedPrimitives = min(size_t(1.2*numPrimBlocks),numPrimitives);
    cout << "BVH8: numAllocatedPrimitives " << numAllocatedPrimitives << endl;
#if defined(__X86_64__)
    size_t numReservedNodes = 2*numPrimitives;
    size_t numReservedPrimitives = 2*numPrimitives;
#else
    size_t numReservedNodes = 1.5*numAllocatedNodes;
    size_t numReservedPrimitives = 1.5*numAllocatedPrimitives;
#endif
    
    size_t bytesAllocated = numAllocatedNodes * sizeof(BVH8::Node) + numAllocatedPrimitives * primTy.bytes;
    cout << "bytesAllocated " << bytesAllocated << endl;
    size_t bytesReserved  = numReservedNodes  * sizeof(BVH8::Node) + numReservedPrimitives  * primTy.bytes;
    bytesReserved         = (bytesReserved+blockSize-1)/blockSize*blockSize + numThreads*blockSize*2;
    cout << "bytesReserved  " << bytesReserved << endl;

    root = emptyNode;
    alloc.init(bytesAllocated,bytesReserved);
  }

  void BVH8::clearBarrier(NodeRef& node)
  {
    if (node.isBarrier())
      node.clearBarrier();
    else if (!node.isLeaf()) {
      Node* n = node.node();
      for (size_t c=0; c<N; c++)
        clearBarrier(n->child(c));
    }
  }

  Accel::Intersectors BVH8Triangle8Intersectors(BVH8* bvh)
  {
    Accel::Intersectors intersectors;
    intersectors.ptr = bvh;
    intersectors.intersector1 = BVH8Triangle8Intersector1Moeller;
    intersectors.intersector4_filter = BVH8Triangle8Intersector4HybridMoeller;
    intersectors.intersector4_nofilter = BVH8Triangle8Intersector4HybridMoellerNoFilter;
    intersectors.intersector8_filter = BVH8Triangle8Intersector8HybridMoeller;
    intersectors.intersector8_nofilter = BVH8Triangle8Intersector8HybridMoellerNoFilter;
    intersectors.intersector16 = NULL;
    return intersectors;
  }

  Accel* BVH8::BVH8Triangle8(Scene* scene)
  { 
      std::cout << " Accel* BVH8::BVH8Triangle8(Scene* scene) " << std::endl;
    BVH8* accel = new BVH8(SceneTriangle8::type,scene);
    Accel::Intersectors intersectors= BVH8Triangle8Intersectors(accel);
    
    Builder* builder = NULL;
    if      (g_tri_builder == "default"     ) builder = BVH8Triangle8Builder(accel,scene,0);
    else if (g_tri_builder == "spatialsplit") builder = BVH8Triangle8Builder(accel,scene,1);
    else if (g_tri_builder == "objectsplit" ) builder = BVH8Triangle8Builder(accel,scene,0);
    else throw std::runtime_error("unknown builder "+g_tri_builder+" for BVH8<Triangle8>");
    
    return new AccelInstance(accel,builder,intersectors);
  }

  Accel* BVH8::BVH8Triangle8ObjectSplit(Scene* scene)
  {
    BVH8* accel = new BVH8(SceneTriangle8::type,scene);
    Accel::Intersectors intersectors= BVH8Triangle8Intersectors(accel);
    Builder* builder = BVH8Triangle8Builder(accel,scene,0);
    return new AccelInstance(accel,builder,intersectors);
  }

  Accel* BVH8::BVH8Triangle8SpatialSplit(Scene* scene)
  {
    BVH8* accel = new BVH8(SceneTriangle8::type,scene);
    Accel::Intersectors intersectors= BVH8Triangle8Intersectors(accel);
    Builder* builder = BVH8Triangle8Builder(accel,scene,1);
    return new AccelInstance(accel,builder,intersectors);
  }
}

