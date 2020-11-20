#!/usr/bin/env python
<<<<<<< HEAD

import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

name = 'output/final_height.out'
data = pd.read_csv(name,sep='\s+',header=None)
data = pd.DataFrame(data)
plt.figure()
ax = plt.imshow(data.T)
plt.gca().invert_yaxis()
plt.jet()
plt.colorbar()
plt.title(str(name))
plt.savefig(str(name)+'.png')
plt.close()
=======
"""
This code will get data from the ../output directory and
perform post-processing visualization on it
"""
>>>>>>> main
