clc; xdel(winsid()); format('v',20);

// problem 7
n=4;
x=linspace(0,2*%pi,n+1);
f=sin(x);
P=LagrangeInt(x,f);
disp(P)
Q=NewtonInt(x,f);
disp(Q)
xplot=linspace(0,2*%pi,200);
plot(xplot,sin(xplot),xplot,horner(P,xplot))


g=cos(x);
P=LagrangeInt(x,g);
xplot=linspace(0,2*%pi,200);
//plot(xplot,cos(xplot),xplot,horner(P,xplot))


x=linspace(0.5,2,n+1);
h=log(x);
P=LagrangeInt(x,h);
xplot=linspace(0.5,2,200);
//plot(xplot,log(xplot),xplot,horner(P,xplot))

x=linspace(0,2,n+1);
i=exp(x);
P=LagrangeInt(x,i);
xplot=linspace(0,2,200);
//plot(xplot,exp(xplot),xplot,horner(P,xplot))
