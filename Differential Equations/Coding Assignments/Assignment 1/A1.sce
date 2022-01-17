clc; xdel(winsid()); // clear the console, close windows

// right hand side function
function yp = f(t,y) 
    yp=2*y+1
endfunction

// true solution
function ytrue = g(t)
    ytrue = 0.5*(7*exp(2*t)-1)
endfunction

// foward euler
function y = Euler(y0,t,f)
    y = y0

    for j=1:(length(t)-1)
        y0 = y0 + dt*f(t(j),y0);
        y = [y y0];
    end
endfunction

t0 = 0
tN = 2
dt = 0.5
t = t0:dt:tN

y0 = 3

y = Euler(y0,t,f)

disp(y)

ytrue = g(t)
plot(t,y,t,ytrue)
