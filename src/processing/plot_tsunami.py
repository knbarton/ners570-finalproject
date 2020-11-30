#!/usr/bin/env python

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import os
import imageio

path = 'output/'
images = []
for n in range(0,10001,10):
   name = str(n)
   file_path = path+name+'.out'
   if os.path.exists(file_path):
     data = pd.read_csv(file_path,sep='\s+',header=None)
     data = pd.DataFrame(data)
     fig = plt.figure()
     ax = plt.imshow(data.T, vmin=0, vmax=0.5, cmap='jet')
     plt.gca().invert_yaxis()
     plt.jet()
     plt.colorbar()
     plt.title(str(name))
     plt.savefig('output/'+name+'.png')
     plt.close()
     images.append(imageio.imread('output/'+name+'.png'))

imageio.mimsave('output/tsunami.gif', images)
