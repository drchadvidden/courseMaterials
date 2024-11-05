clc; clear; xdel(winsid()); format('v',20);

// problem 4

function y=f(x)
    y = x.^3+2*x.^2+x+1;
endfunction

// part a
xn = [-1 0 1];
fn = f(xn);
n = length(xn)-1;
s=poly(0,"s"); // create polynomial variable s
P = 0; // initialize the polynomial

for i=1:n+1 // loop to compute Lagrange interp poly
    L=1;
    for j=[1:i-1,i+1:n+1] 
        L=L*(s-xn(j))/(xn(i)-xn(j)); 
    end
    P=P+L*fn(i); 
end

disp(P)
disp(horner(P,xn))
disp(f(xn))

// part b
xn = [-2 -1 0 1 2];
fn = f(xn);
n = length(xn)-1;
s=poly(0,"s"); // create polynomial variable s
P = 0; // initialize the polynomial

for i=1:n+1 // loop to compute Lagrange interp poly
    L=1;
    for j=[1:i-1,i+1:n+1] 
        L=L*(s-xn(j))/(xn(i)-xn(j)); 
    end
    P=P+L*fn(i); 
end

disp(P)
disp(horner(P,xn))
disp(f(xn))

