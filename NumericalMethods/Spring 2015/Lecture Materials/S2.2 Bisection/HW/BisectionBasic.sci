function p = BisectionBasic(f,a,b,TOL)

    // Section 2.2, Bisection Method
    // Author: Chad Vidden,  Date: 2/10/14
    //
    // This function implements the Bisection Method
    // for solving f(x)=0 on interval (a,b) with 
    // absolute error tolerance TOL. 
    // The approximate root x is returned.

    fa=f(a);
    fb=f(b);   
        
    // main loop for Bisection Method
    // iterate til interval width is <= 2TOL
    while (abs(b-a)>2*TOL)
        c = (a+b)/2; // bisect interval
        fc = f(c);
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
    
    // return final midpoint as root approx
    p = (a+b)/2; 
    
endfunction
