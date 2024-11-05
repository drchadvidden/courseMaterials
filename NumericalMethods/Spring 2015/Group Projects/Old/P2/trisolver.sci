function x=trisolver(u,h,b)
    
// this function solves the system Ax=b where A is a 
// symmetric tridiagonal matrix with main diagonal
// u, lower diagonal h, and upper diagonal h.
 
 n=length(u);
 
 for i=2:n
     u(i)=u(i)-((h(i-1)^2)/(u(i-1)));
     b(i)=b(i)-(h(i-1)/(u(i-1)))*b(i-1);
 end
 
 x=zeros(n,1);
 x(n)=b(n)/u(n);
 for i=n-1:-1:1
     x(i)=(b(i)-h(i)*x(i+1))/u(i);
 end
 
endfunction
