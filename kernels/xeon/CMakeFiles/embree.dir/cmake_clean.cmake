FILE(REMOVE_RECURSE
  "../common/rtcore_ispc.dev.o"
  "../common/rtcore_ispc.dev_sse2.o"
  "../common/rtcore_ispc.dev_sse4.o"
  "../common/rtcore_ispc.dev_avx.o"
  "../common/rtcore_ispc.dev_avx2.o"
  "rtcore_ispc_ispc.h"
  "CMakeFiles/embree.dir/__/common/stat.o"
  "CMakeFiles/embree.dir/__/common/globals.o"
  "CMakeFiles/embree.dir/__/common/alloc.o"
  "CMakeFiles/embree.dir/__/common/tasksys.o"
  "CMakeFiles/embree.dir/__/common/acceln.o"
  "CMakeFiles/embree.dir/__/common/rtcore.o"
  "CMakeFiles/embree.dir/__/common/rtcore_ispc.o"
  "CMakeFiles/embree.dir/__/common/buffer.o"
  "CMakeFiles/embree.dir/__/common/scene.o"
  "CMakeFiles/embree.dir/__/common/geometry.o"
  "CMakeFiles/embree.dir/__/common/scene_user_geometry.o"
  "CMakeFiles/embree.dir/__/common/scene_triangle_mesh.o"
  "CMakeFiles/embree.dir/__/common/scene_bezier_curves.o"
  "CMakeFiles/embree.dir/builders/bezierrefgen.o"
  "CMakeFiles/embree.dir/builders/primrefgen.o"
  "CMakeFiles/embree.dir/builders/heuristic_object_partition_unaligned.o"
  "CMakeFiles/embree.dir/builders/heuristic_object_partition.o"
  "CMakeFiles/embree.dir/builders/heuristic_spatial_split.o"
  "CMakeFiles/embree.dir/builders/heuristic_strand_partition.o"
  "CMakeFiles/embree.dir/builders/heuristic_fallback.o"
  "CMakeFiles/embree.dir/geometry/bezier1.o"
  "CMakeFiles/embree.dir/geometry/bezier1i.o"
  "CMakeFiles/embree.dir/geometry/triangle1.o"
  "CMakeFiles/embree.dir/geometry/triangle4.o"
  "CMakeFiles/embree.dir/geometry/triangle1v.o"
  "CMakeFiles/embree.dir/geometry/triangle4v.o"
  "CMakeFiles/embree.dir/geometry/triangle4i.o"
  "CMakeFiles/embree.dir/geometry/ispc_wrapper_sse.o"
  "CMakeFiles/embree.dir/geometry/instance_intersector1.o"
  "CMakeFiles/embree.dir/geometry/instance_intersector4.o"
  "CMakeFiles/embree.dir/bvh4/bvh4.o"
  "CMakeFiles/embree.dir/bvh4/bvh4_rotate.o"
  "CMakeFiles/embree.dir/bvh4/bvh4_refit.o"
  "CMakeFiles/embree.dir/bvh4/bvh4_builder.o"
  "CMakeFiles/embree.dir/bvh4/bvh4_builder_fast.o"
  "CMakeFiles/embree.dir/bvh4/bvh4_builder_morton.o"
  "CMakeFiles/embree.dir/bvh4/bvh4_builder_binner.o"
  "CMakeFiles/embree.dir/bvh4/bvh4_builder_toplevel.o"
  "CMakeFiles/embree.dir/bvh4/bvh4_intersector1.o"
  "CMakeFiles/embree.dir/bvh4/bvh4_intersector4_chunk.o"
  "CMakeFiles/embree.dir/bvh4/bvh4_statistics.o"
  "CMakeFiles/embree.dir/bvh4mb/bvh4mb.o"
  "CMakeFiles/embree.dir/bvh4mb/bvh4mb_builder.o"
  "CMakeFiles/embree.dir/bvh4mb/bvh4mb_intersector1.o"
  "CMakeFiles/embree.dir/bvh4mb/bvh4mb_intersector4.o"
  "CMakeFiles/embree.dir/bvh4hair/bvh4hair.o"
  "CMakeFiles/embree.dir/bvh4hair/bvh4hair_statistics.o"
  "CMakeFiles/embree.dir/bvh4hair/bvh4hair_builder.o"
  "CMakeFiles/embree.dir/bvh4hair/bvh4hair_intersector1.o"
  "CMakeFiles/embree.dir/bvh4hair/bvh4hair_intersector4.o"
  "../../libembree.pdb"
  "../../libembree.so"
  "../../libembree.so.2.3.1"
  "../../libembree.so.2"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/embree.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)