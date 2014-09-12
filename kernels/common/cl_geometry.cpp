#include "cl_geometry.h"
#include "cl_scene.h"
namespace embree {
    GeometryCL::GeometryCL(SceneCL * parent, size_t numPrimitives,GeometryTyCL gtype):parent(parent),numPrimitives(numPrimitives),id(0),userPtr(NULL),type(gtype){
	std::cout << "id id: " << id << std::endl;
	id = parent->add(this);
	std::cout << "end parent->add " << std::endl;
    }
}
