clc; clear; xdel(winsid()); format('e',20);

// Section 4.9 Numerical Differentiation
// Author: Chad Vidden,  Date:4/16/14
//
// This script computes the forward difference, centered 
// difference, and Richardson exptrapolation for centered 
// difference in order to approimate d/dx sin(x) |x=pi/3

function y=f(x)
    y=sin(x);
endfunction

x0=%pi/3;
exact=0.5;

// approximate d/dx sin(x) at x=x0, loop over many h values
for i=1:16
    h(i)=10^(-i);
    // forward difference
    fd(i) = (f(x0+h(i))-f(x0))/h(i);
    // centered difference
    cfd(i) = (f(x0+h(i))-f(x0-h(i)))/(2*h(i));
    // centered difference, h/2 version
    cfdh2(i) = (f(x0+h(i)/2)-f(x0-h(i)/2))/(2*h(i)/2);
    // richardson extrapolation
    richcfd(i) = (4/3)*cfdh2(i)-(1/3)*cfd(i);
end

// compute absolue errors
errfd = abs(exact - fd);
errcfd = abs(exact - cfd);
errrichcfd = abs(exact - richcfd);

// print results.
disp('order 1     h     approximation      error')
disp([h fd errfd])

disp('order 2     h     approximation      error')
disp([h cfd errcfd])

disp('order 4     h     approximation      error')
disp([h richcfd errrichcfd])
