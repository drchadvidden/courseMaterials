clc; clear; xdel(winsid()); format('v',20);

// Section 3.2 Lagrange Interpolation
// Author: Chad Vidden,  Date:3/5/14
//
// This script computes a degree n polynomial interpolant
// for f(x)=1/(1+x^2) on [-5,5] using equally spaced nodes.
// For small n, this interpolant approximates well, but for 
// large n, the error becomes large. 


function y=f(x) // function to interpolate
    y=1.0./(1+x.^2);
endfunction

x = linspace(-5, 5, 1000); // domian for plotting

n=12; // interpolation polynomial degree
xn = linspace(-5, 5, n+1); // interpolation nodes
fn = f(xn); // function values at each
s=poly(0,"s"); // create polynomial variable s
P = 0; // initialize the polynomial

for i=1:n+1 // loop to compute Lagrange interp poly
    L=1;
    for j=[1:i-1,i+1:n+1] 
        L=L*(s-xn(j))/(xn(i)-xn(j)); 
    end
    P=P+L*fn(i); 
end

disp(P)

Pvals = horner(P,x); // polynomial evaluation


// plot function and intepolant
subplot(121)
plot(x,f(x),"b",x,Pvals,"g"); 
xtitle("n = " + string(n) + " Interpolation Polynomial", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=1/(1+x^2))', 'y=P(x)'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;


// compute and plot error
err = abs(Pvals - f(x));
subplot(122)
plot(x,err,"r"); // plot error
xtitle("n = " + string(n) + " Error", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['Error'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;




