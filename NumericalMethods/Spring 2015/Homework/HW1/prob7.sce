clear; clc;

A=[10 -3; 4 2]; B=[1 0; -1 2]; v=[1 2]'; w=[1 1]';

disp("vT*w")
disp(v'*w)

disp("vwT")
disp(v*w')

disp("A*v")
disp(A*v)

disp("AT*v")
disp(A'*v)

disp("AB")
disp(A*B)

disp("BA")
disp(B*A)

disp("A^2")
disp(A^2)

disp("By=w")
disp(B\w)

disp("Ax=v")
disp(A\v)

