FILE(REMOVE_RECURSE
  "tutorial01_device.dev.o"
  "tutorial01_device.dev_sse2.o"
  "tutorial01_device.dev_sse4.o"
  "tutorial01_device.dev_avx.o"
  "tutorial01_device.dev_avx2.o"
  "tutorial01_device_ispc.h"
  "CMakeFiles/tutorial01_ispc.dir/tutorial01.o"
  "../../tutorial01_ispc.pdb"
  "../../tutorial01_ispc"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/tutorial01_ispc.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
