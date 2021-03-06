//
// /home/gyz/code/work/embree-cl/tutorials/tutorial07/tutorial07_device_ispc_sse4.h
// (Header automatically generated by the ispc compiler.)
// DO NOT EDIT THIS FILE.
//

#ifndef ISPC__HOME_GYZ_CODE_WORK_EMBREE_CL_TUTORIALS_TUTORIAL07_TUTORIAL07_DEVICE_ISPC_SSE4_H
#define ISPC__HOME_GYZ_CODE_WORK_EMBREE_CL_TUTORIALS_TUTORIAL07_TUTORIAL07_DEVICE_ISPC_SSE4_H

#include <stdint.h>



#ifdef __cplusplus
namespace ispc { /* namespace */
#endif // __cplusplus
#ifndef __ISPC_STRUCT_Vec3f__
#define __ISPC_STRUCT_Vec3f__
struct Vec3f {
    float x;
    float y;
    float z;
};
#endif


///////////////////////////////////////////////////////////////////////////
// Functions exported from ispc code
///////////////////////////////////////////////////////////////////////////
#if defined(__cplusplus) && !defined(__ISPC_NO_EXTERN_C)
extern "C" {
#endif // __cplusplus
    extern void device_cleanup();
    extern void device_init(int8_t * cfg);
    extern void device_render(int32_t * pixels, const int32_t width, const int32_t height, const float time, const struct Vec3f &vx, const struct Vec3f &vy, const struct Vec3f &vz, const struct Vec3f &p);
#if defined(__cplusplus) && !defined(__ISPC_NO_EXTERN_C)
} /* end extern C */
#endif // __cplusplus


#ifdef __cplusplus
} /* namespace */
#endif // __cplusplus

#endif // ISPC__HOME_GYZ_CODE_WORK_EMBREE_CL_TUTORIALS_TUTORIAL07_TUTORIAL07_DEVICE_ISPC_SSE4_H
