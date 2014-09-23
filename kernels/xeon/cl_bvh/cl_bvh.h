#pragma once
#include "common/accel.h"
#include "embree2/rtcore.h"
#include "common/alloc.h"
#include "common/cl_scene.h"
#include "common/cl_triangleMesh.h"
#include "geometry/primitive.h"

namespace embree {
    struct BVHCLPrimitiveInfo;
    class BVHCL : public Bounded {
	public:
	    struct Node;
	    static const size_t emptyNode = 1;
	    static const size_t N = 2;
	    static const size_t maxLeafBlocks = 6;
	    struct LinearNode {
		BBox3fa bounds;
		size_t primitivesOffset;
		size_t secondChildOffset;
		size_t numPrimitives;
		size_t axis;
	    };

	    struct Node {
		/*  
		__forceinline void clear() {
		    for(int i = 0; i < N; ++i) {
			childLower[i] = Vec3fa(FLT_MAX);
			childUpper[i] = Vec3fa(FLT_MIN);	
		    }
		    for(size_t i = 0; i < N; ++i) children[i] = NULL;
		}
		*/

	      __forceinline void initLeaf(size_t first, size_t n, const BBox3fa& bounds) {
		    firstPrimOffset = first;
		    numPrimitives = n;
		    children[0] = NULL;
		    children[1] = NULL;
		    bound = bounds;
		    isLeaf = true;
	      }

	      __forceinline void initInterior(size_t axis, Node* c0, Node* c1) {
		children[0] = c0;
		children[1] = c1;
		bound = c0->bound;	
		bound.extend(c1->bound);	
		splitAxis = axis;
		numPrimitives = 0;
		isLeaf = false;	
	      }

	      /*  
              __forceinline void setChildBound(size_t i, const BBox3fa& bounds) {
		    assert(i < N);
		    childLower[i].x = bounds.lower.x;
		    childLower[i].y = bounds.lower.y;
		    childLower[i].z = bounds.lower.z;
		    childUpper[i].x = bounds.upper.x;
		    childUpper[i].y = bounds.upper.y;
		    childUpper[i].z = bounds.upper.z;
		    children[i]->bound = bounds; 
		}

		__forceinline BBox3fa bounds() const {
		    BBox3fa ret; 
		    if(children[0] != NULL && children[1] != NULL) {
			ret =  children[0]->bound;
			ret.extend(children[1]->bound);
		    }
		    return ret;
		}

		__forceinline BBox3fa bounds() const { // the bound of the two children's bound
		    Vec3fa lower;
		    Vec3fa upper;
		    float min_x = FLT_MAX;
		    float min_y = FLT_MAX;
		    float min_z = FLT_MAX;
		    for(int i = 0; i < N; ++i) {
			min_x = (childLower[i].x < min_x)?childLower[i].x:min_x;
			min_y = (childLower[i].y < min_y)?childLower[i].y:min_y;
			min_z = (childLower[i].z < min_z)?childLower[i].z:min_z;
			lower.x = min_x;
			lower.y = min_y;
			lower.z = min_z;
		    }
		    float max_x = FLT_MIN;
		    float max_y = FLT_MIN;
		    float max_z = FLT_MIN;
    		    for(int i = 0; i < N; ++i) {
			max_x = (childUpper[i].x > max_x)?childUpper[i].x:max_x;
			max_y = (childUpper[i].y > max_y)?childUpper[i].y:max_y;
			max_z = (childUpper[i].z > max_z)?childUpper[i].z:max_z;
		    }
		    upper.x = max_x;
		    upper.y = max_y;
		    upper.z = max_z;
		     
		    return BBox3fa(lower,upper);
		}
		__forceinline BBox3fa bounds(size_t i) const {
		    assert(i < N);
		    const Vec3fa lower(childLower[i].x,childLower[i].y,childLower[i].z);
		    const Vec3fa upper(childUpper[i].x,childUpper[i].y,childUpper[i].z);
		    return BBox3fa(lower,upper);
		}
		*/
		//__forceinline NodeRef& child(size_t i){ assert(i < N); return children[i];}

		public:
	//	    Vec3fa childLower[N];
	//	    Vec3fa childUpper[N];
		    Node* children[N];
		    BBox3fa bound;
		    size_t numPrimitives;
		    size_t firstPrimOffset;
		    size_t splitAxis;
		    bool isLeaf;
	    };
	public:
	    BVHCL(void* geometry = NULL);
	    ~BVHCL();
	    void init(std::vector<GeometryCL*>&geometries);
	    void traverse(Node* node);
	    Node* recursiveBuild(std::vector<BVHCLPrimitiveInfo> &buildData, size_t start, size_t end, size_t* totalNodes, std::vector<TriangleMeshCL::TriangleCL> orderedPrims);

	private:
	    void createPrimitiveInfo(GeometryCL* geom);
	    float findMin(float a, float b, float c);
	    float findMax(float a, float b, float c);
	    BBox3fa WorldBound(TriangleMeshCL::TriangleCL triangle);   
	    int findMaximumExtent(BBox3fa bounds); 
	public:
	//    const PrimitiveType& primTy;
	    void * geometry;
	   // NodeRef root;
	    Node* root;
	    size_t numPrimitives;
	    size_t numVertices;
	    size_t pc;
	    static Accel* BVHCLTriangle(SceneCL* scene);    
	    std::vector<TriangleMeshCL::TriangleCL> primitives;    
	    std::vector<BVHCLPrimitiveInfo> buildData;
    };
}
