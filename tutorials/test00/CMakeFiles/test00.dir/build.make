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
include tutorials/test00/CMakeFiles/test00.dir/depend.make

# Include the progress variables for this target.
include tutorials/test00/CMakeFiles/test00.dir/progress.make

# Include the compile flags for this target's objects.
include tutorials/test00/CMakeFiles/test00.dir/flags.make

tutorials/test00/CMakeFiles/test00.dir/test00.o: tutorials/test00/CMakeFiles/test00.dir/flags.make
tutorials/test00/CMakeFiles/test00.dir/test00.o: tutorials/test00/test00.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/test00/CMakeFiles/test00.dir/test00.o"
	cd /home/gyz/code/good/embree-cl/tutorials/test00 && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test00.dir/test00.o -c /home/gyz/code/good/embree-cl/tutorials/test00/test00.cpp

tutorials/test00/CMakeFiles/test00.dir/test00.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test00.dir/test00.i"
	cd /home/gyz/code/good/embree-cl/tutorials/test00 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/tutorials/test00/test00.cpp > CMakeFiles/test00.dir/test00.i

tutorials/test00/CMakeFiles/test00.dir/test00.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test00.dir/test00.s"
	cd /home/gyz/code/good/embree-cl/tutorials/test00 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/tutorials/test00/test00.cpp -o CMakeFiles/test00.dir/test00.s

tutorials/test00/CMakeFiles/test00.dir/test00.o.requires:
.PHONY : tutorials/test00/CMakeFiles/test00.dir/test00.o.requires

tutorials/test00/CMakeFiles/test00.dir/test00.o.provides: tutorials/test00/CMakeFiles/test00.dir/test00.o.requires
	$(MAKE) -f tutorials/test00/CMakeFiles/test00.dir/build.make tutorials/test00/CMakeFiles/test00.dir/test00.o.provides.build
.PHONY : tutorials/test00/CMakeFiles/test00.dir/test00.o.provides

tutorials/test00/CMakeFiles/test00.dir/test00.o.provides.build: tutorials/test00/CMakeFiles/test00.dir/test00.o

tutorials/test00/CMakeFiles/test00.dir/test00_device.o: tutorials/test00/CMakeFiles/test00.dir/flags.make
tutorials/test00/CMakeFiles/test00.dir/test00_device.o: tutorials/test00/test00_device.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/test00/CMakeFiles/test00.dir/test00_device.o"
	cd /home/gyz/code/good/embree-cl/tutorials/test00 && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test00.dir/test00_device.o -c /home/gyz/code/good/embree-cl/tutorials/test00/test00_device.cpp

tutorials/test00/CMakeFiles/test00.dir/test00_device.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test00.dir/test00_device.i"
	cd /home/gyz/code/good/embree-cl/tutorials/test00 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/tutorials/test00/test00_device.cpp > CMakeFiles/test00.dir/test00_device.i

tutorials/test00/CMakeFiles/test00.dir/test00_device.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test00.dir/test00_device.s"
	cd /home/gyz/code/good/embree-cl/tutorials/test00 && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/tutorials/test00/test00_device.cpp -o CMakeFiles/test00.dir/test00_device.s

tutorials/test00/CMakeFiles/test00.dir/test00_device.o.requires:
.PHONY : tutorials/test00/CMakeFiles/test00.dir/test00_device.o.requires

tutorials/test00/CMakeFiles/test00.dir/test00_device.o.provides: tutorials/test00/CMakeFiles/test00.dir/test00_device.o.requires
	$(MAKE) -f tutorials/test00/CMakeFiles/test00.dir/build.make tutorials/test00/CMakeFiles/test00.dir/test00_device.o.provides.build
.PHONY : tutorials/test00/CMakeFiles/test00.dir/test00_device.o.provides

tutorials/test00/CMakeFiles/test00.dir/test00_device.o.provides.build: tutorials/test00/CMakeFiles/test00.dir/test00_device.o

# Object files for target test00
test00_OBJECTS = \
"CMakeFiles/test00.dir/test00.o" \
"CMakeFiles/test00.dir/test00_device.o"

# External object files for target test00
test00_EXTERNAL_OBJECTS =

test00: tutorials/test00/CMakeFiles/test00.dir/test00.o
test00: tutorials/test00/CMakeFiles/test00.dir/test00_device.o
test00: tutorials/test00/CMakeFiles/test00.dir/build.make
test00: libembree.so.2.3.1
test00: libtutorial.a
test00: libimage.a
test00: libtransport.a
test00: libtutorial_device.a
test00: libembree_sse41.a
test00: libembree_sse42.a
test00: libembree_avx.a
test00: libembree_avx2.a
test00: libsimd.a
test00: liblexers.a
test00: /usr/lib64/libGLU.so
test00: /usr/lib64/libGL.so
test00: /usr/lib64/libSM.so
test00: /usr/lib64/libICE.so
test00: /usr/lib64/libX11.so
test00: /usr/lib64/libXext.so
test00: /usr/lib64/libglut.so
test00: /usr/lib64/libXmu.so
test00: /usr/lib64/libXi.so
test00: /usr/lib64/libjpeg.so
test00: libsys.a
test00: tutorials/test00/CMakeFiles/test00.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../test00"
	cd /home/gyz/code/good/embree-cl/tutorials/test00 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test00.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tutorials/test00/CMakeFiles/test00.dir/build: test00
.PHONY : tutorials/test00/CMakeFiles/test00.dir/build

tutorials/test00/CMakeFiles/test00.dir/requires: tutorials/test00/CMakeFiles/test00.dir/test00.o.requires
tutorials/test00/CMakeFiles/test00.dir/requires: tutorials/test00/CMakeFiles/test00.dir/test00_device.o.requires
.PHONY : tutorials/test00/CMakeFiles/test00.dir/requires

tutorials/test00/CMakeFiles/test00.dir/clean:
	cd /home/gyz/code/good/embree-cl/tutorials/test00 && $(CMAKE_COMMAND) -P CMakeFiles/test00.dir/cmake_clean.cmake
.PHONY : tutorials/test00/CMakeFiles/test00.dir/clean

tutorials/test00/CMakeFiles/test00.dir/depend:
	cd /home/gyz/code/good/embree-cl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gyz/code/good/embree-cl /home/gyz/code/good/embree-cl/tutorials/test00 /home/gyz/code/good/embree-cl /home/gyz/code/good/embree-cl/tutorials/test00 /home/gyz/code/good/embree-cl/tutorials/test00/CMakeFiles/test00.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tutorials/test00/CMakeFiles/test00.dir/depend

