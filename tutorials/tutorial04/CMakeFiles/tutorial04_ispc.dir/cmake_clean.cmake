FILE(REMOVE_RECURSE
  "tutorial04_device.dev.o"
  "tutorial04_device.dev_sse2.o"
  "tutorial04_device.dev_sse4.o"
  "tutorial04_device.dev_avx.o"
  "tutorial04_device.dev_avx2.o"
  "tutorial04_device_ispc.h"
  "CMakeFiles/tutorial04_ispc.dir/tutorial04.o"
  "../../tutorial04_ispc.pdb"
  "../../tutorial04_ispc"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/tutorial04_ispc.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
