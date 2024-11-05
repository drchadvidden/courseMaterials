clc; clear; xdel(winsid()); format('v',20);

// problem 5

// part a
function y=p(x)
    y = 5*x.^3-27*x.^2+45*x-21;
endfunction
function y=q(x)
    y = x.^4-5*x.^3+8*x.^2-5*x+3;
endfunction

xn = [1 2 3 4];
disp(p(xn))
disp(q(xn))

s=poly(0,"s"); // create polynomial variable s
P = 3+2*(s-1)+4*(s-1)*(s+2); 
Q = 3*(s+2)*s/3 - 3*(s-1)*s/6-7*(s-1)*(s+2)/(-2);

disp(P)
disp(horner(P,xn))
disp(Q)
disp(horner(Q,xn))

