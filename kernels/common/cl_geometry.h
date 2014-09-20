#pragma once
#include "embree2/rtcore.h"
#include "common/default.h"
namespace embree {
    class SceneCL;


    class GeometryCL {
	public:
	    GeometryCL(SceneCL* scene, size_t numPrimitives,GeometryTyCL type);
	public:
	    virtual void map(RTCBufferType type,void*ptr,size_t size) {
	    }
	    virtual void unmap(RTCBufferType type) {
		
	    }
	    virtual void printinfo() {}

	    virtual void buildPrimitive() {
	    }
	public:
	    SceneCL * parent;
	    ssize_t numPrimitives;
	    unsigned int id;
	    void* userPtr;
	    GeometryTyCL type;

    };
}
