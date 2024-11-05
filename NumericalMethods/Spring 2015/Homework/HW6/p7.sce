clc; clear; xdel(winsid()); format('v',20);

// problem 7

a=1; c=a; e=a; d=0; f=100; b=-50;
x = linspace(0, 3, 100); // domian for plotting

// Natural Cubic Spline as computed in class
x1 = linspace(0, 1, 100); // domian for plotting
x2 = linspace(1, 2, 100); // domian for plotting
x3 = linspace(2, 3, 100); // domian for plotting
P1 = a*x1.^2+b*(x1-1).^3; // poly interp on [0,1] 
P2 = c*x2.^2+d; // poly interp on [1,2] 
P3 = e*x3.^2+f*(x3-2).^3; // poly interp on [2,3] 

plot(x1,P1,'g',x2,P2,'r',x3,P3,'c'); 
a=gca(); // make lines thicker\
a.children.children.thickness = 3;
