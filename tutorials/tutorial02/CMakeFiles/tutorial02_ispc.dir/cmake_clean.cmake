FILE(REMOVE_RECURSE
  "tutorial02_device.dev.o"
  "tutorial02_device.dev_sse2.o"
  "tutorial02_device.dev_sse4.o"
  "tutorial02_device.dev_avx.o"
  "tutorial02_device.dev_avx2.o"
  "tutorial02_device_ispc.h"
  "CMakeFiles/tutorial02_ispc.dir/tutorial02.o"
  "../../tutorial02_ispc.pdb"
  "../../tutorial02_ispc"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/tutorial02_ispc.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
