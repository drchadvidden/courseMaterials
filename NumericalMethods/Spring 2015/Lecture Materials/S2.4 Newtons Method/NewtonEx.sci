clear; clc;

function y=f(x)
//    y=sin(x)-x-1;
//    y=x*(1-cos(x));
//    y=%e^x-x^2+3*x-2;
    y=x^2-2;
endfunction
function y=df(x)
//    y=cos(x)-1;
//    y=1-cos(x)+x*sin(x);
//    y=%e^x-2*x+3;
    y=2*x;
endfunction


NumIters=0;
TOL=10^(-10);
MaxIters=500;
x = [1]; 
x(2) = x(1)-f(x(1))/df(x(1));
k=2;
// main loop for newtons Method
while ((abs(x(k)-x(k-1))>TOL)&(MaxIters>NumIters))
    NumIters=NumIters+1;
    x(k+1) = x(k)-f(x(k))/df(x(k));    
    k=k+1;
end

disp(x)
disp(NumIters)
    
