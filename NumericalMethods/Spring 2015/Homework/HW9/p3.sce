clc; clear; xdel(winsid()); format('v',20);

s=poly(0,"s")

P = s^2+s;

function y=f(x)
    y=horner(P,x);
endfunction

disp(f(2))
