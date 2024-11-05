clc; xdel(winsid()); //format('v',25); 
// clear the console, close windows, display more digits

// Accumulated Roundoff Error
// Author: Chad Vidden,  Date: 1/28/15
//
// This script gnerates a simple plot of a polynomil
// which looks nothing like a polynomial. This is an 
// example of severe subtraction cancellation

x = 0.988:.00001:1.012; // domain
y = x.^7-7*x.^6+21*x.^5-35*x.^4+35*x.^3-21*x.^2+7*x-1; // polynomial
plot(x,y) 
