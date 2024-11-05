clc; clear; xdel(winsid()); format('v',20);

// Section 3.4 Hermite Interpolation
// Author: Chad Vidden,  Date:3/24/14
//
// This script plots the piecewise cubic Hermite 
// interpolant of f(x)=x^4 =on [0,2] using
// subintervals [0,1], [1,2].

function y=f(x)
    y=x.^4;
endfunction

x = linspace(0, 2, 100); // domian for plotting

P1 = 2*x.^3-x.^2; // poly interp on [0,1] 
P2 = 6*x.^3-13*x.^2+12*x-4; // poly interp on [1,2] 

// plot function and interpolant
subplot(121)
plot(x,f(x),'b+',x,P1,'g',x,P2,'r'); 
xtitle("Hermite Interpolation Polynomial", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=x^4)', 'y=P1(x)', 'y=P2(x)'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;

x1 = linspace(0, 1, 100); // domian for plotting
x2 = linspace(1, 2, 100); // domian for plotting
P1 = 2*x1.^3-x1.^2; // poly interp on [0,1] 
P2 = 6*x2.^3-13*x2.^2+12*x2-4; // poly interp on [1,2] 

subplot(122)
plot(x,f(x),'b+',x1,P1,'g',x2,P2,'r'); 
xtitle("Hermite Interpolation Polynomial, Domains Restricted", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=x^4)', 'y=P1(x)', 'y=P2(x)'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;
