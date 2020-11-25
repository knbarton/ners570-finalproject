# help with writing this cmake file comes from 
# http://fortranwiki.org/fortran/show/Build+tools
cmake_minimum_required(VERSION 3.5) # declares the CMake version required

project(tsunami) # name of project
enable_language(Fortran) # specifies the language

if (CMAKE_Fortran_COMPILER_ID MATCHES "GNU")
     set(dialect "-ffree-form -std=f2008 -fimplicit-none")
     set(bounds "-fbounds-check")
endif()

set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} ${bounds}")
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${dialect}")

#
# Compule.
#
file(GLOB_RECURSE sources src/*.f90) # CMake understands dependencies and will build
add_executable(prog ${sources}) # the files in the right order
