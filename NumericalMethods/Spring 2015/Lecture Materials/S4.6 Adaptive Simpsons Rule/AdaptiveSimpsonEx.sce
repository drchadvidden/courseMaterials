clc; clear; xdel(winsid()); format('v',20);

// Section 4.6 Adaptive Simpsons Rule Example
// Author: Chad Vidden,  Date:4/14/14
//
// This script computes the adaptive Simpsons
//  rule for \int_1^3 (100/x^2)sin(10/x) dx. 

// Integration function
function y=f(x)
    y = (100. ./x^2).*sin(10. ./x);
endfunction

// Adaptive Simpson's rule
function [apx,level,xVals]=SimpsonA(f,a,b,eps,level,xVals) 
    level=level+1; // keep track of the number of iterations
    xVals(level,1) = a;  xVals(level,2) = b; // store nodes
    
    h=(b-a)/2;
    
    c=(a+b)/2; // midpoint of [a,b]
    S1 = (h/3)*(f(a)+4*f(c)+f(b)); // first Simpson's rule
    
    d=(a+c)/2; // midpoint of [a,(a+b)/2]
    e=(c+b)/2; // midpoint of [(a+b)/2, b]
    
    // second Simpson's rule
    S2 = (h/6)*(f(a)+4*f(d)+2*f(c)+4*f(e)+f(b)); 
    
    // check if further subdivision is needed
    if abs(S2-S1)<15*eps then
        apx = S2;
    else
        // use recursion to repeat
        [SL, level,xVals] = SimpsonA(f,a,c,eps/2,level,xVals);
        [SR, level,xVals] = SimpsonA(f,c,b,eps/2,level,xVals);
        apx = SL+SR;
    end
endfunction

a=1; b=3; // [a,b], interval of integration

level=0; // iteration count
eps=0.0001; xVals=[0,0]; // eps tolerance and initialize xVals
[apx,level,xVals]=SimpsonA(f,a,b,eps,level,xVals);

disp("Approximation: " + string(apx))
disp("Iterations: " + string(level))


xVals = [xVals(:,1);xVals(:,2)];

x=linspace(1,3,1000)
plot(x,f(x)); 
xtitle("Adaptive Simpsons Rule", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=f(x)'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;
//plot(xVals,zeros(length(xVals)),'ro',xVals,f(xVals),'ro'); 



