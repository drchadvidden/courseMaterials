clear; clc; xdel(winsid()); format('v',20)

// Section 1.3/1.4 Machine Numbers and Error
// Author: Chad Vidden,  Date: 1/16/14
//
// This script demonstrates loss of significance 
// resulting from accumulated LOS and error 
// propagation.


// Accumulated LOS example:
// Add lots of small numbers to a very large one
disp("Add smalls to x:")
x = 10^17;
disp(x)
for n=1:10^4
    x = x + 1;
end
disp(x)

// Add small numbers first
disp("Add smalls first then to x:")
x = 10^17;
disp(x)
smalls = 0;
for n=1:10^4
    smalls = smalls + 1;
end
x = x + smalls;
disp(x)



// Error propagation example:
// Integration by parts says f(n) = \int_0^1 x^n e^x dx
// satisfies f(n)=e-n f(n-1), f(0)=e-1.
f = %e-1; // issue with machine appx of e
for n=1:20
    f = %e-n*f; // amplified with each iteration
end

//disp(f) // should be positive

err = %eps/2;
for n=1:20
    err = err+n*err; // something like thisish
end

//disp(err) // accumulated error
