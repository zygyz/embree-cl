#include "cl_scene.h"
#include "cl_triangleMesh.h"
#include "default.h"
struct RTCRay;
namespace embree {
    SceneCL::SceneCL() {
	geom_num = 0;
	numTriangleMeshes = 0;
	numMappedBuffers = 0;
	numTriangles = 0;
	geometries.reserve(128);
	std::cout << "construct geometries.size() " << geometries.size() << std::endl;
    }
    
    void SceneCL::buildBVH() {
	std::cout << "build BVH " << std::endl;
	// to do: bvh->build();
    }
      
    void SceneCL::build() {
        buildBVH();		
    }

    unsigned SceneCL::add(GeometryCL* geometry) {
	// assume the geometry is triangle;
	std::cout << "start SceneCL::add " << std::endl;
	if(geometry->type == TRIANGLE_MESH) {
	std::cout << "type == TRIANGLE_MESH  " << std::endl;
	    numTriangles += geometry->numPrimitives;
	    numTriangleMeshes += 1;
	    std::cout << "push_back " << std::endl;
	    std::cout << "geometries.size " << geometries.size() << std::endl;
	    geometries.push_back(geometry);
	    std::cout << "push_back ok " << std::endl;
	    return geometries.size()-1;
	}
	std::cout << "end SceneCL " << std::endl;
    }

    void SceneCL::remove(GeometryCL* geometry) {
	usedIDs.push_back(geometry->id);
	geometries[geometry->id] = NULL;
	if(geometry->type == TRIANGLE_MESH) {
	    numTriangles -= geometry->numPrimitives;
	    numTriangleMeshes -= 1;
	}
	delete geometry;
    }

    void SceneCL::occluded(RTCRay& ray) {

    }

    void SceneCL::intersect(RTCRay& ray) {
	std::cout << " intersect " << std::endl;
    }

    unsigned SceneCL::newTriangleMesh(size_t numTriangle, size_t numVertices) {
	std::cout << "SceneCL::newTriangleMesh " << std::endl;
	GeometryCL* geom = (GeometryCL*) new TriangleMeshCL(this, numTriangle, numVertices);
	unsigned id = geom->id;
	return id;
    }
    
    GeometryCL* SceneCL::get_geometry(int geomID) {
	return geometries[geomID];
    }

    void SceneCL::printSceneInfo() {
	std::cout << "SceneCL::printSceneInfo() " << std::endl;
	std::cout << "geometries.size() " << geometries.size() << std::endl;
	for(int i = 0; i < geometries.size(); ++i) {
	    std::cout << "geometries[" << i << "]->printinfo() " << std::endl;
	    geometries[i]->printinfo();
	}
    }
    
    void SceneCL::buildPrimitives() {
	for(int i = 0; i < geometries.size(); ++i) {
	    geometries[i]->buildPrimitive();
	}
    }
}
