#!/bin/bash

cp ../model/mod_initialize.f90 mod_initialize.f90
gfortran -c mod_initialize.f90 test_mod_initialize.f90
gfortran mod_initialize.o test_mod_initialize.o
chmod +x ./a.out
./a.out
rm mod_initialize*
rm test_mod_initialize.o
rm a.out

cp ../model/mod_centered_diff.f90 mod_centered_diff.f90
gfortran -c mod_centered_diff.f90 test_mod_centered_diff.f90
gfortran mod_centered_diff.o test_mod_centered_diff.o
chmod +x ./a.out
./a.out
rm mod_centered_diff*
rm test_mod_centered_diff.o
rm a.out

cp ../model/mod_centered_diff.f90 mod_centered_diff.f90
cp ../model/mod_comp_next_step.f90 mod_comp_next_step.f90
gfortran -c mod_centered_diff.f90 mod_comp_next_step.f90 test_mod_comp_next_step.f90
gfortran mod_centered_diff.o mod_comp_next_step.o test_mod_comp_next_step.o
chmod +x ./a.out
./a.out
rm mod_centered_diff*
rm mod_comp_next_step*
rm test_mod_comp_next_step.o
rm a.out
