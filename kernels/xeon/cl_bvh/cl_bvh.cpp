#include "cl_bvh.h"
#include "common/cl_triangleMesh.h"
#include "common/accelinstance.h"

namespace embree {
    struct BVHCLPrimitiveInfo {
	BVHCLPrimitiveInfo(){}

    BVHCLPrimitiveInfo(int pn, const BBox3fa &b):primitiveNumber(pn),bounds(b) {
	std::cout << "BVHCLPrimitiveInfo bounds lower : " << b.lower << " "  << b.upper << std::endl;
	centroid = .5f * b.lower + .5f * b.upper;
	std::cout << "BVHCLPrimitiveInfo centroid " << centroid << std::endl;
    }
	int primitiveNumber;
	Vec3fa centroid;
	BBox3fa bounds;
    };

    struct CompareToMid {
	CompareToMid(int d, float m) {dim = d; mid = m;}
	int dim;
	float mid;
	bool operator() (const BVHCLPrimitiveInfo & a) const {
	    return a.centroid[dim] < mid;
	}
    };
    
    BVHCL::BVHCL(void * geometry): geometry(geometry),root(NULL),numPrimitives(0),numVertices(0),pc(0){}

    BVHCL::~BVHCL() {
    }
/*  
    Accel::Intersectors BVHCLTriangleIntersectors(BVHCL* bvh) {
	Accel::Intersectors intersectors;
	intersectors.ptr = bvh;
	intersectors.intersector1 = NULL;	
	return intersectors;
    }
 */
     
    Accel* BVHCL::BVHCLTriangle(SceneCL* scene) {
	BVHCL* accel = new BVHCL(NULL);
	Accel::Intersectors intersectors;
	Builder* builder = NULL;
	return new AccelInstance(accel,builder,intersectors);
    }

    void BVHCL::createPrimitiveInfo(GeometryCL* geom) {
	BVHCLPrimitiveInfo info;		
	TriangleMeshCL* ptr=  (TriangleMeshCL*)geom;	
	int triangleNumber = ptr->vtriangleCL.size();
	for(int i = 0; i < triangleNumber; ++i) {
	    BBox3fa bbox = WorldBound(ptr->vtriangleCL[i]);
	    buildData.push_back(BVHCLPrimitiveInfo(pc++,bbox));
	    primitives.push_back(ptr->vtriangleCL[i]);
	}
    }

    float BVHCL::findMin(float a,float b,float c) {
	if(a < b) {
	    if(a < c) return a;
	    else return c;
	}else {
	    if(b < c) return b;
	    else return c;
	}
    }

    float BVHCL::findMax(float a,float b,float c) {
	if(a > b) {
	    if(a > c) return a;
	    else return c;
	}else {
	    if(b > c) return b;
	    else return c;
	}
    }

    BBox3fa BVHCL::WorldBound(TriangleMeshCL::TriangleCL triangle) {
	Vec3fa v0 = triangle.v0;
	Vec3fa v1 = triangle.v1;
	Vec3fa v2 = triangle.v2;
	float minX = findMin(v0.x,v1.x,v2.x);
	float minY = findMin(v0.y,v1.y,v2.y);
	float minZ = findMin(v0.z,v1.z,v2.z);
	float maxX = findMax(v0.x,v1.x,v2.x);
	float maxY = findMax(v0.y,v1.y,v2.y);
	float maxZ = findMax(v0.z,v1.z,v2.z);
	Vec3fa lower = Vec3fa(minX,minY,minZ);
	Vec3fa upper = Vec3fa(maxX,maxY,maxZ);
	BBox3fa ret(lower,upper);
	return ret;
    }

