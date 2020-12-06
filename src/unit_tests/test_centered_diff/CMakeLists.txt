#Define your sources

#Define header includes
include_directories(../../external/Fulitity)

#define the executable target

#define the test itself
file(GLOB sources
     ../../model/mod_centered_diff.f90
     test_centered_diff.f90)

add_executable(test_centered_diff ${sources})
