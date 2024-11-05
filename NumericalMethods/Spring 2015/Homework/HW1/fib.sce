clc; xdel(winsid()); // clear the console, close windows

// Fibonacci
// Author: Chad Vidden,  Date: 
//

n=18;
f=zeros(n,1);
f(1)=1;
f(2)=2;

for i=3:n
    f(i)=f(i-1)+f(i-2);
end

disp(f)
plot2d("nl",1:18,f)
xgrid()
