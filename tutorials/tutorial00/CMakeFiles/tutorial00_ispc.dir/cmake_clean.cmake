FILE(REMOVE_RECURSE
  "tutorial00_device.dev.o"
  "tutorial00_device.dev_sse2.o"
  "tutorial00_device.dev_sse4.o"
  "tutorial00_device.dev_avx.o"
  "tutorial00_device.dev_avx2.o"
  "tutorial00_device_ispc.h"
  "CMakeFiles/tutorial00_ispc.dir/tutorial00.o"
  "../../tutorial00_ispc.pdb"
  "../../tutorial00_ispc"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/tutorial00_ispc.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
