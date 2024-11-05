clc; clear; xdel(winsid()); format('v',20);

// problem 1

function y=f(x)
    y=1 ./(1+x.^2);
endfunction
function y=fp(x)
    y=-2*x ./((1+x.^2).^2);
endfunction

exec('C:\Users\cvidden\Documents\UWLAX\Teaching\MTH 371\Spring 2013\Homework\HW5\NewtonInt.sci', -1)

x = linspace(-5,5,1000);
xn = linspace(-5,5,13);
fn = f(xn);
fpn = fp(xn);
h = 10/(length(xn)-1);

// NORMAL INTERPOLANT //////////////////////////////////////
Q=NewtonInt(xn,fn);
subplot(221)
plot(x,f(x),x,horner(Q,x))
xtitle(" Single polynomial interpolant", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=f(x)', 'y=P(x)'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;

// PW LINEAR INTERPOLANT //////////////////////////////////////
s=poly(0,"s"); // create polynomial variable s
for i=1:length(xn)-1
    // linear interpolant
    L(i) = fn(i)*((s-xn(i+1))/(xn(i)-xn(i+1))) ...
                 + fn(i+1)*((s-xn(i))/(xn(i+1)-xn(i)));;
end
subplot(222)
plot(x,f(x))
for i=1:length(xn)-1
    xvals = linspace(xn(i),xn(i+1),100);
    plot(xvals,horner(L(i),xvals),'g');
end
xtitle("PW linear interpolant", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=f(x)', 'y=L(x)'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 2;



// HERMITE INTERPOLANT //////////////////////////////////////
for i=1:length(xn)-1
    // hermite interpolant
    alpha = (3/h^2)*(fpn(i)+fpn(i+1))+(6/h^3)*(fn(i)-fn(i+1));
    P(i) = (-fpn(i)/h)*((s-xn(i+1))^2/2 - h^2/2) ...
                 + (fpn(i+1)/h)*((s-xn(i))^2/2) ...
                 +alpha*(s-xn(i))^2*((s-xn(i))/3-h/2)+fn(i);
end
subplot(223)
plot(x,f(x))
for i=1:length(xn)-1
    xvals = linspace(xn(i),xn(i+1),100);
    plot(xvals,horner(P(i),xvals),'g');
end
xtitle("PW linear interpolant", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=f(x)', 'y=L(x)'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 2;


// NATURAL SPLINE INTERPOLANT //////////////////////////////////////
S = interp(x, xn, fn, splin(xn,fn,"natural"));
subplot(224)
plot(x,f(x),x,S)
xtitle("Natural Spline Interpolant", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=f(x)', 'y=S(x)'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 2;
