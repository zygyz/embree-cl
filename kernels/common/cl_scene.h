#pragma once
#include "common/default.h"
#include "cl_geometry.h"
#include "common/acceln.h"

namespace embree {
    class SceneCL {
	public:
	    SceneCL();
	    ~SceneCL() {};
	    void build();
	    unsigned add(GeometryCL* geometry);
	    void remove(GeometryCL* geometry);
	    void intersect(RTCRay& ray);
	    void occluded(RTCRay& ray);
	    void printSceneInfo();
	    void buildPrimitives();
	    GeometryCL* get_geometry(int geomID);
	    unsigned newTriangleMesh(size_t maxTriangle, size_t maxVertices);
	public:
	    int numMappedBuffers;
	    int geom_num;
	    int numTriangleMeshes;
	    int numTriangles;
	public:
	    AccelN acceln;
	    std::vector<GeometryCL*> geometries;
	    std::vector<int> usedIDs;
	private:
	    void buildBVH();
	     
    };
}
