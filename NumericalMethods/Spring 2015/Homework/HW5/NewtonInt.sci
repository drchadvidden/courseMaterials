function P=NewtonInt(x,f)
    
n = length(x);
s=poly(0,"s"); // create polynomial variable s
P = 0; // initialize the polynomial

// get divided differences
ddtbl = zeros(n,n+1);
ddtbl(:,1) = x';
ddtbl(:,2) = f';
for j=3:n+1
    for i=1:n-j+2
        ddtbl(i,j) = (ddtbl(i+1,j-1)-ddtbl(i,j-1))/(x(i+j-2)-x(i));
    end
end

w=1;
for j=1:n // loop to compute Newton interp poly
    P=P+w*ddtbl(1,j+1); 
    w=w*(s-x(j));
end
    
endfunction
