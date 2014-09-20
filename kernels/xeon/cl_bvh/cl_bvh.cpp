#include "cl_bvh.h"
#include "common/cl_triangleMesh.h"
#include "common/accelinstance.h"

namespace embree {
    struct BVHCLPrimitiveInfo {
	BVHCLPrimitiveInfo(){}

    BVHCLPrimitiveInfo(int pn, const BBox3fa &b):primitiveNumber(pn),bounds(b) {
	centroid = .5f * b.lower + .5f * b.upper;
    }
	int primitiveNumber;
	Vec3fa centroid;
	BBox3fa bounds;
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

    void BVHCL::init(std::vector<GeometryCL*> &geometries) {
	std::cout << "BVHCL INITIALIZATION" << std::endl;
	int size = geometries.size();
	for(int i = 0; i < size; ++i) {
	    GeometryCL* geom = geometries[i]; 
	    geom->printinfo();
	    createPrimitiveInfo(geom); 
	}

	for(int i = 0; i < buildData.size(); ++i) {
	    BVHCLPrimitiveInfo info = buildData[i];
	    std::cout << "bounds lower: " << info.bounds.lower << " upper " << info.bounds.upper << std::endl;
	}
	
	root = NULL;
    }
}
