clear; clc; xdel(winsid()); // clear the console, close windows

// Scilab introduction
// Author: Chad Vidden,  Date: 1/29/14
//
// Instructions:
// Create a script which computes the first n Fibonacci 
// numbers [F(n)=F(n-1)+F(n-2) with first two values 1].
// Your script must ask the for user input for parameter n
// and display the first n numbers on a single line.
// Make sure to check that the user inputs a value that 
// sense for n.


// get user input
disp("This script computes the first n Fibonacci numbers!")
n = input(" Please enter a value for n: ")

// check if input is valid
if (modulo(n,1)==0)&(n>0) then
    F(1)=1; F(2)=1; // two initial values
    for i=3:n
        F(i)=F(i-1)+F(i-2); // remaining Fib numbers
    end
    disp(F') // print them!
else
    disp("You are crazy, n must be a positive integer!")
end
