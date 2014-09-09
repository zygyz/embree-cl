FILE(REMOVE_RECURSE
  "tutorial03_device.dev.o"
  "tutorial03_device.dev_sse2.o"
  "tutorial03_device.dev_sse4.o"
  "tutorial03_device.dev_avx.o"
  "tutorial03_device.dev_avx2.o"
  "tutorial03_device_ispc.h"
  "CMakeFiles/tutorial03_ispc.dir/tutorial03.o"
  "../../tutorial03_ispc.pdb"
  "../../tutorial03_ispc"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/tutorial03_ispc.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
