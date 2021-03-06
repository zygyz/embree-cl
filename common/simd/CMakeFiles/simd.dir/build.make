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
CMAKE_SOURCE_DIR = /home/gyz/code/good/embree-cl

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gyz/code/good/embree-cl

# Include any dependencies generated for this target.
include common/simd/CMakeFiles/simd.dir/depend.make

# Include the progress variables for this target.
include common/simd/CMakeFiles/simd.dir/progress.make

# Include the compile flags for this target's objects.
include common/simd/CMakeFiles/simd.dir/flags.make

common/simd/CMakeFiles/simd.dir/sse.o: common/simd/CMakeFiles/simd.dir/flags.make
common/simd/CMakeFiles/simd.dir/sse.o: common/simd/sse.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object common/simd/CMakeFiles/simd.dir/sse.o"
	cd /home/gyz/code/good/embree-cl/common/simd && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/simd.dir/sse.o -c /home/gyz/code/good/embree-cl/common/simd/sse.cpp

common/simd/CMakeFiles/simd.dir/sse.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/simd.dir/sse.i"
	cd /home/gyz/code/good/embree-cl/common/simd && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/common/simd/sse.cpp > CMakeFiles/simd.dir/sse.i

common/simd/CMakeFiles/simd.dir/sse.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/simd.dir/sse.s"
	cd /home/gyz/code/good/embree-cl/common/simd && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/common/simd/sse.cpp -o CMakeFiles/simd.dir/sse.s

common/simd/CMakeFiles/simd.dir/sse.o.requires:
.PHONY : common/simd/CMakeFiles/simd.dir/sse.o.requires

common/simd/CMakeFiles/simd.dir/sse.o.provides: common/simd/CMakeFiles/simd.dir/sse.o.requires
	$(MAKE) -f common/simd/CMakeFiles/simd.dir/build.make common/simd/CMakeFiles/simd.dir/sse.o.provides.build
.PHONY : common/simd/CMakeFiles/simd.dir/sse.o.provides

common/simd/CMakeFiles/simd.dir/sse.o.provides.build: common/simd/CMakeFiles/simd.dir/sse.o

# Object files for target simd
simd_OBJECTS = \
"CMakeFiles/simd.dir/sse.o"

# External object files for target simd
simd_EXTERNAL_OBJECTS =

libsimd.a: common/simd/CMakeFiles/simd.dir/sse.o
libsimd.a: common/simd/CMakeFiles/simd.dir/build.make
libsimd.a: common/simd/CMakeFiles/simd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library ../../libsimd.a"
	cd /home/gyz/code/good/embree-cl/common/simd && $(CMAKE_COMMAND) -P CMakeFiles/simd.dir/cmake_clean_target.cmake
	cd /home/gyz/code/good/embree-cl/common/simd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/simd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
common/simd/CMakeFiles/simd.dir/build: libsimd.a
.PHONY : common/simd/CMakeFiles/simd.dir/build

common/simd/CMakeFiles/simd.dir/requires: common/simd/CMakeFiles/simd.dir/sse.o.requires
.PHONY : common/simd/CMakeFiles/simd.dir/requires

common/simd/CMakeFiles/simd.dir/clean:
	cd /home/gyz/code/good/embree-cl/common/simd && $(CMAKE_COMMAND) -P CMakeFiles/simd.dir/cmake_clean.cmake
.PHONY : common/simd/CMakeFiles/simd.dir/clean

common/simd/CMakeFiles/simd.dir/depend:
	cd /home/gyz/code/good/embree-cl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gyz/code/good/embree-cl /home/gyz/code/good/embree-cl/common/simd /home/gyz/code/good/embree-cl /home/gyz/code/good/embree-cl/common/simd /home/gyz/code/good/embree-cl/common/simd/CMakeFiles/simd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : common/simd/CMakeFiles/simd.dir/depend

