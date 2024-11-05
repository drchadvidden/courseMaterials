clear; clc; xdel(winsid()); format('v',10)

// Section 1.3/1.4 Machine Numbers and Error
// Author: Chad Vidden,  Date: 1/16/14
//
// This script demonstrates loss of significance 
// resulting from subtraction of near equals 
// within the quadratic equation.


// solutions to x^2 + 62.10x + 1 = 0
a = 1;
b = 62.10;
c = 1;

// roots using quadratic formula
x1 = (-b+sqrt(b^2-4*a*c))/(2*a); // issue here
x2 = (-b-sqrt(b^2-4*a*c))/(2*a);

// roots using modified quadratic formula
x1m = -2*c/(b+sqrt(b^2-4*a*c));
x2m = -2*c/(b-sqrt(b^2-4*a*c)); // issue here

// true solution to lots of digits
x1true = -0.0161072374089685809482;
x2true = -62.083892762591031419051;

// compare significant digits of accuracy
disp("x1 vs true: " + ...
        string(assert_computedigits(x1,x1true)))
disp("x1 vs true: " + ...
        string(assert_computedigits(x1m,x1true)))
disp("x1 vs true: " + ...
        string(assert_computedigits(x2,x2true)))
disp("x1 vs true: " + ...
        string(assert_computedigits(x2m,x2true)))

// issue, subtraction of near equals, b ~ sqrt(b^2-4*a*c)
disp("issue: " + string(b) + ...
        " is close to " + string((sqrt(b^2-4*a*c))))
disp("b vs sqrt(b^2-4*a*c): " + ...
        string(assert_computedigits(b,sqrt(b^2-4*a*c))))
