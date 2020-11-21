"""This script is for testing the mod_comp_next_step.f90 subroutines"""
import numpy as np
from src.model import mod_comp_next_step as mcns # won't showup until f2py is run on the mod_comp_next_step

def test_compute_next_u():
   next_u = mcns.compute_next_u(201,201,np.zeros((201,201)),np.zeros((201,201)),9.8,
                               np.zeros((201,201)),1.0,1.0,0.02)
   assert np.shape(next_u) == (201,201)
   assert next_u.all() == np.zeros((201,201)).all() 
