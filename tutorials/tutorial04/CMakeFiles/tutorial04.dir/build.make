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
include tutorials/tutorial04/CMakeFiles/tutorial04.dir/depend.make

# Include the progress variables for this target.
include tutorials/tutorial04/CMakeFiles/tutorial04.dir/progress.make

# Include the compile flags for this target's objects.
include tutorials/tutorial04/CMakeFiles/tutorial04.dir/flags.make

tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.o: tutorials/tutorial04/CMakeFiles/tutorial04.dir/flags.make
tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.o: tutorials/tutorial04/tutorial04.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/work/embree-cl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.o"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial04 && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial04.dir/tutorial04.o -c /home/gyz/code/work/embree-cl/tutorials/tutorial04/tutorial04.cpp

tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial04.dir/tutorial04.i"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial04 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/work/embree-cl/tutorials/tutorial04/tutorial04.cpp > CMakeFiles/tutorial04.dir/tutorial04.i

tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial04.dir/tutorial04.s"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial04 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/work/embree-cl/tutorials/tutorial04/tutorial04.cpp -o CMakeFiles/tutorial04.dir/tutorial04.s

tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.o.requires:
.PHONY : tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.o.requires

tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.o.provides: tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.o.requires
	$(MAKE) -f tutorials/tutorial04/CMakeFiles/tutorial04.dir/build.make tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.o.provides.build
.PHONY : tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.o.provides

tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.o.provides.build: tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.o

tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.o: tutorials/tutorial04/CMakeFiles/tutorial04.dir/flags.make
tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.o: tutorials/tutorial04/tutorial04_device.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/work/embree-cl/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.o"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial04 && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial04.dir/tutorial04_device.o -c /home/gyz/code/work/embree-cl/tutorials/tutorial04/tutorial04_device.cpp

tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial04.dir/tutorial04_device.i"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial04 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/work/embree-cl/tutorials/tutorial04/tutorial04_device.cpp > CMakeFiles/tutorial04.dir/tutorial04_device.i

tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial04.dir/tutorial04_device.s"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial04 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/work/embree-cl/tutorials/tutorial04/tutorial04_device.cpp -o CMakeFiles/tutorial04.dir/tutorial04_device.s

tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.o.requires:
.PHONY : tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.o.requires

tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.o.provides: tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.o.requires
	$(MAKE) -f tutorials/tutorial04/CMakeFiles/tutorial04.dir/build.make tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.o.provides.build
.PHONY : tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.o.provides

tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.o.provides.build: tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.o

# Object files for target tutorial04
tutorial04_OBJECTS = \
"CMakeFiles/tutorial04.dir/tutorial04.o" \
"CMakeFiles/tutorial04.dir/tutorial04_device.o"

# External object files for target tutorial04
tutorial04_EXTERNAL_OBJECTS =

tutorial04: tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.o
tutorial04: tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.o
tutorial04: tutorials/tutorial04/CMakeFiles/tutorial04.dir/build.make
tutorial04: libembree.so.2.3.1
tutorial04: libtutorial.a
tutorial04: libimage.a
tutorial04: libtransport.a
tutorial04: libtutorial_device.a
tutorial04: libembree_sse41.a
tutorial04: libembree_sse42.a
tutorial04: libembree_avx.a
tutorial04: libembree_avx2.a
tutorial04: libsimd.a
tutorial04: liblexers.a
tutorial04: /usr/lib64/libGLU.so
tutorial04: /usr/lib64/libGL.so
tutorial04: /usr/lib64/libSM.so
tutorial04: /usr/lib64/libICE.so
tutorial04: /usr/lib64/libX11.so
tutorial04: /usr/lib64/libXext.so
tutorial04: /usr/lib64/libglut.so
tutorial04: /usr/lib64/libXmu.so
tutorial04: /usr/lib64/libXi.so
tutorial04: /usr/lib64/libjpeg.so
tutorial04: libsys.a
tutorial04: tutorials/tutorial04/CMakeFiles/tutorial04.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../tutorial04"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial04 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tutorial04.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tutorials/tutorial04/CMakeFiles/tutorial04.dir/build: tutorial04
.PHONY : tutorials/tutorial04/CMakeFiles/tutorial04.dir/build

tutorials/tutorial04/CMakeFiles/tutorial04.dir/requires: tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04.o.requires
tutorials/tutorial04/CMakeFiles/tutorial04.dir/requires: tutorials/tutorial04/CMakeFiles/tutorial04.dir/tutorial04_device.o.requires
.PHONY : tutorials/tutorial04/CMakeFiles/tutorial04.dir/requires

tutorials/tutorial04/CMakeFiles/tutorial04.dir/clean:
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial04 && $(CMAKE_COMMAND) -P CMakeFiles/tutorial04.dir/cmake_clean.cmake
.PHONY : tutorials/tutorial04/CMakeFiles/tutorial04.dir/clean

tutorials/tutorial04/CMakeFiles/tutorial04.dir/depend:
	cd /home/gyz/code/work/embree-cl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gyz/code/work/embree-cl /home/gyz/code/work/embree-cl/tutorials/tutorial04 /home/gyz/code/work/embree-cl /home/gyz/code/work/embree-cl/tutorials/tutorial04 /home/gyz/code/work/embree-cl/tutorials/tutorial04/CMakeFiles/tutorial04.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tutorials/tutorial04/CMakeFiles/tutorial04.dir/depend

