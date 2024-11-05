clear; clc; xdel(winsid()); format('v',20);

// Section 2.2 Bisection Method
// Author: Chad Vidden,  Date: 2/10/14
//
// This script executes the Bisection Method for 
// the function f(x)=x^3+4x^2-10 on [1,2]


function y = f(x)
    y=x.^3+4*x.^2-10;    
endfunction


a(1)=1; // left interval endpoint
b(1)=2; // right interval endpoint 
n=1; // iteration count
TOL = 10^(-4); // absolute error tollerance
MaxIters = 100; // maximum allowed iterations


// check for valid input
if f(a(1))==0 then // check if a is a root
    p=a(1); return; // if so, return it
end  
if f(b(1))==0 then // check if b is a root
    p=b(1); return;
end 
// make sure f(a),f(b) differ in sign
if sign(f(a(1)))==sign(f(b(1))) then
    disp("Error: f(a) and f(b) have the same sign");
    p=a(1); return;
end


// main loop for Bisection Method
// iterate til interval width is <= 2TOL
while ((abs(b(n)-a(n))>2*TOL)&(MaxIters>n))
    p(n) = (a(n)+b(n))/2; // bisect interval

    if f(p(n))==0 then // check if pn is a root
        x=p(n); return;
    end

    // check where the root is, (a,pn) or (pn,b),
    // reassign and interate again
    if sign(f(a(n)))==sign(f(p(n))) then // root in (pn,b)
        a(n+1)=p(n);
        b(n+1)=b(n);
    else // root in (a,pn)
        a(n+1)=a(n);
        b(n+1)=p(n);
    end
    n=n+1;
end

// final midpoint as root approx
p(n) = (a(n)+b(n))/2;
pA = p(n) ;
// exact solution to high precision
pExact=1.365230013414096845760807;

// display all the good schtuff
disp("Exact: "+string(pExact))
disp("Apprx: "+string(pA))
disp("Error: "+string(abs(pExact-pA)))
disp("Toler: "+string(TOL))
disp("NItrs: "+string(n))

// look at convergence rate
disp("pn approx            |p(n)-p(n-1)|        |p-p(n)|")
disp([p,[0; abs(p(2:$)-p(1:$-1))],abs(pExact-p)])
