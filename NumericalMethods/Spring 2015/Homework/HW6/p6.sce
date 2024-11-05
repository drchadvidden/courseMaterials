clc; clear; xdel(winsid()); format('v',20);

// problem 6


x = linspace(0, 3, 100); // domian for plotting

// Natural Cubic Spline as computed in class
x1 = linspace(0, 1, 100); // domian for plotting
x2 = linspace(1, 2, 100); // domian for plotting
x3 = linspace(2, 3, 100); // domian for plotting
P1 = 1+x1-x1.^3; // poly interp on [0,1] 
P2 = 1-2*(x2-1)-3*(x2-1).^2+4*(x2-1).^3; // poly interp on [1,2] 
P3 = 4*(x3-2)+9*(x3-2).^2-3*(x3-2).^3; // poly interp on [2,3] 

plot(x1,P1,'g',x2,P2,'r',x3,P3,'c'); 
a=gca(); // make lines thicker\
a.children.children.thickness = 3;
