clear; clc; xdel(winsid());

// Section 1.2 Taylor Series review
// Author: Chad Vidden,  Date: 2/3/14
//
// This script plots the first n Taylor polynomials 
// of f(x)=exp(x) about x=0


format('v'); // default number formatting

x = linspace(-5, 5, 50); // domian for plotting
f = exp(x); // compute function values

n=12; // max polynomial degree
s=poly(0,"s"); // create polynomial variable s
Pn = 0; // initialize the Taylor polynomial

for k=0:n // loop to compute and plot Taylor polynomial
    Pn=Pn+s^k/factorial(k); // e^x Taylor polnomial
    Pnvals = horner(Pn,x); // polynomial evaluation
    
    clf(); // clear plot window
    plot(x,f,"b",x,Pnvals,"g");
    set(gca(),"data_bounds",[-5, 5; -0.5, exp(5)]'); // set x,y axis
    xtitle("n = " + string(k) + " Taylor Polynomial", ...
        "x-axis", "y-axis"); // graph title and axis labels
    legend(['y=e^x', 'y=Pn(x)'],2); // graph legend
    a=gca(); // make lines thicker
    a.children.children.thickness = 3;
    xpause(1000000); // pause before plotting the next
end
