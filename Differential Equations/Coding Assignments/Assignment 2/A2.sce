clc; xdel(winsid()); // clear the console, close windows

// right hand side function
function yp = f(t,y) 
    yp=-2*t*y^2
endfunction

// true solution
function ytrue = g(t)
    ytrue = 1./(1+t.^2)
endfunction

// foward euler
function y = Euler(y0,t,f)
    y = y0
    dtE = t(2)-t(1)

    for j=1:(length(t)-1)
        y0 = y0 + dtE*f(t(j),y0);
        y = [y y0];
    end
endfunction

// foward euler
function y = ImprovedEuler(y0,t,f)
    y = y0
    dtI = t(2)-t(1)

    for j=1:(length(t)-1)
        m = f(t(j),y0);
        y0m = y0 + dtI*m
        n = f(t(j+1),y0m);
        y0 = y0 + dtI*(m+n)/2
        y = [y y0];
    end
endfunction

t0 = 0
tN = 2
dt = 0.1
t = t0:dt:tN

y0 = 1
y1 = ImprovedEuler(y0,t,f)

t = t0:dt/2:tN
y0 = 1
y2 = ImprovedEuler(y0,t,f)

t = t0:dt/4:tN
y0 = 1
y3 = ImprovedEuler(y0,t,f)

t = t0:dt/8:tN
y0 = 1
y4 = ImprovedEuler(y0,t,f)


ytrue = g(t)

e1 = abs(y1(length(y1))-ytrue(length(ytrue)))
e2 = abs(y2(length(y2))-ytrue(length(ytrue)))
e3 = abs(y3(length(y3))-ytrue(length(ytrue)))
e4 = abs(y4(length(y4))-ytrue(length(ytrue)))

disp(log(e1/e2)/log(2))
disp(log(e2/e3)/log(2))
disp(log(e3/e4)/log(2))

