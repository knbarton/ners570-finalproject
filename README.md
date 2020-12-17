# ners570-finalproject

[![Build Status](https://travis-ci.com/knbarton/ners570-finalproject.svg?branch=main)](https://travis-ci.com/knbarton/ners570-finalproject)

## Authors
Kristin Barton (knbarton@umich.edu)  
Darryl Watkins (darryljw@umich.edu)

## Basis for Project
The ocean plays a significant role in climate prediction, weather forecasting,
as well as our general understanding of the entire earth system.
Creating efficient and accurate models of the ocean can be an incredible
computational challenge due to the size and complexity of the system.
However, we can use simplified models to look at specific phenomena, such as
tsunamis. Tsunamis are considered shallow water waves because their typical
wavelength is significantly larger than the depth of the ocean. This means they
can be studied using a simplified form of the Navier-Stokes equations known as
the shallow-water equations (SWE).

The code model is inspired by the tsunami model featured in the *Modern Fortan*
textbook, and the accompanying [Tsunami GitHub](https://github.com/modern-fortran/tsunami).
However, this repository contains an unique implementation of the model.
The majority of this project will be done in Fortran 90, while data visualization
will be completed in Python.

## How to Run
The code can be run using the following commands:
```
mkdir bld
cd bld
cmake ..
make
./tsunami_prog
./plot_tsunami.py
```
Requirements: Fortran compiler and Python.

The main tsunami program `tsunami_prog` generates a directory called `output` and will store the water height data as a text file. The plotting program `plot_tsunami.py` will generate .png files for each available time step and a gif called `tsunami.gif`. All of these will also be placed in the `output` folder.
