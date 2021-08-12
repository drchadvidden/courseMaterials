#%% clear memory and console

%reset -f
%clear

#%% import libarries

import numpy as np
import scipy as sp
import pandas as pd

#%% hilbert matrix

n = 20
H = np.zeros((n,n))

for i in range(n):
  for j in range(n):
      H[i,j] = 1/(i+j+1)
      
print(pd.DataFrame(H))


#%% naive GE

x = np.ones(n)
b = np.matmul(H,x)

A = np.c_[H,b]
#print(pd.DataFrame(A))

# forward elimination
for i in range(n):
    for j in range(i+1,n):
        A[j,] = A[j,] - A[i,]*(A[j,i]/A[i,i])
        
#print(pd.DataFrame(A))

# back substitution
xComp = np.zeros(n)
for i in range(n-1,-1,-1):
    xComp[i] = A[i,n]/A[i,i]
    for j in range(i-1,-1,-1):
        A[j,n] = A[j,n] - A[j,i] * xComp[i]
    
        
#print(pd.DataFrame(A))
print("GE Solution")
print(xComp)

#%% built in
print(sp.linalg.solve(H, b))


#%% condition number
print(np.linalg.cond(H))

#%% warning message
print(sp.linalg.solve(H, b))
