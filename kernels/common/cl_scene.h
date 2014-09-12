#pragma once
#include "common/default.h"
#include "cl_geometry.h"

namespace embree {
    class SceneCL {
	public:
	    SceneCL();
	    ~SceneCL() {};
	    void buildBVH();
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
	    std::vector<GeometryCL*> geometries;
	    std::vector<int> usedIDs;
		
    };
}
