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
include tutorials/tutorial02/CMakeFiles/tutorial02.dir/depend.make

# Include the progress variables for this target.
include tutorials/tutorial02/CMakeFiles/tutorial02.dir/progress.make

# Include the compile flags for this target's objects.
include tutorials/tutorial02/CMakeFiles/tutorial02.dir/flags.make

tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.o: tutorials/tutorial02/CMakeFiles/tutorial02.dir/flags.make
tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.o: tutorials/tutorial02/tutorial02.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/work/embree-cl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.o"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial02 && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial02.dir/tutorial02.o -c /home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02.cpp

tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial02.dir/tutorial02.i"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial02 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02.cpp > CMakeFiles/tutorial02.dir/tutorial02.i

tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial02.dir/tutorial02.s"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial02 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02.cpp -o CMakeFiles/tutorial02.dir/tutorial02.s

tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.o.requires:
.PHONY : tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.o.requires

tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.o.provides: tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.o.requires
	$(MAKE) -f tutorials/tutorial02/CMakeFiles/tutorial02.dir/build.make tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.o.provides.build
.PHONY : tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.o.provides

tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.o.provides.build: tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.o

tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.o: tutorials/tutorial02/CMakeFiles/tutorial02.dir/flags.make
tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.o: tutorials/tutorial02/tutorial02_device.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/work/embree-cl/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.o"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial02 && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial02.dir/tutorial02_device.o -c /home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02_device.cpp

tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial02.dir/tutorial02_device.i"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial02 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02_device.cpp > CMakeFiles/tutorial02.dir/tutorial02_device.i

tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial02.dir/tutorial02_device.s"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial02 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/work/embree-cl/tutorials/tutorial02/tutorial02_device.cpp -o CMakeFiles/tutorial02.dir/tutorial02_device.s

tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.o.requires:
.PHONY : tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.o.requires

tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.o.provides: tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.o.requires
	$(MAKE) -f tutorials/tutorial02/CMakeFiles/tutorial02.dir/build.make tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.o.provides.build
.PHONY : tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.o.provides

tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.o.provides.build: tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.o

# Object files for target tutorial02
tutorial02_OBJECTS = \
"CMakeFiles/tutorial02.dir/tutorial02.o" \
"CMakeFiles/tutorial02.dir/tutorial02_device.o"

# External object files for target tutorial02
tutorial02_EXTERNAL_OBJECTS =

tutorial02: tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.o
tutorial02: tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.o
tutorial02: tutorials/tutorial02/CMakeFiles/tutorial02.dir/build.make
tutorial02: libembree.so.2.3.1
tutorial02: libtutorial.a
tutorial02: libimage.a
tutorial02: libtransport.a
tutorial02: libtutorial_device.a
tutorial02: libembree_sse41.a
tutorial02: libembree_sse42.a
tutorial02: libembree_avx.a
tutorial02: libembree_avx2.a
tutorial02: libsimd.a
tutorial02: liblexers.a
tutorial02: /usr/lib64/libGLU.so
tutorial02: /usr/lib64/libGL.so
tutorial02: /usr/lib64/libSM.so
tutorial02: /usr/lib64/libICE.so
tutorial02: /usr/lib64/libX11.so
tutorial02: /usr/lib64/libXext.so
tutorial02: /usr/lib64/libglut.so
tutorial02: /usr/lib64/libXmu.so
tutorial02: /usr/lib64/libXi.so
tutorial02: /usr/lib64/libjpeg.so
tutorial02: libsys.a
tutorial02: tutorials/tutorial02/CMakeFiles/tutorial02.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../tutorial02"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial02 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tutorial02.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tutorials/tutorial02/CMakeFiles/tutorial02.dir/build: tutorial02
.PHONY : tutorials/tutorial02/CMakeFiles/tutorial02.dir/build

tutorials/tutorial02/CMakeFiles/tutorial02.dir/requires: tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02.o.requires
tutorials/tutorial02/CMakeFiles/tutorial02.dir/requires: tutorials/tutorial02/CMakeFiles/tutorial02.dir/tutorial02_device.o.requires
.PHONY : tutorials/tutorial02/CMakeFiles/tutorial02.dir/requires

tutorials/tutorial02/CMakeFiles/tutorial02.dir/clean:
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial02 && $(CMAKE_COMMAND) -P CMakeFiles/tutorial02.dir/cmake_clean.cmake
.PHONY : tutorials/tutorial02/CMakeFiles/tutorial02.dir/clean

tutorials/tutorial02/CMakeFiles/tutorial02.dir/depend:
	cd /home/gyz/code/work/embree-cl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gyz/code/work/embree-cl /home/gyz/code/work/embree-cl/tutorials/tutorial02 /home/gyz/code/work/embree-cl /home/gyz/code/work/embree-cl/tutorials/tutorial02 /home/gyz/code/work/embree-cl/tutorials/tutorial02/CMakeFiles/tutorial02.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tutorials/tutorial02/CMakeFiles/tutorial02.dir/depend
