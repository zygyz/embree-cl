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
include tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/depend.make

# Include the progress variables for this target.
include tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/progress.make

# Include the compile flags for this target's objects.
include tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/flags.make

tutorials/tutorial02/tutorial02_device.dev.o: tutorials/tutorial02/tutorial02_device.ispc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/work/embree-cl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating tutorial02_device.dev.o, tutorial02_device.dev_sse2.o, tutorial02_device.dev_sse4.o, tutorial02_device.dev_avx.o, tutorial02_device.dev_avx2.o, tutorial02_device_ispc.h"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial02 && mkdir -p /home/gyz/code/work/embree-cl/tutorials/tutorial02 ; ispc -I /home/gyz/code/work/embree-cl/tutorials/tutorial02 -I /home/gyz/code/work/embree-cl -I /home/gyz/code/work/embree-cl/tutorials/common --arch=x86-64 --pic -O3 --target=sse2,sse4,avx,avx2 --woff --opt=fast-math -h /home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02_device_ispc.h -MMM /home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02_device.dev.idep -o /home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02_device.dev.o /home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02_device.ispc ;

tutorials/tutorial02/tutorial02_device.dev_sse2.o: tutorials/tutorial02/tutorial02_device.dev.o

tutorials/tutorial02/tutorial02_device.dev_sse4.o: tutorials/tutorial02/tutorial02_device.dev.o

tutorials/tutorial02/tutorial02_device.dev_avx.o: tutorials/tutorial02/tutorial02_device.dev.o

tutorials/tutorial02/tutorial02_device.dev_avx2.o: tutorials/tutorial02/tutorial02_device.dev.o

tutorials/tutorial02/tutorial02_device_ispc.h: tutorials/tutorial02/tutorial02_device.dev.o

tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.o: tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/flags.make
tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.o: tutorials/tutorial02/tutorial02.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/work/embree-cl/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.o"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial02 && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial02_ispc.dir/tutorial02.o -c /home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02.cpp

tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial02_ispc.dir/tutorial02.i"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial02 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02.cpp > CMakeFiles/tutorial02_ispc.dir/tutorial02.i

tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial02_ispc.dir/tutorial02.s"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial02 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02.cpp -o CMakeFiles/tutorial02_ispc.dir/tutorial02.s

tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.o.requires:
.PHONY : tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.o.requires

tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.o.provides: tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.o.requires
	$(MAKE) -f tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/build.make tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.o.provides.build
.PHONY : tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.o.provides

tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.o.provides.build: tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.o

# Object files for target tutorial02_ispc
tutorial02_ispc_OBJECTS = \
"CMakeFiles/tutorial02_ispc.dir/tutorial02.o"

# External object files for target tutorial02_ispc
tutorial02_ispc_EXTERNAL_OBJECTS = \
"/home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02_device.dev.o" \
"/home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02_device.dev_sse2.o" \
"/home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02_device.dev_sse4.o" \
"/home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02_device.dev_avx.o" \
"/home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02_device.dev_avx2.o"

tutorial02_ispc: tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.o
tutorial02_ispc: tutorials/tutorial02/tutorial02_device.dev.o
tutorial02_ispc: tutorials/tutorial02/tutorial02_device.dev_sse2.o
tutorial02_ispc: tutorials/tutorial02/tutorial02_device.dev_sse4.o
tutorial02_ispc: tutorials/tutorial02/tutorial02_device.dev_avx.o
tutorial02_ispc: tutorials/tutorial02/tutorial02_device.dev_avx2.o
tutorial02_ispc: tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/build.make
tutorial02_ispc: libembree.so.2.3.1
tutorial02_ispc: libtutorial.a
tutorial02_ispc: libimage.a
tutorial02_ispc: libtransport.a
tutorial02_ispc: libtutorial_device_ispc.a
tutorial02_ispc: libembree_sse41.a
tutorial02_ispc: libembree_sse42.a
tutorial02_ispc: libembree_avx.a
tutorial02_ispc: libembree_avx2.a
tutorial02_ispc: libsimd.a
tutorial02_ispc: liblexers.a
tutorial02_ispc: /usr/lib64/libGLU.so
tutorial02_ispc: /usr/lib64/libGL.so
tutorial02_ispc: /usr/lib64/libSM.so
tutorial02_ispc: /usr/lib64/libICE.so
tutorial02_ispc: /usr/lib64/libX11.so
tutorial02_ispc: /usr/lib64/libXext.so
tutorial02_ispc: /usr/lib64/libglut.so
tutorial02_ispc: /usr/lib64/libXmu.so
tutorial02_ispc: /usr/lib64/libXi.so
tutorial02_ispc: /usr/lib64/libjpeg.so
tutorial02_ispc: libsys.a
tutorial02_ispc: tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../tutorial02_ispc"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial02 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tutorial02_ispc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/build: tutorial02_ispc
.PHONY : tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/build

tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/requires: tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/tutorial02.o.requires
.PHONY : tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/requires

tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/clean:
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial02 && $(CMAKE_COMMAND) -P CMakeFiles/tutorial02_ispc.dir/cmake_clean.cmake
.PHONY : tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/clean

tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/depend: tutorials/tutorial02/tutorial02_device.dev.o
tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/depend: tutorials/tutorial02/tutorial02_device.dev_sse2.o
tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/depend: tutorials/tutorial02/tutorial02_device.dev_sse4.o
tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/depend: tutorials/tutorial02/tutorial02_device.dev_avx.o
tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/depend: tutorials/tutorial02/tutorial02_device.dev_avx2.o
tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/depend: tutorials/tutorial02/tutorial02_device_ispc.h
	cd /home/gyz/code/work/embree-cl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gyz/code/work/embree-cl /home/gyz/code/work/embree-cl/tutorials/tutorial02 /home/gyz/code/work/embree-cl /home/gyz/code/work/embree-cl/tutorials/tutorial02 /home/gyz/code/work/embree-cl/tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tutorials/tutorial02/CMakeFiles/tutorial02_ispc.dir/depend

