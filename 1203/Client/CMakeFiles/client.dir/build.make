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
CMAKE_SOURCE_DIR = /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client

# Include any dependencies generated for this target.
include CMakeFiles/client.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/client.dir/flags.make

CMakeFiles/client.dir/Client.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/Client.cpp.o: Client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/client.dir/Client.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/Client.cpp.o -c /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client/Client.cpp

CMakeFiles/client.dir/Client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/Client.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client/Client.cpp > CMakeFiles/client.dir/Client.cpp.i

CMakeFiles/client.dir/Client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/Client.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client/Client.cpp -o CMakeFiles/client.dir/Client.cpp.s

CMakeFiles/client.dir/Client.cpp.o.requires:

.PHONY : CMakeFiles/client.dir/Client.cpp.o.requires

CMakeFiles/client.dir/Client.cpp.o.provides: CMakeFiles/client.dir/Client.cpp.o.requires
	$(MAKE) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/Client.cpp.o.provides.build
.PHONY : CMakeFiles/client.dir/Client.cpp.o.provides

CMakeFiles/client.dir/Client.cpp.o.provides.build: CMakeFiles/client.dir/Client.cpp.o


CMakeFiles/client.dir/PracticalSocket.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/PracticalSocket.cpp.o: PracticalSocket.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/client.dir/PracticalSocket.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/PracticalSocket.cpp.o -c /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client/PracticalSocket.cpp

CMakeFiles/client.dir/PracticalSocket.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/PracticalSocket.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client/PracticalSocket.cpp > CMakeFiles/client.dir/PracticalSocket.cpp.i

CMakeFiles/client.dir/PracticalSocket.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/PracticalSocket.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client/PracticalSocket.cpp -o CMakeFiles/client.dir/PracticalSocket.cpp.s

CMakeFiles/client.dir/PracticalSocket.cpp.o.requires:

.PHONY : CMakeFiles/client.dir/PracticalSocket.cpp.o.requires

CMakeFiles/client.dir/PracticalSocket.cpp.o.provides: CMakeFiles/client.dir/PracticalSocket.cpp.o.requires
	$(MAKE) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/PracticalSocket.cpp.o.provides.build
.PHONY : CMakeFiles/client.dir/PracticalSocket.cpp.o.provides

CMakeFiles/client.dir/PracticalSocket.cpp.o.provides.build: CMakeFiles/client.dir/PracticalSocket.cpp.o


CMakeFiles/client.dir/Worms.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/Worms.cpp.o: Worms.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/client.dir/Worms.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/Worms.cpp.o -c /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client/Worms.cpp

CMakeFiles/client.dir/Worms.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/Worms.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client/Worms.cpp > CMakeFiles/client.dir/Worms.cpp.i

CMakeFiles/client.dir/Worms.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/Worms.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client/Worms.cpp -o CMakeFiles/client.dir/Worms.cpp.s

CMakeFiles/client.dir/Worms.cpp.o.requires:

.PHONY : CMakeFiles/client.dir/Worms.cpp.o.requires

CMakeFiles/client.dir/Worms.cpp.o.provides: CMakeFiles/client.dir/Worms.cpp.o.requires
	$(MAKE) -f CMakeFiles/client.dir/build.make CMakeFiles/client.dir/Worms.cpp.o.provides.build
.PHONY : CMakeFiles/client.dir/Worms.cpp.o.provides

CMakeFiles/client.dir/Worms.cpp.o.provides.build: CMakeFiles/client.dir/Worms.cpp.o


# Object files for target client
client_OBJECTS = \
"CMakeFiles/client.dir/Client.cpp.o" \
"CMakeFiles/client.dir/PracticalSocket.cpp.o" \
"CMakeFiles/client.dir/Worms.cpp.o"

# External object files for target client
client_EXTERNAL_OBJECTS =

client: CMakeFiles/client.dir/Client.cpp.o
client: CMakeFiles/client.dir/PracticalSocket.cpp.o
client: CMakeFiles/client.dir/Worms.cpp.o
client: CMakeFiles/client.dir/build.make
client: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_ts.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.9
client: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.9
client: CMakeFiles/client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable client"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/client.dir/build: client

.PHONY : CMakeFiles/client.dir/build

CMakeFiles/client.dir/requires: CMakeFiles/client.dir/Client.cpp.o.requires
CMakeFiles/client.dir/requires: CMakeFiles/client.dir/PracticalSocket.cpp.o.requires
CMakeFiles/client.dir/requires: CMakeFiles/client.dir/Worms.cpp.o.requires

.PHONY : CMakeFiles/client.dir/requires

CMakeFiles/client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/client.dir/clean

CMakeFiles/client.dir/depend:
	cd /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client /home/ubuntu/Desktop/ICPC/2017-2-CECD-ButterflyEffect-2/1203/Client/CMakeFiles/client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/client.dir/depend

