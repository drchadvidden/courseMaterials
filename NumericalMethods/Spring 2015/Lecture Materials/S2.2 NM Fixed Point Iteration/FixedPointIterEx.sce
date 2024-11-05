clear; clc; xdel(winsid()); format('v',20);

// Section 2.2NM Fixed Point Iteration
// Author: Chad Vidden,  Date: 2/13/14
//
// This script executes a basic fixed point 
// iteration for g(x)=x^2

function y = g(x)
    y=x.^2;    
endfunction

// two initial approximations
x0=0.7;
y0=1.3;

// fixed point iteration for x0
x(1)=x0;
for n=2:20
    x(n)=g(x(n-1));
end

// fixed point iteration for y0
y(1)=y0;
for n=2:20
    y(n)=g(y(n-1));
end
disp([x y])
