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
include tutorials/common/lexers/CMakeFiles/lexers.dir/depend.make

# Include the progress variables for this target.
include tutorials/common/lexers/CMakeFiles/lexers.dir/progress.make

# Include the compile flags for this target's objects.
include tutorials/common/lexers/CMakeFiles/lexers.dir/flags.make

tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.o: tutorials/common/lexers/CMakeFiles/lexers.dir/flags.make
tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.o: tutorials/common/lexers/stringstream.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.o"
	cd /home/gyz/code/good/embree-cl/tutorials/common/lexers && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lexers.dir/stringstream.o -c /home/gyz/code/good/embree-cl/tutorials/common/lexers/stringstream.cpp

tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lexers.dir/stringstream.i"
	cd /home/gyz/code/good/embree-cl/tutorials/common/lexers && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/tutorials/common/lexers/stringstream.cpp > CMakeFiles/lexers.dir/stringstream.i

tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lexers.dir/stringstream.s"
	cd /home/gyz/code/good/embree-cl/tutorials/common/lexers && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/tutorials/common/lexers/stringstream.cpp -o CMakeFiles/lexers.dir/stringstream.s

tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.o.requires:
.PHONY : tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.o.requires

tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.o.provides: tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.o.requires
	$(MAKE) -f tutorials/common/lexers/CMakeFiles/lexers.dir/build.make tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.o.provides.build
.PHONY : tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.o.provides

tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.o.provides.build: tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.o

tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.o: tutorials/common/lexers/CMakeFiles/lexers.dir/flags.make
tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.o: tutorials/common/lexers/tokenstream.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.o"
	cd /home/gyz/code/good/embree-cl/tutorials/common/lexers && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lexers.dir/tokenstream.o -c /home/gyz/code/good/embree-cl/tutorials/common/lexers/tokenstream.cpp

tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lexers.dir/tokenstream.i"
	cd /home/gyz/code/good/embree-cl/tutorials/common/lexers && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/tutorials/common/lexers/tokenstream.cpp > CMakeFiles/lexers.dir/tokenstream.i

tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lexers.dir/tokenstream.s"
	cd /home/gyz/code/good/embree-cl/tutorials/common/lexers && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/tutorials/common/lexers/tokenstream.cpp -o CMakeFiles/lexers.dir/tokenstream.s

tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.o.requires:
.PHONY : tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.o.requires

tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.o.provides: tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.o.requires
	$(MAKE) -f tutorials/common/lexers/CMakeFiles/lexers.dir/build.make tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.o.provides.build
.PHONY : tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.o.provides

tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.o.provides.build: tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.o

# Object files for target lexers
lexers_OBJECTS = \
"CMakeFiles/lexers.dir/stringstream.o" \
"CMakeFiles/lexers.dir/tokenstream.o"

# External object files for target lexers
lexers_EXTERNAL_OBJECTS =

liblexers.a: tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.o
liblexers.a: tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.o
liblexers.a: tutorials/common/lexers/CMakeFiles/lexers.dir/build.make
liblexers.a: tutorials/common/lexers/CMakeFiles/lexers.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library ../../../liblexers.a"
	cd /home/gyz/code/good/embree-cl/tutorials/common/lexers && $(CMAKE_COMMAND) -P CMakeFiles/lexers.dir/cmake_clean_target.cmake
	cd /home/gyz/code/good/embree-cl/tutorials/common/lexers && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lexers.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tutorials/common/lexers/CMakeFiles/lexers.dir/build: liblexers.a
.PHONY : tutorials/common/lexers/CMakeFiles/lexers.dir/build

tutorials/common/lexers/CMakeFiles/lexers.dir/requires: tutorials/common/lexers/CMakeFiles/lexers.dir/stringstream.o.requires
tutorials/common/lexers/CMakeFiles/lexers.dir/requires: tutorials/common/lexers/CMakeFiles/lexers.dir/tokenstream.o.requires
.PHONY : tutorials/common/lexers/CMakeFiles/lexers.dir/requires

tutorials/common/lexers/CMakeFiles/lexers.dir/clean:
	cd /home/gyz/code/good/embree-cl/tutorials/common/lexers && $(CMAKE_COMMAND) -P CMakeFiles/lexers.dir/cmake_clean.cmake
.PHONY : tutorials/common/lexers/CMakeFiles/lexers.dir/clean

tutorials/common/lexers/CMakeFiles/lexers.dir/depend:
	cd /home/gyz/code/good/embree-cl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gyz/code/good/embree-cl /home/gyz/code/good/embree-cl/tutorials/common/lexers /home/gyz/code/good/embree-cl /home/gyz/code/good/embree-cl/tutorials/common/lexers /home/gyz/code/good/embree-cl/tutorials/common/lexers/CMakeFiles/lexers.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tutorials/common/lexers/CMakeFiles/lexers.dir/depend

