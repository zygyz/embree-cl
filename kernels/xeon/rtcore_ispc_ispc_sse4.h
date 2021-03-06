//
// /home/gyz/code/good/embree-cl/kernels/xeon/rtcore_ispc_ispc_sse4.h
// (Header automatically generated by the ispc compiler.)
// DO NOT EDIT THIS FILE.
//

#ifndef ISPC__HOME_GYZ_CODE_GOOD_EMBREE_CL_KERNELS_XEON_RTCORE_ISPC_ISPC_SSE4_H
#define ISPC__HOME_GYZ_CODE_GOOD_EMBREE_CL_KERNELS_XEON_RTCORE_ISPC_ISPC_SSE4_H

#include <stdint.h>



#ifdef __cplusplus
namespace ispc { /* namespace */
#endif // __cplusplus
///////////////////////////////////////////////////////////////////////////
// Enumerator types with external visibility from ispc code
///////////////////////////////////////////////////////////////////////////

#ifndef __ISPC_ENUM_RTCError__
#define __ISPC_ENUM_RTCError__
enum RTCError {
    RTC_NO_ERROR = 0,
    RTC_UNKNOWN_ERROR = 1,
    RTC_INVALID_ARGUMENT = 2,
    RTC_INVALID_OPERATION = 3,
    RTC_OUT_OF_MEMORY = 4,
    RTC_UNSUPPORTED_CPU = 5 
};
#endif

#ifndef __ISPC_ENUM_RTCBufferType__
#define __ISPC_ENUM_RTCBufferType__
enum RTCBufferType {
    RTC_INDEX_BUFFER = 16777216,
    RTC_VERTEX_BUFFER = 33554432,
    RTC_VERTEX_BUFFER0 = 33554432,
    RTC_VERTEX_BUFFER1 = 33554433 
};
#endif

#ifndef __ISPC_ENUM_RTCGeometryFlags__
#define __ISPC_ENUM_RTCGeometryFlags__
enum RTCGeometryFlags {
    RTC_GEOMETRY_STATIC = 0,
    RTC_GEOMETRY_DEFORMABLE = 1,
    RTC_GEOMETRY_DYNAMIC = 2 
};
#endif

#ifndef __ISPC_ENUM_RTCSceneFlags__
#define __ISPC_ENUM_RTCSceneFlags__
enum RTCSceneFlags {
    RTC_SCENE_STATIC = 0,
    RTC_SCENE_DYNAMIC = 1,
    RTC_SCENE_COMPACT = 256,
    RTC_SCENE_COHERENT = 512,
    RTC_SCENE_INCOHERENT = 1024,
    RTC_SCENE_HIGH_QUALITY = 2048,
    RTC_SCENE_ROBUST = 65536 
};
#endif

#ifndef __ISPC_ENUM_RTCAlgorithmFlags__
#define __ISPC_ENUM_RTCAlgorithmFlags__
enum RTCAlgorithmFlags {
    RTC_INTERSECT_UNIFORM = 1,
    RTC_INTERSECT_VARYING = 2 
};
#endif

#ifndef __ISPC_ENUM_RTCMatrixType__
#define __ISPC_ENUM_RTCMatrixType__
enum RTCMatrixType {
    RTC_MATRIX_ROW_MAJOR = 0,
    RTC_MATRIX_COLUMN_MAJOR = 1,
    RTC_MATRIX_COLUMN_MAJOR_ALIGNED16 = 2 
};
#endif

#ifndef __ISPC_STRUCT___RTCScene__
#define __ISPC_STRUCT___RTCScene__
struct __RTCScene {
};
#endif



#ifdef __cplusplus
} /* namespace */
#endif // __cplusplus

#endif // ISPC__HOME_GYZ_CODE_GOOD_EMBREE_CL_KERNELS_XEON_RTCORE_ISPC_ISPC_SSE4_H
