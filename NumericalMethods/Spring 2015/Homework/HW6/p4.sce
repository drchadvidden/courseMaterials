clc; clear; xdel(winsid()); format('v',20);

// problem 4


x = linspace(0, 2, 100); // domian for plotting

// Natural Cubic Spline as computed in class
x1 = linspace(0, 1, 100); // domian for plotting
x2 = linspace(1, 2, 100); // domian for plotting
P1 = x1.^2+1; // poly interp on [0,1] 
P2 = -4*x2.^2+10*x2-4; // poly interp on [1,2] 

plot(x1,P1,'g',x2,P2,'r'); 
a=gca(); // make lines thicker\
a.children.children.thickness = 3;
