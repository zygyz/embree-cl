//
// /home/gyz/code/work/embree-cl/tutorials/common/tutorial/tutorial_device_ispc.h
// (Header automatically generated by the ispc compiler.)
// DO NOT EDIT THIS FILE.
//

#ifndef ISPC__HOME_GYZ_CODE_WORK_EMBREE_CL_TUTORIALS_COMMON_TUTORIAL_TUTORIAL_DEVICE_ISPC_H
#define ISPC__HOME_GYZ_CODE_WORK_EMBREE_CL_TUTORIALS_COMMON_TUTORIAL_TUTORIAL_DEVICE_ISPC_H

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
    extern void device_key_pressed(int32_t key);
    extern bool device_pick(const float x, const float y, const struct Vec3f &vx, const struct Vec3f &vy, const struct Vec3f &vz, const struct Vec3f &p, struct Vec3f &hitPos);
#if defined(__cplusplus) && !defined(__ISPC_NO_EXTERN_C)
} /* end extern C */
#endif // __cplusplus



#ifdef __cplusplus
} /* namespace */
#endif // __cplusplus

#endif // ISPC__HOME_GYZ_CODE_WORK_EMBREE_CL_TUTORIALS_COMMON_TUTORIAL_TUTORIAL_DEVICE_ISPC_H
