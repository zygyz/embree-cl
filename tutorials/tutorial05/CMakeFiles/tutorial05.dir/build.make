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
include tutorials/tutorial05/CMakeFiles/tutorial05.dir/depend.make

# Include the progress variables for this target.
include tutorials/tutorial05/CMakeFiles/tutorial05.dir/progress.make

# Include the compile flags for this target's objects.
include tutorials/tutorial05/CMakeFiles/tutorial05.dir/flags.make

tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.o: tutorials/tutorial05/CMakeFiles/tutorial05.dir/flags.make
tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.o: tutorials/tutorial05/tutorial05.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/work/embree-cl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.o"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial05 && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial05.dir/tutorial05.o -c /home/gyz/code/work/embree-cl/tutorials/tutorial05/tutorial05.cpp

tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial05.dir/tutorial05.i"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial05 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/work/embree-cl/tutorials/tutorial05/tutorial05.cpp > CMakeFiles/tutorial05.dir/tutorial05.i

tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial05.dir/tutorial05.s"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial05 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/work/embree-cl/tutorials/tutorial05/tutorial05.cpp -o CMakeFiles/tutorial05.dir/tutorial05.s

tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.o.requires:
.PHONY : tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.o.requires

tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.o.provides: tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.o.requires
	$(MAKE) -f tutorials/tutorial05/CMakeFiles/tutorial05.dir/build.make tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.o.provides.build
.PHONY : tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.o.provides

tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.o.provides.build: tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.o

tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.o: tutorials/tutorial05/CMakeFiles/tutorial05.dir/flags.make
tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.o: tutorials/tutorial05/tutorial05_device.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/work/embree-cl/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.o"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial05 && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial05.dir/tutorial05_device.o -c /home/gyz/code/work/embree-cl/tutorials/tutorial05/tutorial05_device.cpp

tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial05.dir/tutorial05_device.i"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial05 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/work/embree-cl/tutorials/tutorial05/tutorial05_device.cpp > CMakeFiles/tutorial05.dir/tutorial05_device.i

tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial05.dir/tutorial05_device.s"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial05 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/work/embree-cl/tutorials/tutorial05/tutorial05_device.cpp -o CMakeFiles/tutorial05.dir/tutorial05_device.s

tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.o.requires:
.PHONY : tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.o.requires

tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.o.provides: tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.o.requires
	$(MAKE) -f tutorials/tutorial05/CMakeFiles/tutorial05.dir/build.make tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.o.provides.build
.PHONY : tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.o.provides

tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.o.provides.build: tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.o

# Object files for target tutorial05
tutorial05_OBJECTS = \
"CMakeFiles/tutorial05.dir/tutorial05.o" \
"CMakeFiles/tutorial05.dir/tutorial05_device.o"

# External object files for target tutorial05
tutorial05_EXTERNAL_OBJECTS =

tutorial05: tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.o
tutorial05: tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.o
tutorial05: tutorials/tutorial05/CMakeFiles/tutorial05.dir/build.make
tutorial05: libembree.so.2.3.1
tutorial05: libtutorial.a
tutorial05: libimage.a
tutorial05: libtransport.a
tutorial05: libtutorial_device.a
tutorial05: libembree_sse41.a
tutorial05: libembree_sse42.a
tutorial05: libembree_avx.a
tutorial05: libembree_avx2.a
tutorial05: libsimd.a
tutorial05: liblexers.a
tutorial05: /usr/lib64/libGLU.so
tutorial05: /usr/lib64/libGL.so
tutorial05: /usr/lib64/libSM.so
tutorial05: /usr/lib64/libICE.so
tutorial05: /usr/lib64/libX11.so
tutorial05: /usr/lib64/libXext.so
tutorial05: /usr/lib64/libglut.so
tutorial05: /usr/lib64/libXmu.so
tutorial05: /usr/lib64/libXi.so
tutorial05: /usr/lib64/libjpeg.so
tutorial05: libsys.a
tutorial05: tutorials/tutorial05/CMakeFiles/tutorial05.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../tutorial05"
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial05 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tutorial05.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tutorials/tutorial05/CMakeFiles/tutorial05.dir/build: tutorial05
.PHONY : tutorials/tutorial05/CMakeFiles/tutorial05.dir/build

tutorials/tutorial05/CMakeFiles/tutorial05.dir/requires: tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05.o.requires
tutorials/tutorial05/CMakeFiles/tutorial05.dir/requires: tutorials/tutorial05/CMakeFiles/tutorial05.dir/tutorial05_device.o.requires
.PHONY : tutorials/tutorial05/CMakeFiles/tutorial05.dir/requires

tutorials/tutorial05/CMakeFiles/tutorial05.dir/clean:
	cd /home/gyz/code/work/embree-cl/tutorials/tutorial05 && $(CMAKE_COMMAND) -P CMakeFiles/tutorial05.dir/cmake_clean.cmake
.PHONY : tutorials/tutorial05/CMakeFiles/tutorial05.dir/clean

tutorials/tutorial05/CMakeFiles/tutorial05.dir/depend:
	cd /home/gyz/code/work/embree-cl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gyz/code/work/embree-cl /home/gyz/code/work/embree-cl/tutorials/tutorial05 /home/gyz/code/work/embree-cl /home/gyz/code/work/embree-cl/tutorials/tutorial05 /home/gyz/code/work/embree-cl/tutorials/tutorial05/CMakeFiles/tutorial05.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tutorials/tutorial05/CMakeFiles/tutorial05.dir/depend

