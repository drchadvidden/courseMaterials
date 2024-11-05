clc; clear; xdel(winsid()); format('v',20);

// problem 2

x = [8 9 10 11 12];
x=[1 4 5 7];
fx = [2 9 8 8 2];
fx=[5,11,1,35];
n = length(x);

ddtbl = zeros(n,n+1);
ddtbl(:,1) = x';
ddtbl(:,2) = fx';
for j=3:n+1
    for i=1:n-j+2
//        disp('i='+string(i)+' j='+string(j))
        ddtbl(i,j) = (ddtbl(i+1,j-1)-ddtbl(i,j-1))/(x(i+j-2)-x(i));
    end
end

disp(ddtbl)
