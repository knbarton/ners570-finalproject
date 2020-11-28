import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

path = 'output/'
name = 'final_height'
data = pd.read_csv(path+name+'.out',sep='\s+',header=None)
data = pd.DataFrame(data)
plt.figure()
ax = plt.imshow(data.T)
plt.gca().invert_yaxis()
plt.jet()
plt.colorbar()
plt.title(str(name))
plt.savefig(path+name+'.png')
plt.close()
