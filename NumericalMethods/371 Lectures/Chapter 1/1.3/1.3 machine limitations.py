#%% clear memory and console

%reset -f
%clear

#%% import libaries

import numpy as np
import time

#%% demo

# overflow
ymax = float(2**1023)
ymax
ymax == ymax+1
ymax = 2*ymax
ymax
ymax/2

# underflow
ymin=float(2**(-1074))
ymin
ymin/2

# machine epsilon
y = 1
eps = np.finfo(float).eps
y+eps/2
y+eps

# what does this do???
x = float(1)
iter=0
while x+1>1: x = x/2;  print(x); time.sleep(0.2)
x

# what does this do???
x = float(1)
iter=0
while x+x >x: x = 2*x;  print(x); time.sleep(0.02)
x

# what does this do???
x = float(1)
iter=0
while x+x >x: x = x/2;  print(x); time.sleep(0.02)
x
    
