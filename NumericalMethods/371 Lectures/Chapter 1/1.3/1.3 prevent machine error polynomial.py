#%% clear memory and console

%reset -f
%clear

#%% import libarries

import numpy as np
import matplotlib.pyplot as plt

#%% machine error

n = 500

x = np.linspace(0.988,1,num=n)

fx = np.zeros(n)
for i in range(len(x)):
    fx[i] = x[i]**7-7*x[i]**6 + 21*x[i]**5-35*x[i]**4 + 35*x[i]**3-21*x[i]**2 + 7*x[i]-1
    
plt.plot(x,fx)
plt.grid()
plt.show()

#%% nested version, no machine error

n = 100

x = np.linspace(0.988,1,num=n)

fx = np.zeros(n)
for i in range(len(x)):
    fx[i] = (x[i]-1)**7
    
plt.plot(x,fx)
plt.grid()
plt.show()