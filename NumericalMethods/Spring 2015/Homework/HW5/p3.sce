clc; clear; xdel(winsid()); format('v',20);

// problem 3

x = [-2 -1 0 1 2 3];
s=poly(0,"s"); // create polynomial variable s
P = s^4-s^3+s^2-s+1; // note, p is only degree 4
Q = P + (-31/120)*(s+2)*(s+1)*s*(s-1)*(s-2);
disp(horner(P,x))
disp(horner(Q,x))
