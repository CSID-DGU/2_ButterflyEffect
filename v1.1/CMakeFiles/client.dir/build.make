# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1

# Include any dependencies generated for this target.
include CMakeFiles/client.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/client.dir/flags.make

CMakeFiles/client.dir/Client.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/Client.cpp.o: Client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/client.dir/Client.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/Client.cpp.o -c /home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1/Client.cpp

CMakeFiles/client.dir/Client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/Client.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1/Client.cpp > CMakeFiles/client.dir/Client.cpp.i

CMakeFiles/client.dir/Client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/Client.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1/Client.cpp -o CMakeFiles/client.dir/Client.cpp.s

CMakeFiles/client.dir/Client.cpp.o.requires:

.PHONY : CMakeFiles/client.dir/Client.cpp.o.requires

CMakeFiles/client.dir/Client.cpp.o.provides: CMakeFiles/client.dir/Client.cpp.o.requires
	$(MAKE) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/Client.cpp.o.provides.build
.PHONY : CMakeFiles/client.dir/Client.cpp.o.provides

CMakeFiles/client.dir/Client.cpp.o.provides.build: CMakeFiles/client.dir/Client.cpp.o


CMakeFiles/client.dir/PracticalSocket.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/PracticalSocket.cpp.o: PracticalSocket.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/client.dir/PracticalSocket.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/PracticalSocket.cpp.o -c /home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1/PracticalSocket.cpp

CMakeFiles/client.dir/PracticalSocket.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/PracticalSocket.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1/PracticalSocket.cpp > CMakeFiles/client.dir/PracticalSocket.cpp.i

CMakeFiles/client.dir/PracticalSocket.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/PracticalSocket.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1/PracticalSocket.cpp -o CMakeFiles/client.dir/PracticalSocket.cpp.s

CMakeFiles/client.dir/PracticalSocket.cpp.o.requires:

.PHONY : CMakeFiles/client.dir/PracticalSocket.cpp.o.requires

CMakeFiles/client.dir/PracticalSocket.cpp.o.provides: CMakeFiles/client.dir/PracticalSocket.cpp.o.requires
	$(MAKE) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/PracticalSocket.cpp.o.provides.build
.PHONY : CMakeFiles/client.dir/PracticalSocket.cpp.o.provides

CMakeFiles/client.dir/PracticalSocket.cpp.o.provides.build: CMakeFiles/client.dir/PracticalSocket.cpp.o


# Object files for target client
client_OBJECTS = \
"CMakeFiles/client.dir/Client.cpp.o" \
"CMakeFiles/client.dir/PracticalSocket.cpp.o"

# External object files for target client
client_EXTERNAL_OBJECTS =

client: CMakeFiles/client.dir/Client.cpp.o
client: CMakeFiles/client.dir/PracticalSocket.cpp.o
client: CMakeFiles/client.dir/build.make
client: /usr/local/lib/libopencv_stitching.so.3.3.0
client: /usr/local/lib/libopencv_superres.so.3.3.0
client: /usr/local/lib/libopencv_videostab.so.3.3.0
client: /usr/local/lib/libopencv_aruco.so.3.3.0
client: /usr/local/lib/libopencv_bgsegm.so.3.3.0
client: /usr/local/lib/libopencv_bioinspired.so.3.3.0
client: /usr/local/lib/libopencv_ccalib.so.3.3.0
client: /usr/local/lib/libopencv_dpm.so.3.3.0
client: /usr/local/lib/libopencv_face.so.3.3.0
client: /usr/local/lib/libopencv_fuzzy.so.3.3.0
client: /usr/local/lib/libopencv_img_hash.so.3.3.0
client: /usr/local/lib/libopencv_line_descriptor.so.3.3.0
client: /usr/local/lib/libopencv_optflow.so.3.3.0
client: /usr/local/lib/libopencv_reg.so.3.3.0
client: /usr/local/lib/libopencv_rgbd.so.3.3.0
client: /usr/local/lib/libopencv_saliency.so.3.3.0
client: /usr/local/lib/libopencv_stereo.so.3.3.0
client: /usr/local/lib/libopencv_structured_light.so.3.3.0
client: /usr/local/lib/libopencv_surface_matching.so.3.3.0
client: /usr/local/lib/libopencv_tracking.so.3.3.0
client: /usr/local/lib/libopencv_xfeatures2d.so.3.3.0
client: /usr/local/lib/libopencv_ximgproc.so.3.3.0
client: /usr/local/lib/libopencv_xobjdetect.so.3.3.0
client: /usr/local/lib/libopencv_xphoto.so.3.3.0
client: /usr/local/lib/libopencv_shape.so.3.3.0
client: /usr/local/lib/libopencv_photo.so.3.3.0
client: /usr/local/lib/libopencv_calib3d.so.3.3.0
client: /usr/local/lib/libopencv_phase_unwrapping.so.3.3.0
client: /usr/local/lib/libopencv_dnn.so.3.3.0
client: /usr/local/lib/libopencv_video.so.3.3.0
client: /usr/local/lib/libopencv_datasets.so.3.3.0
client: /usr/local/lib/libopencv_plot.so.3.3.0
client: /usr/local/lib/libopencv_text.so.3.3.0
client: /usr/local/lib/libopencv_features2d.so.3.3.0
client: /usr/local/lib/libopencv_flann.so.3.3.0
client: /usr/local/lib/libopencv_highgui.so.3.3.0
client: /usr/local/lib/libopencv_ml.so.3.3.0
client: /usr/local/lib/libopencv_videoio.so.3.3.0
client: /usr/local/lib/libopencv_imgcodecs.so.3.3.0
client: /usr/local/lib/libopencv_objdetect.so.3.3.0
client: /usr/local/lib/libopencv_imgproc.so.3.3.0
client: /usr/local/lib/libopencv_core.so.3.3.0
client: CMakeFiles/client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable client"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/client.dir/build: client

.PHONY : CMakeFiles/client.dir/build

CMakeFiles/client.dir/requires: CMakeFiles/client.dir/Client.cpp.o.requires
CMakeFiles/client.dir/requires: CMakeFiles/client.dir/PracticalSocket.cpp.o.requires

.PHONY : CMakeFiles/client.dir/requires

CMakeFiles/client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/client.dir/clean

CMakeFiles/client.dir/depend:
	cd /home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1 /home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1 /home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1 /home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1 /home/sy0814k/bf/2017-2-CECD-ButterflyEffect-2/v1.1/CMakeFiles/client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/client.dir/depend

