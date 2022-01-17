clc; xdel(winsid()); // clear the console, close windows

// right hand side function
function yp = f(t,y) 
    yp=-100*y
endfunction

// true solution
function ytrue = g(t)
    ytrue = exp(-100*t)
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
tN = 1/5
dt = 1/200
t = t0:dt:tN

y0 = 1

yFE = Euler(y0,t,f)

disp(yFE)

ytrue = g(t)
plot(t,yFE,t,ytrue)

// backward euler
y = y0
for j=1:(length(t)-1)
    y0 = (1/(1+100*dt))*y0;
    y = [y y0];
end

yBE = y

disp(yBE)

// centered euler
y0 = 1
y = y0
for j=1:(length(t)-1)
    y0 = ((1-50*dt)/(1+50*dt))*y0;
    y = [y y0];
end

yCE = y

disp(yCE)

tmore = t0:0.001:tN
ytrue = g(tmore)
plot(t,yBE,t,yCE,tmore,ytrue)

