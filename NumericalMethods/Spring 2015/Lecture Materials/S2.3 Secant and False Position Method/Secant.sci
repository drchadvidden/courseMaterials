function [p,NumIters] = Secant(f,x0,x1,TOL,MaxIters)

    // Section 2.2, Bisection Method
    // Author: Chad Vidden,  Date: 2/10/14
    //
    // This function implements the  Method
    // for solving f(x)=0 on interval (a,b) with 
    // absolute error tolerance TOL and maximum 
    // iterations MaxIter. The approximate root x
    // and iteration count is returned.

    NumIters=0; // count number of iterations

    if f(x0)==0 then // check if x0 is a root
        p=x0; return; // if so, return it
    end
    if f(x1)==0 then // check if b is a root
        p=x1; return;
    end 
       
    x = [x0, x1]; // array of approximations
    k=2;
    // main loop for Secant Method
    while ((abs(x(k)-x(k-1))>TOL)&(MaxIters>NumIters))
        NumIters = NumIters + 1; // iter count
        
        // Secant Method iteration
        x(k+1) = x(k)-(f(x(k))*(x(k)-x(k-1)))/(f(x(k))-f(x(k-1)));
        
        k=k+1;
    end
    
    p = x(k);
        
endfunction
