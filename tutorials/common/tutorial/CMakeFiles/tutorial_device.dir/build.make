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
include tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/depend.make

# Include the progress variables for this target.
include tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/progress.make

# Include the compile flags for this target's objects.
include tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/flags.make

tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.o: tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/flags.make
tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.o: tutorials/common/tutorial/tutorial_device.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.o"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial_device.dir/tutorial_device.o -c /home/gyz/code/good/embree-cl/tutorials/common/tutorial/tutorial_device.cpp

tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial_device.dir/tutorial_device.i"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/tutorials/common/tutorial/tutorial_device.cpp > CMakeFiles/tutorial_device.dir/tutorial_device.i

tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial_device.dir/tutorial_device.s"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/tutorials/common/tutorial/tutorial_device.cpp -o CMakeFiles/tutorial_device.dir/tutorial_device.s

tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.o.requires:
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.o.requires

tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.o.provides: tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.o.requires
	$(MAKE) -f tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/build.make tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.o.provides.build
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.o.provides

tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.o.provides.build: tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.o

# Object files for target tutorial_device
tutorial_device_OBJECTS = \
"CMakeFiles/tutorial_device.dir/tutorial_device.o"

# External object files for target tutorial_device
tutorial_device_EXTERNAL_OBJECTS =

libtutorial_device.a: tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.o
libtutorial_device.a: tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/build.make
libtutorial_device.a: tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library ../../../libtutorial_device.a"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && $(CMAKE_COMMAND) -P CMakeFiles/tutorial_device.dir/cmake_clean_target.cmake
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tutorial_device.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/build: libtutorial_device.a
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/build

tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/requires: tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/tutorial_device.o.requires
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/requires

tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/clean:
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && $(CMAKE_COMMAND) -P CMakeFiles/tutorial_device.dir/cmake_clean.cmake
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/clean

tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/depend:
	cd /home/gyz/code/good/embree-cl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gyz/code/good/embree-cl /home/gyz/code/good/embree-cl/tutorials/common/tutorial /home/gyz/code/good/embree-cl /home/gyz/code/good/embree-cl/tutorials/common/tutorial /home/gyz/code/good/embree-cl/tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial_device.dir/depend