    BVHCL::Node* BVHCL::recursiveBuild(std::vector<BVHCLPrimitiveInfo>&buildData, size_t start, size_t end , size_t * totalNodes, std::vector<TriangleMeshCL::TriangleCL> orderedPrims) {
	(*totalNodes)++;
	Node* node = new Node;
	BBox3fa bbox;
	bbox.lower = Vec3fa(FLT_MAX);
	bbox.upper = Vec3fa(-FLT_MAX);
	std::cout << "initial bbox lower : " << bbox.lower << " " << "initial bbox upper:  " << bbox.upper << std::endl;
	for(size_t i = start; i < end; ++i) {
	     std::cout << "extending bounds: " << buildData[i].bounds.lower << " " << buildData[i].bounds.upper << std::endl;
	     bbox.extend(buildData[i].bounds);
	} 
	std::cout << "extended bounds: " << bbox.lower << " " << bbox.upper << std::endl;
	std::cout << " start " << start << " end " << end << std::endl;
	size_t nPrimitives = end - start;
	std::cout << "num Primitives ss " << nPrimitives << std::endl;
	if(nPrimitives == 1) {
	    size_t firstPrimOffset = orderedPrims.size();
	    for(size_t i = start; i < end; ++i) {
		size_t primNum = buildData[i].primitiveNumber;
		orderedPrims.push_back(primitives[primNum]);
		std::cout << "np = 1,ordered prims push back " << std::endl;
	    }
	    node->initLeaf(firstPrimOffset, nPrimitives,bbox);	 
	}
	else {
	    BBox3fa centroidBounds;
	    centroidBounds.lower = Vec3fa(FLT_MAX);
	    centroidBounds.upper = Vec3fa(-FLT_MAX);
	    std::cout << "init centroidBounds.upper " << centroidBounds.upper << std::endl;
	    std::cout << "init centroidBounds.lower " << centroidBounds.lower << std::endl;
	    for(size_t i = start; i < end; ++i) {
		std::cout << "extending centroid bound " << buildData[i].centroid << std:: endl;
		centroidBounds.extend(buildData[i].centroid);
	    }
	    int dim = findMaximumExtent(centroidBounds);
	    std::cout << " dim " << dim << std::endl;
	    size_t mid = (start + end)/2;
	    std::cout << "ok centroidBounds.upper " << centroidBounds.upper << std::endl;
	    std::cout << "ok centroidBounds.lower " << centroidBounds.lower << std::endl;
	    if(centroidBounds.upper[dim] == centroidBounds.lower[dim]) {
		std::cout << " upper[dim] == lower[dim] "  << std::endl;
	    size_t firstPrimOffset = orderedPrims.size();
	    for(size_t i = start; i < end; ++i) {
		size_t primNum = buildData[i].primitiveNumber;
		orderedPrims.push_back(primitives[primNum]);
		std::cout << "ordered prims push back " << std::endl;
	    }
		std::cout << "init leaf " << std::endl;		 		       node->initLeaf(firstPrimOffset,nPrimitives,bbox);
		return node;
	    }
	    
	    float pmid = .5f * (centroidBounds.lower[dim] + centroidBounds.upper[dim]);
	    std::cout << " pmid  " << pmid << std::endl;
	    BVHCLPrimitiveInfo *midPtr = std::partition(&buildData[start],&buildData[end-1]+1,CompareToMid(dim,pmid));
	    mid = midPtr - &buildData[0];
	    std::cout << "partition mid " << mid << std::endl;
	    if(mid != start && mid != end)  {
		node->initInterior(dim, recursiveBuild(buildData,start,mid,totalNodes,orderedPrims),recursiveBuild(buildData,mid,end,totalNodes,orderedPrims));
	    }
	}
	return node;
    }


    int BVHCL::findMaximumExtent(BBox3fa bounds) {
	Vec3fa diag = bounds.upper - bounds.lower;
	if(diag.x > diag.y && diag.x > diag.z) 
	    return 0;
	else if(diag.y > diag.z)
	    return 1;
	else 
	    return 2;
    }
    
    void BVHCL::traverse(Node* node) {
	std::cout << "traverse " << std::endl;
	if(node != NULL) {
	    std::cout << "traverse: node->bound.lower : " << node->bound.lower << " upper : " << node->bound.upper << std::endl;
	    if(node->isLeaf) {
		std::cout << "traverse leaf , firstPrimOffset " << node->firstPrimOffset << std::endl;
	    }
	    traverse(node->children[0]);
	    traverse(node->children[1]);
	} else {
	    return;
	}
    }

    void BVHCL::init(std::vector<GeometryCL*> &geometries) {
	std::cout << "BVHCL INITIALIZATION" << std::endl;
	int size = geometries.size();
	for(int i = 0; i < size; ++i) {
	    GeometryCL* geom = geometries[i]; 
	    geom->printinfo();
	    createPrimitiveInfo(geom); 
	}
	std::vector<TriangleMeshCL::TriangleCL> orderedPrims;
	orderedPrims.reserve(pc);
	size_t totalNodes = 0;
	std::cout << "pc : " << primitives.size() << std::endl;
	for(int i = 0 ; i < primitives.size(); ++i) {
	    std::cout << "bvh init Prim: "  << primitives[i].v0 << " " << primitives[i].v1 << " " << primitives[i].v2 << std::endl;

	}
	root = recursiveBuild(buildData,0,primitives.size(),&totalNodes,orderedPrims);

	for(int i = 0 ; i < orderedPrims.size(); ++i) {
	    std::cout << "bvh init orderedPrims: "  << orderedPrims[i].v0 << " " << orderedPrims[i].v1 << " " << orderedPrims[i].v2 << std::endl;

	}
	primitives.swap(orderedPrims);
	for(int i = 0; i < buildData.size(); ++i) {
	    BVHCLPrimitiveInfo info = buildData[i];
	    std::cout << "bounds lower: " << info.bounds.lower << " upper " << info.bounds.upper << std::endl;
	}
	traverse(root);
	std::cout << "node number : " << totalNodes << std::endl;			

    }
}
