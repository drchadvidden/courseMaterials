clc; xdel(winsid()); //format('v',25); 
// clear the console, close windows, display more digits

// Accumulated Roundoff Error
// Author: Chad Vidden,  Date: 1/28/15
//
// This example illustrates how costly roundoff error
// can be. 

k=1;
x(1)=1/10; 

while k~=0
    k
    disp('x('+string(k)+')='+string(x(k)))
    if x(k)>=0 & x(k)<=0.5
        x(k+1)=2*x(k);
    elseif x(k)>0.5 & x(k)<=1
        x(k+1)=2*x(k)-1;
    end
    if x(k)==1
        k=0
    else
        k=k+1
    end
end

