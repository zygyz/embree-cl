FILE(REMOVE_RECURSE
  "tutorial06_device.dev.o"
  "tutorial06_device.dev_sse2.o"
  "tutorial06_device.dev_sse4.o"
  "tutorial06_device.dev_avx.o"
  "tutorial06_device.dev_avx2.o"
  "tutorial06_device_ispc.h"
  "CMakeFiles/tutorial06_ispc.dir/tutorial06.o"
  "../../tutorial06_ispc.pdb"
  "../../tutorial06_ispc"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/tutorial06_ispc.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
