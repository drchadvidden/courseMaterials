clear; clc; xdel(winsid());

// Section 1.2 Taylor Series review
// Author: Chad Vidden,  Date: 2/3/14
//
// This script plots the nth Taylor polynomial 
// of f(x)=exp(x) about x=0


format('v'); // default formatting

x = linspace(-5, 5, 50); // domian for plotting
f = exp(x); // compute function values

n=5; // Taylor polynomial degree
s=poly(0,"s"); // create polynomial variable s
Pn = 0; // initialize the polynomial

for k=0:n // loop to compute e^x Taylor polynomial
    Pn=Pn+s^k/factorial(k); 
end

Pnvals = horner(Pn,x); // polynomial evaluation

plot(x,f,"b",x,Pnvals,"g"); // plot functions
xtitle("n = " + string(n) + " Taylor Polynomial", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=e^x', 'y=Pn(x)'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;
