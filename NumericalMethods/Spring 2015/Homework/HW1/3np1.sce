clc; xdel(winsid()); // clear the console, close windows

// 3n+1
// Author: Chad Vidden,  Date: 
//

m=1;
for n=108:110

y=n;
disp(n)
while n>1
    if modulo(n,2)==0
        n=n/2;
    else
        n=3*n+1;
    end
    y=[y n];

end

m=[m max(y)];
plot2d(y)
xgrid()
end
