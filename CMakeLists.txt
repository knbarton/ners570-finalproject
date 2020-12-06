# help with writing this cmake file comes from 
# http://fortranwiki.org/fortran/show/Build+tools
cmake_minimum_required(VERSION 3.5) # declares the CMake version required

project(tsunami_prog) # name of project
enable_language(Fortran) # specifies the language

if (CMAKE_Fortran_COMPILER_ID MATCHES "GNU")
     set(dialect "-std=f2008 -fimplicit-none")
     set(bounds "-fbounds-check")
endif()

set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} ${bounds}")
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${dialect}")

#
# Hack Futility build system to compile just whats needed for unit test
#
set(futilitytest
   src/external/Futility/src/UnitTest.f90
   src/external/Futility/src/IntryType.f90
   )
#add_library
add_library(futilitytest)

#Process test exectubals (if testing enabled)
add_subdirectory(src/unit_tests)

#
# Compile.
#
file(GLOB_RECURSE sources
     src/mod_initialize.f90
     src/mod_centered_diff.f90
     src/mod_comp_next_step.f90
     src/tsunami.f90)
add_executable(tsunami_prog ${sources})

# help with learning configure_file from
# https://stackoverflow.com/questions/34799916/copy-file-from-source-directory-to-binary-directory-using-cmake
configure_file(${CMAKE_SOURCE_DIR}/src/processing/plot_tsunami.py
               ${CMAKE_CURRENT_BINARY_DIR}/plot_tsunami.py
               COPYONLY)
