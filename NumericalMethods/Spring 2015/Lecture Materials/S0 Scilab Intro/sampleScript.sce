clc; xdel(winsid()); //clear; // clear the console, close windows

// Scilab introduction
// Author: Chad Vidden,  Date: 1/28/15
//
// Sample script for scilab
// Note: .sci files contain contain both Scilab 
// functions and executable statements. Press F5 
// key to execute to console.


// create another function
function y = anotherFunc(x)
    y = x.^3;
endfunction


// do some calculations
x = 3;
y = myFunc(x)+anotherFunc(x); // sample function calls
disp(y) // display y value to console


// do some more calculations from user input
//x = input("What x-value do you want?") // ask user for input
//if x>2 then // make sure x is bigger than 2
//    y = myFunc(x)+anotherFunc(x); // sample function calls
//    disp(y) // display y value to console
//else
//    disp("Values must be bigger than 2 for some reason.")
//end


// do some looping
xvals = [1 2 3 4 5]; 
yvals = zeros(1,length(x));
for i=1:length(xvals)
    yvals(i) = myFunc(xvals(i))+anotherFunc(xvals(i));
end
//disp(yvals)


// do some graphing
xvals = linspace(-2,2,100); // array of 100 values from -2 to 2
yvals = myFunc(xvals)+anotherFunc(xvals);
//plot(xvals,yvals) 
//xgrid() // turn on the grid
//xtitle("Title", "x-axis", "y-axis") // label title and axis
//legend("y=x^2+x^3") // display legend


// some fancier graphing, two graphs in one window
xvals = linspace(-2,2,100); // array of 100 values from -2 to 2
yvals = myFunc(xvals);
zvals = anotherFunc(xvals)
subplot(121)
plot(xvals,yvals) 
legend("y=x^2") // display legend
subplot(122)
plot(xvals,zvals) 
legend("y=x^3") // display legend
