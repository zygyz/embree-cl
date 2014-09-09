# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gyz/code/work/embree-cl

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gyz/code/work/embree-cl

# Include any dependencies generated for this target.
include tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/depend.make

# Include the progress variables for this target.
include tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/progress.make

# Include the compile flags for this target's objects.
include tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/flags.make

tutorials/tutorial00/tutorial00_device.dev.o: tutorials/tutorial00/tutorial00_device.ispc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/work/embree-cl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating tutorial00_device.dev.o, tutorial00_device.dev_sse2.o, tutorial00_device.dev_sse4.o, tutorial00_device.dev_avx.o, tutorial00_device.dev_avx2.o, tutorial00_device_ispc.h"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial00 && mkdir -p /home/gyz/code/work/embree-cl/tutorials/tutorial00 ; ispc -I /home/gyz/code/work/embree-cl/tutorials/tutorial00 -I /home/gyz/code/work/embree-cl -I /home/gyz/code/work/embree-cl/tutorials/common --arch=x86-64 --pic -O3 --target=sse2,sse4,avx,avx2 --woff --opt=fast-math -h /home/gyz/code/work/embree-cl/tutorials/tutorial00/tutorial00_device_ispc.h -MMM /home/gyz/code/work/embree-cl/tutorials/tutorial00/tutorial00_device.dev.idep -o /home/gyz/code/work/embree-cl/tutorials/tutorial00/tutorial00_device.dev.o /home/gyz/code/work/embree-cl/tutorials/tutorial00/tutorial00_device.ispc ;

tutorials/tutorial00/tutorial00_device.dev_sse2.o: tutorials/tutorial00/tutorial00_device.dev.o

tutorials/tutorial00/tutorial00_device.dev_sse4.o: tutorials/tutorial00/tutorial00_device.dev.o

tutorials/tutorial00/tutorial00_device.dev_avx.o: tutorials/tutorial00/tutorial00_device.dev.o

tutorials/tutorial00/tutorial00_device.dev_avx2.o: tutorials/tutorial00/tutorial00_device.dev.o

tutorials/tutorial00/tutorial00_device_ispc.h: tutorials/tutorial00/tutorial00_device.dev.o

tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.o: tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/flags.make
tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.o: tutorials/tutorial00/tutorial00.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/work/embree-cl/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.o"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial00 && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial00_ispc.dir/tutorial00.o -c /home/gyz/code/work/embree-cl/tutorials/tutorial00/tutorial00.cpp

tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial00_ispc.dir/tutorial00.i"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial00 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/work/embree-cl/tutorials/tutorial00/tutorial00.cpp > CMakeFiles/tutorial00_ispc.dir/tutorial00.i

tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial00_ispc.dir/tutorial00.s"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial00 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/work/embree-cl/tutorials/tutorial00/tutorial00.cpp -o CMakeFiles/tutorial00_ispc.dir/tutorial00.s

tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.o.requires:
.PHONY : tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.o.requires

tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.o.provides: tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.o.requires
	$(MAKE) -f tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/build.make tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.o.provides.build
.PHONY : tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.o.provides

tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.o.provides.build: tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.o

# Object files for target tutorial00_ispc
tutorial00_ispc_OBJECTS = \
"CMakeFiles/tutorial00_ispc.dir/tutorial00.o"

# External object files for target tutorial00_ispc
tutorial00_ispc_EXTERNAL_OBJECTS = \
"/home/gyz/code/work/embree-cl/tutorials/tutorial00/tutorial00_device.dev.o" \
"/home/gyz/code/work/embree-cl/tutorials/tutorial00/tutorial00_device.dev_sse2.o" \
"/home/gyz/code/work/embree-cl/tutorials/tutorial00/tutorial00_device.dev_sse4.o" \
"/home/gyz/code/work/embree-cl/tutorials/tutorial00/tutorial00_device.dev_avx.o" \
"/home/gyz/code/work/embree-cl/tutorials/tutorial00/tutorial00_device.dev_avx2.o"

tutorial00_ispc: tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.o
tutorial00_ispc: tutorials/tutorial00/tutorial00_device.dev.o
tutorial00_ispc: tutorials/tutorial00/tutorial00_device.dev_sse2.o
tutorial00_ispc: tutorials/tutorial00/tutorial00_device.dev_sse4.o
tutorial00_ispc: tutorials/tutorial00/tutorial00_device.dev_avx.o
tutorial00_ispc: tutorials/tutorial00/tutorial00_device.dev_avx2.o
tutorial00_ispc: tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/build.make
tutorial00_ispc: libembree.so.2.3.1
tutorial00_ispc: libtutorial.a
tutorial00_ispc: libimage.a
tutorial00_ispc: libtransport.a
tutorial00_ispc: libtutorial_device_ispc.a
tutorial00_ispc: libembree_sse41.a
tutorial00_ispc: libembree_sse42.a
tutorial00_ispc: libembree_avx.a
tutorial00_ispc: libembree_avx2.a
tutorial00_ispc: libsimd.a
tutorial00_ispc: liblexers.a
tutorial00_ispc: /usr/lib64/libGLU.so
tutorial00_ispc: /usr/lib64/libGL.so
tutorial00_ispc: /usr/lib64/libSM.so
tutorial00_ispc: /usr/lib64/libICE.so
tutorial00_ispc: /usr/lib64/libX11.so
tutorial00_ispc: /usr/lib64/libXext.so
tutorial00_ispc: /usr/lib64/libglut.so
tutorial00_ispc: /usr/lib64/libXmu.so
tutorial00_ispc: /usr/lib64/libXi.so
tutorial00_ispc: /usr/lib64/libjpeg.so
tutorial00_ispc: libsys.a
tutorial00_ispc: tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../tutorial00_ispc"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial00 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tutorial00_ispc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/build: tutorial00_ispc
.PHONY : tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/build

tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/requires: tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/tutorial00.o.requires
.PHONY : tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/requires

tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/clean:
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial00 && $(CMAKE_COMMAND) -P CMakeFiles/tutorial00_ispc.dir/cmake_clean.cmake
.PHONY : tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/clean

tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/depend: tutorials/tutorial00/tutorial00_device.dev.o
tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/depend: tutorials/tutorial00/tutorial00_device.dev_sse2.o
tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/depend: tutorials/tutorial00/tutorial00_device.dev_sse4.o
tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/depend: tutorials/tutorial00/tutorial00_device.dev_avx.o
tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/depend: tutorials/tutorial00/tutorial00_device.dev_avx2.o
tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/depend: tutorials/tutorial00/tutorial00_device_ispc.h
	cd /home/gyz/code/work/embree-cl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gyz/code/work/embree-cl /home/gyz/code/work/embree-cl/tutorials/tutorial00 /home/gyz/code/work/embree-cl /home/gyz/code/work/embree-cl/tutorials/tutorial00 /home/gyz/code/work/embree-cl/tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tutorials/tutorial00/CMakeFiles/tutorial00_ispc.dir/depend

