function P=natCubicSpline(xn,fn)
    
// this function computes the natural cubic spline
// approximation to a function using equally spaced 
// intervals. x gives the interpolation nodes and f
// gives the function values at these nodes. the
// returned array P contains the Scilab cubic 
// polynomial for each interval.
 
clc; clear; xdel(winsid()); format('v',20);


n=length(xn)-1; 
a=xn(1); b=xn($);
h = (b-a)/n;

b=(fn(3:$)-2*fn(2:$-1)+fn(1:$-2))./h; b=b';

//A=diag((2*h/3)*ones(n-1,1))+diag((h/6)*ones(n-2,1),1) ...
//             +diag((h/6)*ones(n-2,1),-1);

//z=A\b;
//z=[0; z; 0]

u=(2*h/3)*ones(n-1,1);
hv=(h/6)*ones(n-2,1);
z=trisolver(u,hv,b);
z=[0; z; 0]

s=poly(0,"s");
for i=2:n+1
    P(i-1) = (1/h)*z(i-1)*((xn(i)-s)^3)/6 ...
            + (1/h)*z(i)*((s-xn(i-1)))^3/6 ...
            +(1/h)*(fn(i)-fn(i-1)+(h^2/6)*(z(i-1)-z(i)))*(s-xn(i-1)) ...
            +fn(i-1)-(h^2/6)*z(i-1);
end

 
endfunction
