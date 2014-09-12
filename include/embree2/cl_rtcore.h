#ifndef __CL_RTCORE_H
#define __CL_RTCORE_H
#include <stddef.h>

#ifndef RTCORE_API
#ifdef _WIN32
# define RTCORE_API extern "C" __declspec(dllimport)
#else
# define RTCORE_API extern "C" 
#endif
#endif

typedef struct __CLRTScene {}* CLRTScene;

enum GeometryTyCL { TRIANGLE_MESH = 1, USER_GEOMETRY = 2, BEZIER_CURVES = 4};

RTCORE_API void clrtInit(const char* cfg = NULL);

RTCORE_API CLRTScene clrtNewScene();

RTCORE_API void clrtCommit(CLRTScene scene);

RTCORE_API void clrtIntersect(CLRTScene scene, RTCRay& ray);

RTCORE_API void clrtOccluded(CLRTScene scene, RTCRay& ray);

RTCORE_API unsigned clrtNewTriangleMesh(CLRTScene scene, size_t numTriangles, size_t numVertices);

RTCORE_API unsigned clrtSetBuffer(CLRTScene scene, unsigned geomID, RTCBufferType type, void* ptr,size_t size);

RTCORE_API void clrtPrintSceneInfo(CLRTScene scene);

RTCORE_API void clrtBuildPrimitives(CLRTScene scene);
#endif
