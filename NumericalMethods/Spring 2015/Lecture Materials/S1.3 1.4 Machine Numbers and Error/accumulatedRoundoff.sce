clc; xdel(winsid()); //format('v',25); 
// clear the console, close windows, display more digits

// Accumulated Roundoff Error
// Author: Chad Vidden,  Date: 1/28/15
//
// This example illustrates how costly roundoff error
// can be. 

n=56;
x(1)=1/10; 

for k=1:n
    disp('x('+string(k)+')='+string(x(k)))
    if x(k)>=0 & x(k)<=0.5
        x(k+1)=2*x(k);
    elseif x(k)>0.5 & x(k)<=1
        x(k+1)=2*x(k)-1;
    end
end

