#include "common/cl_scene.h"

namespace embree {

   RTCORE_API void clrtInit(const char* cfg) {
   }
 
   RTCORE_API CLRTScene clrtNewScene() {
	return (CLRTScene) new SceneCL();
   }

   RTCORE_API void clrtCommit(CLRTScene scene) {
	((SceneCL*)scene)->build();
   }
  
   RTCORE_API void clrtIntersect(CLRTScene scene, RTCRay & ray) {
	((SceneCL*)scene)->intersect(ray);
   }

   RTCORE_API void clrtOccluded(CLRTScene scene, RTCRay & ray) {
	((SceneCL*)scene)->occluded(ray);
   }

   RTCORE_API unsigned clrtNewTriangleMesh(CLRTScene scene, size_t numTriangles, size_t numVertices) {
	return ((SceneCL*)scene)->newTriangleMesh(numTriangles,numVertices);
   }

   RTCORE_API unsigned  clrtSetBuffer(CLRTScene scene, unsigned geomID, RTCBufferType type, void* ptr,size_t size) {
	((SceneCL*)scene)->get_geometry(geomID)->map(type,ptr,size);
	return 0;
   }
   RTCORE_API void clrtBuildPrimitives(CLRTScene scene) {
	((SceneCL*)scene)->buildPrimitives();
   }
   RTCORE_API void clrtPrintSceneInfo(CLRTScene scene) {
       std::cout << "CLRT PRINT SCENE INFO " << std::endl;
	((SceneCL*)scene)->printSceneInfo();
   }
}

