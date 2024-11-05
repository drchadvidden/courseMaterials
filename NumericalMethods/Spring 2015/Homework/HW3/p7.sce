clear; clc; xdel(winsid()); format('v',20);

function y = f(x)
    y=x.^4+2*x.^2-x-3;    
endfunction

function y = fp(x)
    y=4*x.^3+4*x-1;    
endfunction

function y = g1(x)
    y=(3+x-2*x^2)^0.25;
endfunction

function y = g2(x)
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

// fixed point iteration 1
xf1(1)=init;
for n=2:50
    xf1(n)=g1(xf1(n-1));
end

// fixed point iteration 2
xf2(1)=init;
for n=2:9
    xf2(n)=g2(xf2(n-1));
end

// secant method
xs(1)=init;
xs(2)=2;
for n=3:11
    xs(n)=xs(n-1)-f(xs(n-1))*(xs(n-1)-xs(n-2))...
        /(f(xs(n-1))-f(xs(n-2)));
end

// output
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
rxf1 = zeros(length(xf1),1);
for n=2:length(xf1)-1
    rxf1(n)=log(abs((xf1(n+1)-pExact))/abs((xf1(n)-pExact)))...
            /log(abs((xf1(n)-pExact))/abs((xf1(n-1)-pExact)))
end
rxf2 = zeros(length(xf2),1);
for n=2:length(xf2)-1
    rxf2(n)=log(abs((xf2(n+1)-pExact))/abs((xf2(n)-pExact)))...
            /log(abs((xf2(n)-pExact))/abs((xf2(n-1)-pExact)))
end

disp("FP1")
disp([xf1 abs(xf1-pExact) rxf1])
disp("FP2")
disp([xf2 abs(xf2-pExact) rxf2])
disp("Secant")
disp([xs abs(xs-pExact) rxs])
disp("Newton")
disp([xt abs(xt-pExact) rxt])

