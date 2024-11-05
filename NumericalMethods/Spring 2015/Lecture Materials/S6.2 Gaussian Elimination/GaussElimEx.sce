clc; clear;

// Section 6.2 Gaussian Elimination
// Author: Chad Vidden,  Date: 2/21/14
//
// This script executes the basic version of
// Gaussian elimination for the system Ax=b


//A = [1 2 3; 4 5 6; 7 8 0];
A = [6 -2 2 4; 12 -8 6 10; 3 -13 9 3; -6 4 1 -18];
//A = [1 2 -4 3; 2 5 -6 10; -2 -7 3 -21; 2 8 -5 38];
//b=[1 0 2]';
b = [16 26 -19 -34]';
//b = [0 9 -28 42]';

disp(A\b)
Aold=A;

n = length(b);

for j=1:n-1 // loop over columns
    for i = j+1:n // loop over rows
        
        mult = A(i,j)/A(j,j); // multiple needed for elim
        A(i,:) = A(i,:)-mult*A(j,:); // do elimination for A
//        A(i,j+1:n) = A(i,j+1:n)-mult*A(j,j+1:n); // more efficient
        b(i) = b(i)-mult*b(j);   // do elimination for b  
        disp("Mult "+string(mult))
    end
    disp("Step "+string(j)) // print at each step
    disp([A b])
end

for k=n:-1:1
    temp = 0;
    for j=k+1:n
        temp = temp + A(k,j)*x(j); 
    end
    x(k) = (b(k)-temp)/A(k,k);
end

disp(x)
disp(Aold*x)

