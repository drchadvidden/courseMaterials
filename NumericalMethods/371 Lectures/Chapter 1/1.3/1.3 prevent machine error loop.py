#%% clear memory and console

%reset -f
%clear

#%% import libarries

import numpy as np

#%% machine error

n = 60
x = np.zeros(n)

x[0] = 1/3

for i in range(n-1) :
  if x[i] <= 0.5 :
      x[i+1] = 2*x[i]
  elif x[i] > 0.5 :
      x[i+1] = 2*x[i]-1

print(x)

#%% avoid machine error

n = 60
x = np.zeros(n)

top = 1
bottom = 3
x[0] = top/bottom

for i in range(n-1):
		
    if top/bottom < 0.5 :
        top = 2*top
    elif x[i] > 0.5 :
        top = 2*top-bottom
        
    x[i+1] = top/bottom


print(x)