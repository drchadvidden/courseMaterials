clear; clc; xdel(winsid()); format('v',10)

// Section 1.4 Rates of Convergence
// Author: Chad Vidden,  Date: 1/16/14
//
// This script examines the rate of convergence
// of the Taylor polynomial of e^x about x0.


x = linspace(-3, 3, 100); // domian for plotting
x0 = 0; // power series center
f = exp(x); // compute function values

n=3; // Taylor polynomial degree
s=poly(0,"s"); // create polynomial variable s
Pn = 0; // initialize the polynomial

for k=0:n // loop to compute e^x Taylor polynomial
    Pn=Pn+s^k/factorial(k); 
end

Pnvals = horner(Pn,x); // polynomial evaluation

// examinie the loglog plots of errors
plot2d("ll",abs(x-x0),abs(f-Pnvals),style=2)
xtitle("loglog plot of error", ...
    "ln(|x-x0|)", "ln(|error|)");
set(gca(),"grid",[1 1])
a=gca(); // make lines thicker
a.children.children.thickness = 3;
