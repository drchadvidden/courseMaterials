xdel(winsid()); format('v',20);

// Section 2.2 Bisection Method
// Author: Chad Vidden,  Date: 2/10/14
//
// This script executes the Bisection Method for 
// the function f(x)=x^3+4x^2-10 on [1,2]

function y = f(x)
    y=x.^3+4*x.^2-10;    
endfunction

a=1; b=2; TOL=10^(-4); MaxIters=5;
pExact=1.365230013414096845760807;

[p,NumIters] = Secant(f,a,b,TOL,MaxIters);
disp("Exact: "+string(pExact))
disp("Apprx: "+string(p))
disp("Error: "+string(abs(pExact-p)))
disp("Toler: "+string(TOL))
disp("NItrs: "+string(NumIters))
