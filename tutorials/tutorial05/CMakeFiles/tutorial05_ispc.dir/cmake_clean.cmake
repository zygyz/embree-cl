FILE(REMOVE_RECURSE
  "tutorial05_device.dev.o"
  "tutorial05_device.dev_sse2.o"
  "tutorial05_device.dev_sse4.o"
  "tutorial05_device.dev_avx.o"
  "tutorial05_device.dev_avx2.o"
  "tutorial05_device_ispc.h"
  "CMakeFiles/tutorial05_ispc.dir/tutorial05.o"
  "../../tutorial05_ispc.pdb"
  "../../tutorial05_ispc"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/tutorial05_ispc.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
