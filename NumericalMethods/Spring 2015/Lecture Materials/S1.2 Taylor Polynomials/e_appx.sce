clear; clc; xdel(winsid()); 
// Preamble to clear memory and console, close all windows

// Section 1.2 Taylor Series review
// Author: Chad Vidden,  Date: 2/3/14
//
// This script approximates e within tolerance 10^(-9) 
// using a Taylor polnomial approximation of f(x)=exp(x) 
// about x=0

format('e',20) // display 20 digits, one digit for the sign

apx=0; // initialize the approximation
for k=0:12 // loop to compute first 13 terms of Taylor polynomial
    apx=apx+1/factorial(k);
end

// print results
disp("e = "+string(%e))
disp("approximation = "+string(apx))
disp("error = " + string(abs(apx-%e)))
disp("tolerance = " + string(10^(-9)))
