#%% clear memory and console

%reset -f
%clear

#%% import libarries

import numpy as np
import pandas as pd

#%% data

M = np.array([[1e-14,2,3],[4,5,6],[7,8,10]], dtype=np.float)
b = np.array([6,15,25], dtype=np.float)

#%% naive GE

n = M.shape[0]

A = np.c_[M,b]
# print(pd.DataFrame(A))

# forward elimination
for i in range(n):
    for j in range(i+1,n):
        A[j,] = A[j,] - A[i,]*(A[j,i]/A[i,i])
        
# print(pd.DataFrame(A))

# back substitution
xComp = np.zeros(n)
for i in range(n-1,-1,-1):
    xComp[i] = A[i,n]/A[i,i]
    for j in range(i-1,-1,-1):
        A[j,n] = A[j,n] - A[j,i] * xComp[i]
print("GE Solution")  
print(xComp)
print("Multiply to check")
print(M.dot(xComp))
print("Expected multiplication result")
print(b)

#%% built in
print(np.linalg.solve(M, b))
