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
include kernels/xeon/CMakeFiles/embree_sse41.dir/depend.make

# Include the progress variables for this target.
include kernels/xeon/CMakeFiles/embree_sse41.dir/progress.make

# Include the compile flags for this target's objects.
include kernels/xeon/CMakeFiles/embree_sse41.dir/flags.make

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o: kernels/xeon/CMakeFiles/embree_sse41.dir/flags.make
kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o: kernels/xeon/bvh4/bvh4_builder_binner.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o -c /home/gyz/code/good/embree-cl/kernels/xeon/bvh4/bvh4_builder_binner.cpp

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.i"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/kernels/xeon/bvh4/bvh4_builder_binner.cpp > CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.i

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.s"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/kernels/xeon/bvh4/bvh4_builder_binner.cpp -o CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.s

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o.requires:
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o.requires

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o.provides: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o.requires
	$(MAKE) -f kernels/xeon/CMakeFiles/embree_sse41.dir/build.make kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o.provides.build
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o.provides

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o.provides.build: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o: kernels/xeon/CMakeFiles/embree_sse41.dir/flags.make
kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o: kernels/xeon/bvh4/bvh4_builder_toplevel.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o -c /home/gyz/code/good/embree-cl/kernels/xeon/bvh4/bvh4_builder_toplevel.cpp

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.i"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/kernels/xeon/bvh4/bvh4_builder_toplevel.cpp > CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.i

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.s"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/kernels/xeon/bvh4/bvh4_builder_toplevel.cpp -o CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.s

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o.requires:
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o.requires

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o.provides: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o.requires
	$(MAKE) -f kernels/xeon/CMakeFiles/embree_sse41.dir/build.make kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o.provides.build
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o.provides

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o.provides.build: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o: kernels/xeon/CMakeFiles/embree_sse41.dir/flags.make
kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o: kernels/xeon/bvh4/bvh4_intersector1.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o -c /home/gyz/code/good/embree-cl/kernels/xeon/bvh4/bvh4_intersector1.cpp

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.i"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/kernels/xeon/bvh4/bvh4_intersector1.cpp > CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.i

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.s"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/kernels/xeon/bvh4/bvh4_intersector1.cpp -o CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.s

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o.requires:
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o.requires

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o.provides: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o.requires
	$(MAKE) -f kernels/xeon/CMakeFiles/embree_sse41.dir/build.make kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o.provides.build
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o.provides

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o.provides.build: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o: kernels/xeon/CMakeFiles/embree_sse41.dir/flags.make
kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o: kernels/xeon/bvh4/bvh4_intersector4_chunk.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o -c /home/gyz/code/good/embree-cl/kernels/xeon/bvh4/bvh4_intersector4_chunk.cpp

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.i"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/kernels/xeon/bvh4/bvh4_intersector4_chunk.cpp > CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.i

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.s"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/kernels/xeon/bvh4/bvh4_intersector4_chunk.cpp -o CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.s

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o.requires:
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o.requires

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o.provides: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o.requires
	$(MAKE) -f kernels/xeon/CMakeFiles/embree_sse41.dir/build.make kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o.provides.build
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o.provides

kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o.provides.build: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.o: kernels/xeon/CMakeFiles/embree_sse41.dir/flags.make
kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.o: kernels/common/cl_scene.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.o"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/embree_sse41.dir/__/common/cl_scene.o -c /home/gyz/code/good/embree-cl/kernels/common/cl_scene.cpp

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/embree_sse41.dir/__/common/cl_scene.i"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/kernels/common/cl_scene.cpp > CMakeFiles/embree_sse41.dir/__/common/cl_scene.i

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/embree_sse41.dir/__/common/cl_scene.s"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/kernels/common/cl_scene.cpp -o CMakeFiles/embree_sse41.dir/__/common/cl_scene.s

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.o.requires:
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.o.requires

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.o.provides: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.o.requires
	$(MAKE) -f kernels/xeon/CMakeFiles/embree_sse41.dir/build.make kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.o.provides.build
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.o.provides

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.o.provides.build: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.o

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o: kernels/xeon/CMakeFiles/embree_sse41.dir/flags.make
kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o: kernels/common/cl_geometry.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o -c /home/gyz/code/good/embree-cl/kernels/common/cl_geometry.cpp

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/embree_sse41.dir/__/common/cl_geometry.i"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/kernels/common/cl_geometry.cpp > CMakeFiles/embree_sse41.dir/__/common/cl_geometry.i

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/embree_sse41.dir/__/common/cl_geometry.s"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/kernels/common/cl_geometry.cpp -o CMakeFiles/embree_sse41.dir/__/common/cl_geometry.s

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o.requires:
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o.requires

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o.provides: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o.requires
	$(MAKE) -f kernels/xeon/CMakeFiles/embree_sse41.dir/build.make kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o.provides.build
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o.provides

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o.provides.build: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o: kernels/xeon/CMakeFiles/embree_sse41.dir/flags.make
kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o: kernels/common/cl_rtcore.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o -c /home/gyz/code/good/embree-cl/kernels/common/cl_rtcore.cpp

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.i"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/kernels/common/cl_rtcore.cpp > CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.i

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.s"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/kernels/common/cl_rtcore.cpp -o CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.s

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o.requires:
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o.requires

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o.provides: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o.requires
	$(MAKE) -f kernels/xeon/CMakeFiles/embree_sse41.dir/build.make kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o.provides.build
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o.provides

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o.provides.build: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o: kernels/xeon/CMakeFiles/embree_sse41.dir/flags.make
kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o: kernels/common/cl_triangleMesh.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gyz/code/good/embree-cl/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o -c /home/gyz/code/good/embree-cl/kernels/common/cl_triangleMesh.cpp

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.i"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/gyz/code/good/embree-cl/kernels/common/cl_triangleMesh.cpp > CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.i

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.s"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/gyz/code/good/embree-cl/kernels/common/cl_triangleMesh.cpp -o CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.s

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o.requires:
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o.requires

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o.provides: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o.requires
	$(MAKE) -f kernels/xeon/CMakeFiles/embree_sse41.dir/build.make kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o.provides.build
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o.provides

kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o.provides.build: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o

# Object files for target embree_sse41
embree_sse41_OBJECTS = \
"CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o" \
"CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o" \
"CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o" \
"CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o" \
"CMakeFiles/embree_sse41.dir/__/common/cl_scene.o" \
"CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o" \
"CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o" \
"CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o"

# External object files for target embree_sse41
embree_sse41_EXTERNAL_OBJECTS =

libembree_sse41.a: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o
libembree_sse41.a: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o
libembree_sse41.a: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o
libembree_sse41.a: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o
libembree_sse41.a: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.o
libembree_sse41.a: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o
libembree_sse41.a: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o
libembree_sse41.a: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o
libembree_sse41.a: kernels/xeon/CMakeFiles/embree_sse41.dir/build.make
libembree_sse41.a: kernels/xeon/CMakeFiles/embree_sse41.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library ../../libembree_sse41.a"
	cd /home/gyz/code/good/embree-cl/kernels/xeon && $(CMAKE_COMMAND) -P CMakeFiles/embree_sse41.dir/cmake_clean_target.cmake
	cd /home/gyz/code/good/embree-cl/kernels/xeon && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/embree_sse41.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
kernels/xeon/CMakeFiles/embree_sse41.dir/build: libembree_sse41.a
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/build

kernels/xeon/CMakeFiles/embree_sse41.dir/requires: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_binner.o.requires
kernels/xeon/CMakeFiles/embree_sse41.dir/requires: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_builder_toplevel.o.requires
kernels/xeon/CMakeFiles/embree_sse41.dir/requires: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector1.o.requires
kernels/xeon/CMakeFiles/embree_sse41.dir/requires: kernels/xeon/CMakeFiles/embree_sse41.dir/bvh4/bvh4_intersector4_chunk.o.requires
kernels/xeon/CMakeFiles/embree_sse41.dir/requires: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_scene.o.requires
kernels/xeon/CMakeFiles/embree_sse41.dir/requires: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_geometry.o.requires
kernels/xeon/CMakeFiles/embree_sse41.dir/requires: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_rtcore.o.requires
kernels/xeon/CMakeFiles/embree_sse41.dir/requires: kernels/xeon/CMakeFiles/embree_sse41.dir/__/common/cl_triangleMesh.o.requires
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/requires

kernels/xeon/CMakeFiles/embree_sse41.dir/clean:
	cd /home/gyz/code/good/embree-cl/kernels/xeon && $(CMAKE_COMMAND) -P CMakeFiles/embree_sse41.dir/cmake_clean.cmake
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/clean

kernels/xeon/CMakeFiles/embree_sse41.dir/depend:
	cd /home/gyz/code/good/embree-cl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gyz/code/good/embree-cl /home/gyz/code/good/embree-cl/kernels/xeon /home/gyz/code/good/embree-cl /home/gyz/code/good/embree-cl/kernels/xeon /home/gyz/code/good/embree-cl/kernels/xeon/CMakeFiles/embree_sse41.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : kernels/xeon/CMakeFiles/embree_sse41.dir/depend

