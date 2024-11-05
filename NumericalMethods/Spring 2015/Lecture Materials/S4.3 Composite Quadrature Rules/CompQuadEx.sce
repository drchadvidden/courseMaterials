clc; clear; xdel(winsid()); format('v',20);

// Section 4.3 Composite Quadrature Rules
// Author: Chad Vidden,  Date:3/24/14
//
// This script computes the composite trapezoidal
// and Simpson's rules for \int_0^2 e^x dx. 

function y=f(x)
    y = exp(x);
endfunction

a=0; b=2;

// loop through many number of subintervals
for n=2:10
    h = (b-a)/n;
    
    T(n)=f(a); // trapezoidal rule approx
    S(n)=f(a); // Simpson's rule approx
    
    for i = 1:n-1
        xi = a + i*h;
        
        T(n)=T(n)+2*f(xi);
        
        S(n)=S(n)+4*f(xi - h/2)+2*f(xi);
    end
    
    T(n)=T(n)+f(b);
    T(n)=(h/2)*T(n);
    
    S(n)=S(n)+4*f(b-h/2)+f(b);
    S(n)=(h/6)*S(n);
end

disp("Quadrature Rule Approximations: ")
disp([T S])
disp("Exact: " + string(exp(2)-1))
disp("Absolute Error: ")
disp(abs([T S] - (exp(2)-1)))
