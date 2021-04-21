import numpy as np
import math
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

Fs= 12000
rpm=1797
speed=rpm/60
data_cycle=3*Fs/speed

# Importing mat data file
from scipy.io import loadmat
data = loadmat('base.mat')


# Coverting the data file to 1-D
baseDE = np.ravel(data["X097_DE_time"])
baseFE = np.ravel(data["X097_FE_time"])

sample_duration=len(baseDE)/Fs

# Importing the LMD function
from PyLMD import LMD
lmd = LMD()

L = 10
k=1  
u = []  # List initialization
v = []

# for loop for LMD
for i in range(L):
    E = baseDE[k:k+math.floor(data_cycle)]
    PFs_DE = lmd.lmd(E)[0]  # Take the first return of LMD function
    u.append(PFs_DE)  # Storing in list u
    F = baseFE[k:k+math.floor(data_cycle)]
    PFs_FE = lmd.lmd(F)[0]
    v.append(PFs_FE)
    k=k+math.floor(data_cycle)

# # Ploting the PFs 
# for i in range(len(PFs_DE)):
#     plt.plot(PFs_DE[i,:])
#     plt.show(i)
    
irdata = loadmat('IR007_0.mat')
irDE = np.ravel(irdata["X105_DE_time"])
irFE = np.ravel(irdata["X105_FE_time"])

k=1  

# for loop for LMD
for i in range(L):
    E = irDE[k:k+math.floor(data_cycle)]
    irPFs_DE = lmd.lmd(E)[0]  # Take the first return of LMD function
    u.append(irPFs_DE)  # Storing in list u
    F = irFE[k:k+math.floor(data_cycle)]
    irPFs_FE = lmd.lmd(F)[0]
    v.append(irPFs_FE)
    k=k+math.floor(data_cycle)
    
ordata = loadmat('OR007@6_0.mat')
orDE = np.ravel(ordata["X130_DE_time"])
orFE = np.ravel(ordata["X130_FE_time"])

k=1  

# for loop for LMD
for i in range(L):
    E = orDE[k:k+math.floor(data_cycle)]
    orPFs_DE = lmd.lmd(E)[0]  # Take the first return of LMD function
    u.append(orPFs_DE)  # Storing in list u
    F = orFE[k:k+math.floor(data_cycle)]
    orPFs_FE = lmd.lmd(F)[0]
    v.append(orPFs_FE)
    k=k+math.floor(data_cycle)

bldata = loadmat('B007_0.mat')
blDE = np.ravel(bldata["X118_DE_time"])
blFE = np.ravel(bldata["X118_FE_time"])

k=1  

# for loop for LMD
for i in range(L):
    E = blDE[k:k+math.floor(data_cycle)]
    blPFs_DE = lmd.lmd(E)[0]  # Take the first return of LMD function
    u.append(blPFs_DE)  # Storing in list u
    F = blFE[k:k+math.floor(data_cycle)]
    blPFs_FE = lmd.lmd(F)[0]
    v.append(blPFs_FE)
    k=k+math.floor(data_cycle)
    
# Taking the first n elements from arrays in a list
def Extract(lst): 
    return [item[0:5,:] for item in lst] 

u = Extract(u)
v = Extract(v)

import numpy
w, h = len(u[0][:,0]), len(u)

Matrix = [[0 for x in range(w)] for y in range(h)] 
import numpy as np
for i in range(h):
    for j in range(w):
        Matrix[i][j]=np.mean(u[i][j])
        
mean22 = np.array(Matrix)





import numpy
mean_i=[]
mean_j=[]
import numpy as np
for i in range(40):
    mean_j.clear()
    for j in range(5):
        mean_j.append(np.mean(u[i][j]))
    mean_i.append(mean_j)
    
        
mean22 = np.array(Matrix)
