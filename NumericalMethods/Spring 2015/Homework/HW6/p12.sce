clear; clc; format('v',20);

A=[6 -2 2 4; 12 -8 6 10; 3 -13 9 3; -6 4 1 -18];
b=[16; 26; -19; -34];
x=A\b;
[L, U]=lu(A);

disp(x)
disp(L)
disp(U)

A1=[2 4 -2 -2; 1 2 4 -3; -3 -3 8 -2; -1 1 6 -3];
b1=[-4; 5; 7; 7];
x1=A1\b1;
[L1, U1, P1]=lu(A1);

disp(x1)
disp(L1)
disp(U1)
disp(P1)
