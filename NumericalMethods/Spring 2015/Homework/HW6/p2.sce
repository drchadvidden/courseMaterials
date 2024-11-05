clc; clear; xdel(winsid()); format('v',20);

// problem 2

x = linspace(0,2*%pi,1000);
y = sin(x);

r = %pi*rand(100,1);

for j=1:length(r)
    ind = find(x>=r(j));
    i=ind(1)-1;
    // linear interpolant
    sinrest(j) = y(i)*((r(j)-x(i+1))/(x(i)-x(i+1))) ...
                 + y(i+1)*((r(j)-x(i))/(x(i+1)-x(i)));;
end

subplot(121)
plot(r,sin(r),"b*",r,sinrest,"g+"); 
xtitle(" Exact and Linear Interp Approx", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=sin(r)', 'y=sin(r) est'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;

[sr,k]=gsort(r,'lr','i');
sinrest = sinrest(k);
// compute and plot error
err = abs(sinrest - sin(sr));
relerr = abs(sinrest - sin(sr))./abs(sin(sr));
subplot(122)
plot(err,"r"); // plot error
xtitle(" Error", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['Error'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;

disp(max(err))
disp(max(relerr))
