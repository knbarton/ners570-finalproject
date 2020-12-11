#!/bin/bash

cp ../model/mod_initialize.f90 mod_initialize.f90
gfortran -c mod_initialize.f90 test_mod_initialize.f90
gfortran mod_initialize.o test_mod_initialize.o
chmod +x ./a.out
./a.out
rm mod_initialize*
rm test_mod_initialize.o
rm a.out
