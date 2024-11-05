clc; clear;

// Section 6.2 Gaussian Elimination
// Author: Chad Vidden,  Date: 2/21/14
//
// This script executes the first step of basic
// Gaussian elimination for the system Ax=b

A = [1 2 3; 4 5 6; 7 8 0];
b=[1 0 2]';
n = 3;

for i = 2:n // loop over rows
    mult = A(i,1)/A(1,1); // multiple needed for elim
    A(i,:) = A(i,:)-mult*A(1,:); // do elimination for A
    b(i) = b(i)-mult*b(1); // do elimination for b
end

disp([A b]) // print result
