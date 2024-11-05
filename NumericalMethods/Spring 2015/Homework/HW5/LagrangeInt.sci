function P=LagrangeInt(x,f)
    
n = length(x)-1;
s=poly(0,"s"); // create polynomial variable s
P = 0; // initialize the polynomial

for i=1:n+1 // loop to compute Lagrange interp poly
    L=1;
    for j=[1:i-1,i+1:n+1] 
        L=L*(s-x(j))/(x(i)-x(j)); 
    end
    P=P+L*f(i); 
end
    
endfunction
