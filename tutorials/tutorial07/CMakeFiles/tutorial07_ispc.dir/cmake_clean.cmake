FILE(REMOVE_RECURSE
  "tutorial07_device.dev.o"
  "tutorial07_device.dev_sse2.o"
  "tutorial07_device.dev_sse4.o"
  "tutorial07_device.dev_avx.o"
  "tutorial07_device.dev_avx2.o"
  "tutorial07_device_ispc.h"
  "CMakeFiles/tutorial07_ispc.dir/tutorial07.o"
  "../../tutorial07_ispc.pdb"
  "../../tutorial07_ispc"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/tutorial07_ispc.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
