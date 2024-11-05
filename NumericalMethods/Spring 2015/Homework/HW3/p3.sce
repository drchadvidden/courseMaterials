clc; clear;

// problem 3 functions
function y=f1(x)
    y=sin(x)-x-1;
endfunction
function y=df1(x)
    y=cos(x)-1;
endfunction
function y=f2(x)
    y=x*(1-cos(x));
endfunction
function y=df2(x)
    y=1-cos(x)+x*sin(x);
endfunction
function y=f3(x)
    y=%e^x-x^2+3*x-2;
endfunction
function y=df3(x)
    y=%e^x-2*x+3;
endfunction

a=-2; b=1;

//////////////////////////////////////////////////////
// BISECTION------------------------------------------
//////////////////////////////////////////////////////

exec('C:\Users\cvidden\Documents\UWLAX\Teaching\MTH 371\Spring 2015\Homework\HW3\Bisection.sci', -1)

NumIters1=0;NumIters2=0;NumIters3=0;
TOL=10^(-6);
MaxIters=500;
[x1,NumIters1] = Bisection(f1,a,b,TOL,MaxIters) 
[x2,NumIters2] = Bisection(f2,a,b,TOL,MaxIters) 
[x3,NumIters3] = Bisection(f3,a,b,TOL,MaxIters) 

disp("Bisection:")
disp([[NumIters1,NumIters2,NumIters3]' ,[x1($),x2($),x3($)]'])

//////////////////////////////////////////////////////
// SECANT --------------------------------------------
//////////////////////////////////////////////////////
NumIters1=0;NumIters2=0;NumIters3=0;
TOL=10^(-6);
MaxIters=500;
// secant method
x1(1)=1;x2(1)=1;x3(1)=1;
x1(2)=0.9;x2(2)=0.9;x3(2)=0.9;
k=2;
while ((abs(x1(k)-x1(k-1))>TOL)&(MaxIters>NumIters1))
    NumIters1=NumIters1+1;
    k=k+1;
    x1(k)=x1(k-1)-f1(x1(k-1))*(x1(k-1)-x1(k-2))...
        /(f1(x1(k-1))-f1(x1(k-2)));
end
k=2;
while ((abs(x2(k)-x2(k-1))>TOL)&(MaxIters>NumIters2))
    NumIters2=NumIters2+1;
    k=k+1;
    x2(k)=x2(k-1)-f2(x2(k-1))*(x2(k-1)-x2(k-2))...
        /(f2(x2(k-1))-f2(x2(k-2)));
end
k=2;
while ((abs(x3(k)-x3(k-1))>TOL)&(MaxIters>NumIters2))
    NumIters3=NumIters3+1;
    k=k+1;
    x3(k)=x3(k-1)-f3(x3(k-1))*(x3(k-1)-x3(k-2))...
        /(f3(x3(k-1))-f3(x3(k-2)));
end

disp("Secant:")
disp([[NumIters1,NumIters2,NumIters3]' ,[x1($),x2($),x3($)]'])


//////////////////////////////////////////////////////
// NEWTON --------------------------------------------
//////////////////////////////////////////////////////
NumIters1=0;NumIters2=0;NumIters3=0;
TOL=10^(-6);
MaxIters=500;
x1 = [1]; x2 = [1]; x3 = [1]; 
x1(2) = x1(1)-f1(x1(1))/df1(x1(1));
x2(2) = x2(1)-f2(x2(1))/df2(x2(1));
x3(2) = x3(1)-f3(x3(1))/df3(x3(1));
k=2;
// main loop for Newtons Method
while ((abs(x1(k)-x1(k-1))>TOL)&(MaxIters>NumIters1))
    NumIters1=NumIters1+1;
    x1(k+1) = x1(k)-f1(x1(k))/df1(x1(k));   
    k=k+1;
end
k=2;
while ((abs(x2(k)-x2(k-1))>TOL)&(MaxIters>NumIters2))
    NumIters2=NumIters2+1;
    x2(k+1) = x2(k)-f2(x2(k))/df2(x2(k));  
    k=k+1;
end
k=2;
while ((abs(x3(k)-x3(k-1))>TOL)&(MaxIters>NumIters3))
    NumIters3=NumIters3+1;
    x3(k+1) = x3(k)-f3(x3(k))/df3(x3(k));    
    k=k+1;
end

disp("Newton:")
disp([[NumIters1,NumIters2,NumIters3]' ,[x1($),x2($),x3($)]'])


    
