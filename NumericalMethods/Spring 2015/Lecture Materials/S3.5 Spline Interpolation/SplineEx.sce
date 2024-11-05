clc; clear; xdel(winsid()); format('v',20);

// Section 3.5 Spline Interpolation
// Author: Chad Vidden,  Date:3/24/14
//
// This script plots the piecewise cubic Spline 
// interpolant of f(x)=x^4 =on [0,2] using
// subintervals [0,1], [1,2].

function y=f(x)
    y=x.^4;
endfunction

x = linspace(0, 2, 100); // domian for plotting

// Natural Cubic Spline as computed in class
x1 = linspace(0, 1, 100); // domian for plotting
x2 = linspace(1, 2, 100); // domian for plotting
S1 = (7/2)*x1.^3-(5/2)*x1; // poly interp on [0,1] 
S2 = (-7/2)*x2.^3+21*x2.^2-(47/2)*x2+7; // poly interp on [1,2] 

intx = [0 1 2]; // interpolation points
inty = f(intx);
// Complete Cubic Spline courtesy of Scilab
yk = interp(x, intx, inty, splin(intx,inty,"clamped",[0,4*8]));

subplot(121)
plot(x,f(x),'b+',x1,S1,'g',x2,S2,'r'); 
xtitle("Natural Cubic Spline", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=x^4', 'y=S1(x)', 'y=S2(x)'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;

subplot(122)
plot(x,f(x),'b+',x,yk,'c'); 
xtitle("Complete Cubic Spline", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=x^4', 'y=S(x)'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;
