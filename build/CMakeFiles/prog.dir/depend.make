# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10


CMakeFiles/prog.dir/mod_centered_diff.mod.proxy: CMakeFiles/prog.dir/src/model/mod_centered_diff.f90.o.provides
CMakeFiles/prog.dir/src/model/mod_centered_diff.f90.o.provides.build:
	$(CMAKE_COMMAND) -E cmake_copy_f90_mod mod_centered_diff CMakeFiles/prog.dir/mod_centered_diff.mod.stamp GNU
	$(CMAKE_COMMAND) -E touch CMakeFiles/prog.dir/src/model/mod_centered_diff.f90.o.provides.build
CMakeFiles/prog.dir/build: CMakeFiles/prog.dir/src/model/mod_centered_diff.f90.o.provides.build

CMakeFiles/prog.dir/src/model/mod_comp_next_step.f90.o.requires: CMakeFiles/prog.dir/mod_centered_diff.mod.proxy
CMakeFiles/prog.dir/src/model/mod_comp_next_step.f90.o: CMakeFiles/prog.dir/mod_centered_diff.mod.stamp
CMakeFiles/prog.dir/mod_comp_next_step.mod.proxy: CMakeFiles/prog.dir/src/model/mod_comp_next_step.f90.o.provides
CMakeFiles/prog.dir/src/model/mod_comp_next_step.f90.o.provides.build:
	$(CMAKE_COMMAND) -E cmake_copy_f90_mod mod_comp_next_step CMakeFiles/prog.dir/mod_comp_next_step.mod.stamp GNU
	$(CMAKE_COMMAND) -E touch CMakeFiles/prog.dir/src/model/mod_comp_next_step.f90.o.provides.build
CMakeFiles/prog.dir/build: CMakeFiles/prog.dir/src/model/mod_comp_next_step.f90.o.provides.build

CMakeFiles/prog.dir/mod_initialize.mod.proxy: CMakeFiles/prog.dir/src/model/mod_initialize.f90.o.provides
CMakeFiles/prog.dir/src/model/mod_initialize.f90.o.provides.build:
	$(CMAKE_COMMAND) -E cmake_copy_f90_mod mod_initialize CMakeFiles/prog.dir/mod_initialize.mod.stamp GNU
	$(CMAKE_COMMAND) -E touch CMakeFiles/prog.dir/src/model/mod_initialize.f90.o.provides.build
CMakeFiles/prog.dir/build: CMakeFiles/prog.dir/src/model/mod_initialize.f90.o.provides.build

CMakeFiles/prog.dir/src/model/tsunami.f90.o.requires: CMakeFiles/prog.dir/mod_centered_diff.mod.proxy
CMakeFiles/prog.dir/src/model/tsunami.f90.o: CMakeFiles/prog.dir/mod_centered_diff.mod.stamp
CMakeFiles/prog.dir/src/model/tsunami.f90.o.requires: CMakeFiles/prog.dir/mod_initialize.mod.proxy
CMakeFiles/prog.dir/src/model/tsunami.f90.o: CMakeFiles/prog.dir/mod_initialize.mod.stamp
