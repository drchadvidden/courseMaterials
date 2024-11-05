clc; clear; xdel(winsid()); format('v',20);

// p3

function y=f(x) // function to interpolate
    y=1.0./(1+25*x.^2);
endfunction

x = linspace(-1, 1, 100); // domian for plotting

n=10; // interpolation polynomial degree
xn = linspace(-1, 1, n+1); // interpolation nodes
i=0:n;
xch = cos(%pi*i./n); // chebyshev
fn = f(xn); // function values at each
fch = f(xch);
s=poly(0,"s"); // create polynomial variable s
P = 0; // initialize the polynomial
Pch = 0; // initialize the polynomial

for i=1:n+1 // loop to compute Lagrange interp poly
    L=1;
    for j=[1:i-1,i+1:n+1] 
        L=L*(s-xn(j))/(xn(i)-xn(j)); 
    end
    P=P+L*fn(i); 
end
for i=1:n+1 // loop to compute Lagrange interp poly
    L=1;
    for j=[1:i-1,i+1:n+1] 
        L=L*(s-xch(j))/(xch(i)-xch(j)); 
    end
    Pch=Pch+L*fch(i); 
end

Pvals = horner(P,x); // polynomial evaluation
Pchvals = horner(Pch,x); // polynomial evaluation


// plot function and intepolant
//subplot(121)
plot(x,f(x),"b",x,Pvals,"g",x,Pchvals,"r"); 
xtitle("n = " + string(n) + " Interpolation Polynomial", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=1/(1+25x^2))', 'y=P(x)', 'y=Pch(x)'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;


// compute and plot error
//err = abs(Pvals - f(x));
//subplot(122)
//plot(x,err,"r"); // plot error
//xtitle("n = " + string(n) + " Error", ...
//    "x-axis", "y-axis"); // graph title and axis labels
//legend(['Error'],2); // graph legend
//a=gca(); // make lines thicker
//a.children.children.thickness = 3;




