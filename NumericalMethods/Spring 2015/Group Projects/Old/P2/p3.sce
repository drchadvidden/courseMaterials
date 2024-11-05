clc; clear; xdel(winsid()); format('v',20);

// p3

function y=f(x) // function to interpolate
    y=sin(x).*sin((2*x+5)/10);
endfunction

a=-5; b=5;

x=linspace(a, b, 1000)'; 

n=10; 
xn=linspace(a, b, n+1)'; 
fn=f(xn);
fy=f(x);

yk = interp(x, xn, fn, splin(xn,fn,"not_a_knot"));
yf = interp(x, xn, fn, splin(xn,fn,"fast"));
ym = interp(x, xn, fn, splin(xn,fn,"monotone"));
plot(x, fy, 'b', x, yk, 'g', x, yf, 'c', x, ym, 'k')
plot(xn,fn,'*r')  // to show interpolation points
xtitle("Various splines", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=f(x)', 'not a knot', 'fast', 'monotone'],2); // graph legend
