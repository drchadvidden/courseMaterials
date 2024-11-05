clear; clc; format('v',20); xdel(winsid());

z=locate();
x=z(1,:)';
y=z(2,:)';

n = length(x);
s = (1:n)';
t = (1:.05:n)';
u = splinetx(s,x,t);
v = splinetx(s,y,t);
xdel(winsid());
plot(x,y,'.',u,v,'-');
