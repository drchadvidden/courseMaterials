clear; clc;

figure('position',get(0,'screensize'))
axes('position',[0 0 1 1])
[x,y] = ginput;

n = length(x);
s = (1:n)';
t = (1:.05:n)';
u = splinetx(s,x,t);
v = splinetx(s,y,t);
clf reset
plot(x,y,'.',u,v,'-');