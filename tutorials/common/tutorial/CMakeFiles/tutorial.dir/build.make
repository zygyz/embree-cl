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
include tutorials/common/tutorial/CMakeFiles/tutorial.dir/depend.make

# Include the progress variables for this target.
include tutorials/common/tutorial/CMakeFiles/tutorial.dir/progress.make

# Include the compile flags for this target's objects.
include tutorials/common/tutorial/CMakeFiles/tutorial.dir/flags.make

tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.o: tutorials/common/tutorial/CMakeFiles/tutorial.dir/flags.make
tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.o: tutorials/common/tutorial/glutdisplay.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.o"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial.dir/glutdisplay.o -c /home/gyz/code/good/embree-cl/tutorials/common/tutorial/glutdisplay.cpp

tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial.dir/glutdisplay.i"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/tutorials/common/tutorial/glutdisplay.cpp > CMakeFiles/tutorial.dir/glutdisplay.i

tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial.dir/glutdisplay.s"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/tutorials/common/tutorial/glutdisplay.cpp -o CMakeFiles/tutorial.dir/glutdisplay.s

tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.o.requires:
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.o.requires

tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.o.provides: tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.o.requires
	$(MAKE) -f tutorials/common/tutorial/CMakeFiles/tutorial.dir/build.make tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.o.provides.build
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.o.provides

tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.o.provides.build: tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.o

tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.o: tutorials/common/tutorial/CMakeFiles/tutorial.dir/flags.make
tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.o: tutorials/common/tutorial/obj_loader.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.o"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial.dir/obj_loader.o -c /home/gyz/code/good/embree-cl/tutorials/common/tutorial/obj_loader.cpp

tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial.dir/obj_loader.i"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/tutorials/common/tutorial/obj_loader.cpp > CMakeFiles/tutorial.dir/obj_loader.i

tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial.dir/obj_loader.s"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/tutorials/common/tutorial/obj_loader.cpp -o CMakeFiles/tutorial.dir/obj_loader.s

tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.o.requires:
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.o.requires

tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.o.provides: tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.o.requires
	$(MAKE) -f tutorials/common/tutorial/CMakeFiles/tutorial.dir/build.make tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.o.provides.build
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.o.provides

tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.o.provides.build: tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.o

tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.o: tutorials/common/tutorial/CMakeFiles/tutorial.dir/flags.make
tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.o: tutorials/common/tutorial/hair_loader.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.o"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial.dir/hair_loader.o -c /home/gyz/code/good/embree-cl/tutorials/common/tutorial/hair_loader.cpp

tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial.dir/hair_loader.i"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/tutorials/common/tutorial/hair_loader.cpp > CMakeFiles/tutorial.dir/hair_loader.i

tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial.dir/hair_loader.s"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/tutorials/common/tutorial/hair_loader.cpp -o CMakeFiles/tutorial.dir/hair_loader.s

tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.o.requires:
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.o.requires

tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.o.provides: tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.o.requires
	$(MAKE) -f tutorials/common/tutorial/CMakeFiles/tutorial.dir/build.make tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.o.provides.build
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.o.provides

tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.o.provides.build: tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.o

tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.o: tutorials/common/tutorial/CMakeFiles/tutorial.dir/flags.make
tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.o: tutorials/common/tutorial/cy_hair_loader.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.o"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial.dir/cy_hair_loader.o -c /home/gyz/code/good/embree-cl/tutorials/common/tutorial/cy_hair_loader.cpp

tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial.dir/cy_hair_loader.i"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/tutorials/common/tutorial/cy_hair_loader.cpp > CMakeFiles/tutorial.dir/cy_hair_loader.i

tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial.dir/cy_hair_loader.s"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/tutorials/common/tutorial/cy_hair_loader.cpp -o CMakeFiles/tutorial.dir/cy_hair_loader.s

tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.o.requires:
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.o.requires

tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.o.provides: tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.o.requires
	$(MAKE) -f tutorials/common/tutorial/CMakeFiles/tutorial.dir/build.make tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.o.provides.build
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.o.provides

tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.o.provides.build: tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.o

# Object files for target tutorial
tutorial_OBJECTS = \
"CMakeFiles/tutorial.dir/glutdisplay.o" \
"CMakeFiles/tutorial.dir/obj_loader.o" \
"CMakeFiles/tutorial.dir/hair_loader.o" \
"CMakeFiles/tutorial.dir/cy_hair_loader.o"

# External object files for target tutorial
tutorial_EXTERNAL_OBJECTS =

libtutorial.a: tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.o
libtutorial.a: tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.o
libtutorial.a: tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.o
libtutorial.a: tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.o
libtutorial.a: tutorials/common/tutorial/CMakeFiles/tutorial.dir/build.make
libtutorial.a: tutorials/common/tutorial/CMakeFiles/tutorial.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library ../../../libtutorial.a"
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && $(CMAKE_COMMAND) -P CMakeFiles/tutorial.dir/cmake_clean_target.cmake
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tutorial.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tutorials/common/tutorial/CMakeFiles/tutorial.dir/build: libtutorial.a
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial.dir/build

tutorials/common/tutorial/CMakeFiles/tutorial.dir/requires: tutorials/common/tutorial/CMakeFiles/tutorial.dir/glutdisplay.o.requires
tutorials/common/tutorial/CMakeFiles/tutorial.dir/requires: tutorials/common/tutorial/CMakeFiles/tutorial.dir/obj_loader.o.requires
tutorials/common/tutorial/CMakeFiles/tutorial.dir/requires: tutorials/common/tutorial/CMakeFiles/tutorial.dir/hair_loader.o.requires
tutorials/common/tutorial/CMakeFiles/tutorial.dir/requires: tutorials/common/tutorial/CMakeFiles/tutorial.dir/cy_hair_loader.o.requires
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial.dir/requires

tutorials/common/tutorial/CMakeFiles/tutorial.dir/clean:
	cd /home/gyz/code/good/embree-cl/tutorials/common/tutorial && $(CMAKE_COMMAND) -P CMakeFiles/tutorial.dir/cmake_clean.cmake
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial.dir/clean

tutorials/common/tutorial/CMakeFiles/tutorial.dir/depend:
	cd /home/gyz/code/good/embree-cl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gyz/code/good/embree-cl /home/gyz/code/good/embree-cl/tutorials/common/tutorial /home/gyz/code/good/embree-cl /home/gyz/code/good/embree-cl/tutorials/common/tutorial /home/gyz/code/good/embree-cl/tutorials/common/tutorial/CMakeFiles/tutorial.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tutorials/common/tutorial/CMakeFiles/tutorial.dir/depend

