clear; clc; xdel(winsid()); format('v',20);

// Section: Fixed Point Methods
// Author: Chad Vidden,  Date: 2/18/14
//
// This script finds an approximation x^4+2x^2-x-3=0

function y = f(x)
    y=x.^4+2*x.^2-x-3;    
endfunction

function y = fp(x)
    y=4*x.^3+4*x-1;    
endfunction

function y = g(x)
//    y=(3+x-2*x.^2).^0.25; 
    y=(3*x^4+2*x^2+3)/(4*x^3+4*x-1)
endfunction


pExact = 1.12412302970432;
N=10;
init=1/2;

// newtons method
xt(1)=init;
for n=2:10
    xt(n)=xt(n-1)-f(xt(n-1))/fp(xt(n-1));
end

// fixed point iteration
xf(1)=init;
//for n=2:50
for n=2:9
    xf(n)=g(xf(n-1));
end

// secant method
xs(1)=init;
xs(2)=2;
for n=3:11
    xs(n)=xs(n-1)-f(xs(n-1))*(xs(n-1)-xs(n-2))...
        /(f(xs(n-1))-f(xs(n-2)));
end

rxt = zeros(length(xt),1);
for n=2:length(xt)-1
    rxt(n)=log(abs((xt(n+1)-pExact))/abs((xt(n)-pExact)))...
            /log(abs((xt(n)-pExact))/abs((xt(n-1)-pExact)))
end
rxs = zeros(length(xs),1);
for n=2:length(xs)-1
    rxs(n)=log(abs((xs(n+1)-pExact))/abs((xs(n)-pExact)))...
            /log(abs((xs(n)-pExact))/abs((xs(n-1)-pExact)))
end
rxf = zeros(length(xf),1);
for n=2:length(xf)-1
    rxf(n)=log(abs((xf(n+1)-pExact))/abs((xf(n)-pExact)))...
            /log(abs((xf(n)-pExact))/abs((xf(n-1)-pExact)))
end

disp([xf abs(xf-pExact) rxf])
disp([xs abs(xs-pExact) rxs])
disp([xt abs(xt-pExact) rxt])

