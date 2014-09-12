#pragma once

#include "cl_geometry.h"
#include "cl_scene.h"

namespace embree {
    
    class TriangleMeshCL : public GeometryCL {

	struct TriangleCL {
	    Vec3fa v0;
	    Vec3fa v1;
	    Vec3fa v2;
	    int materialID;
	};

        struct TriangleID {
	    int v0;
	    int v1;
	    int v2;
	    int materialID;
	};

	public:
	    TriangleMeshCL (SceneCL* parent, size_t numTriangles, size_t numVertices);
	public:
	    void map(RTCBufferType type, void* ptr, size_t size); 
	    void unmap(RTCBufferType type);
	    void buildPrimitive();
	    void printinfo();
	public:
	    std::vector<TriangleID> vtriangles;
	    std::vector<Vec3fa> vvertices;
	    std::vector<TriangleCL> vtriangleCL;
	private:
	    void buildTriangleCL();
    };
	    
}
