clc; clear; xdel(winsid()); format('e',20);

// Section 5.2 Taylor Methods for IVPs
// Author: Chad Vidden,  Date:4/25/14
//
// This script computes the Euler's method approximation
// to the initial value problem 
//      y'=f(t,y)=2ty, 0<=t<=1
//      y(0)=1

function z=f(t,y)
    z=2*t.*y;
//    z=-y.^2;
endfunction

function y=yexact(t)
    y=exp(t.^2);
//    y=1. ./(1+t);
endfunction

a=0; b=1
//a=0; b=12
y0=1;

n=4; h=(b-a)/n;
//n=12; h=(b-a)/n;
t=a:h:b;

w(1)=y0;
for i=1:n
    w(i+1) = w(i)+h*f(t(i),w(i));
end


disp('t'+ascii(9)+ascii(9)+ascii(9)+'Eulers Method'+ascii(9)+ascii(9)+ascii(9)+'Exact')
disp([t', w, yexact(t)'])
disp('Absolute Error')
disp(abs(w-yexact(t)'))


tplot=linspace(0,1,1000)
//tplot=linspace(0,12,1000)
plot(tplot,yexact(tplot),t,w,'r', ...
        t,yexact(t),'b*',t,w,'r*'); 
xtitle("Eulers Method Approximation", ...
    "x-axis", "y-axis");
legend(['Exact', 'Euler'],2); 
a=gca(); 
a.children.children.thickness = 3;
a.data_bounds=[-.01 0.99;1.01 2.8];

