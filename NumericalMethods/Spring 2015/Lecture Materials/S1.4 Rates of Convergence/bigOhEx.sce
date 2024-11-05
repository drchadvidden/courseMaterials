clear; clc; xdel(winsid()); format('v',10)

// Section 1.4 Rates of Convergence
// Author: Chad Vidden,  Date: 2/5/14
//
// This script examines the rates of convergence
// of sequences {x(n)}={n/(n^2+1)} and {y(n)}={(n+1)/n^3}.

n = 1:10; // iterates to consider

// sequences and compute rates of convergence
x = n ./(n.^2+1);
xoh = 1 ./n;
y = (n+1) ./n.^3;
yoh = 1 ./n.^2;

// print sequences
disp("   x            1/n          y            1/n^2");
disp([x' xoh' y' yoh']);

// examinie the loglog plots
//plot2d("ll",n',[x' xoh' y' yoh'])
//xtitle("loglog plot of sequence convergence", ...
//    "n-axis", "y-axis");
//legend(['x' '1/n' 'y' '1/n^2']);
//set(gca(),"grid",[1 1])
//a=gca(); // make lines thicker
//a.children.children.thickness = 3;
