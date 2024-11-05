clc; clear; xdel(winsid()); format('v',20);

function y = f(x)
    y=x.^3-2;    
endfunction
function y = df(x)
    y=3*x.^2;    
endfunction


a=1; b=2;

disp('Bisection:')
fa=f(a(1));
fb=f(b(1));   
    
// main loop for Bisection Method
// iterate til interval width is <= 2TOL
for i=1:5
    c(i) = (a(i)+b(i))/2; // bisect interval
    fc = f(c(i));
    // check where the root is, (a,c) or (c,b),
    // reassign and interate again
    if sign(fa)==sign(fc) then // root in (c,b)
        a(i+1)=c(i);
        b(i+1)=b(i);
        fa=fc;
    else // root in (a,c)
        a(i+1)=a(i);
        b(i+1)=c(i);
        fb=fc;
    end
end
disp(c)

// newton's method iterations
p(1)=1.5;
disp('Newton:')

for k=1:5
    p(k+1) = p(k)-f(p(k))/df(p(k));    
end

disp(p)

// exact
disp('Exact: 2^(1/3)=' + string(2^(1/3)))
    

