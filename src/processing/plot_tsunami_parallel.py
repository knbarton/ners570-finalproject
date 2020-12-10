"""A parallelized version of plot_tsunami.py"""
#!/usr/bin/env python

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import os
import imageio
import multiprocessing as mp
import time # https://stackoverflow.com/questions/7370801/how-to-measure-elapsed-time-in-python

def plot_png(n):
    """This function plots the individual results from the output file"""
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


path = 'output/'
images = [] # initialize list for plot files

start_parallel_time = time.time()
cpus = mp.cpu_count() #https://stackoverflow.com/questions/1006289/how-to-find-out-the-number-of-cpus-using-python

if __name__ == '__main__':
    with mp.Pool(int(cpus*0.75)) as p: # using only 3/4 the physical number of cpu's
        p.map(plot_png, range(0,10001,10))
end_parallel_time = time.time()
parallel_time = end_parallel_time - start_parallel_time
print(f"The parallel time is {parallel_time} seconds")

start_loop_time = time.time()
for n in range(0,10001,10):
    name = str(n)
    file_path = path+name+'.out'
    if os.path.exists(file_path):
        images.append(imageio.imread(path+name+'.png'))
end_loop_time = time.time()
loop_time = end_loop_time - start_loop_time
print(f"The loop time is {loop_time} seconds")

start_imageio_time = time.time()
imageio.mimsave(path+'tsunami.gif', images)
end_imageio_time = time.time()
imageio_time = end_imageio_time - start_imageio_time
print(f"The imageio time is {imageio_time} seconds")

print(f"Total time is {parallel_time + loop_time + imageio_time} seconds")
