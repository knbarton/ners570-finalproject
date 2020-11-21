#!/bin/sh

python -m numpy.f2py -c src/model/mod_comp_next_step.f90 -m src/model/mod_comp_next_step

pytest -vv tests/test_mod_comp_next_step.py
