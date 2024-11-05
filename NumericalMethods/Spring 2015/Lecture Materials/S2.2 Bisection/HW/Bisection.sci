function [p,NumIters] = Bisection(f,a,b,TOL,MaxIters)

    // Section 2.2, Bisection Method
    // Author: Chad Vidden,  Date: 2/10/14
    //
    // This function implements the Bisection Method
    // for solving f(x)=0 on interval (a,b) with 
    // absolute error tolerance TOL and maximum 
    // iterations MaxIter. The approximate root x
    // and iteration count is returned.

    NumIters=0; // count number of iterations

    fa=f(a);
    if fa==0 then // check if a is a root
        p=a; return; // if so, return it
    end
    fb=f(b);   
    if fb==0 then // check if b is a root
        p=b; return;
    end 
    
    // make sure f(a),f(b) differ in sign
    if sign(fa)==sign(fb) then
        disp("Error: f(a) and f(b) have the same sign");
        p=a; return;
    end
    
    // main loop for Bisection Method
    // iterate til interval width is <= 2TOL
    while ((abs(b-a)>2*TOL)&(MaxIters-1>NumIters))
        NumIters = NumIters + 1; // iter count
        c = (a+b)/2; // bisect interval
        fc = f(c);
        
        if fc==0 then // check if c is a root
            x=c; return;
        end 
        
        // check where the root is, (a,c) or (c,b),
        // reassign and interate again
        if sign(fa)==sign(fc) then // root in (c,b)
            a=c;
            fa=fc;
        else // root in (a,c)
            b=c;
            fb=fc;
        end
    end
    
    NumIters = NumIters + 1; // iter count
    // return final midpoint as root approx
    p = (a+b)/2; 
    
endfunction
