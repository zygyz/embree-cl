FILE(REMOVE_RECURSE
  "tutorial_device.dev.o"
  "tutorial_device.dev_sse2.o"
  "tutorial_device.dev_sse4.o"
  "tutorial_device.dev_avx.o"
  "tutorial_device.dev_avx2.o"
  "tutorial_device_ispc.h"
  "../../../libtutorial_device_ispc.pdb"
  "../../../libtutorial_device_ispc.a"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/tutorial_device_ispc.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
