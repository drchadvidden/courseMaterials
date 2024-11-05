clc; clear; xdel(winsid()); format('v',20);

// p2

exec('C:\Users\cvidden\Documents\UWLAX\Teaching\MTH 371\Spring 2013\Homework\Group Projects\P2\trisolver.sci', -1)
exec('C:\Users\cvidden\Documents\UWLAX\Teaching\MTH 371\Spring 2013\Homework\Group Projects\P2\natCubicSpline.sci', -1)

function y=f(x) // function to interpolate
    y=sin(x).*sin((2*x+5)/10);
endfunction

a=-5; b=5;

x=linspace(a, b, 1000); 

n=10; 
xn=linspace(a, b, n+1); 
h = (b-a)/n;
fn=f(xn);


s=poly(0,"s");
P=natCubicSpline(xn,fn)


plot(x,f(x))
for i=1:length(xn)-1
    xvals = linspace(xn(i),xn(i+1),100);
    plot(xvals,horner(P(i),xvals),'g');
    plot(xn(i),f(xn(i)),'*r')
end
plot(xn($),f(xn($)),'*r')
xtitle("Spline Interpolant", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=f(x)', 'y=S(x)'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;

