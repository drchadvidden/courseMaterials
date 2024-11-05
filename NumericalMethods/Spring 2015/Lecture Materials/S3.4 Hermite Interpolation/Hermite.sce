// HERMITE INTERPOLANT //////////////////////////////////////

xn = linspace(-5,5,13); // interpolation nodes
fn = f(xn); // function values (defined scilab function)
fpn = fp(xn); // function derivative values (scilab function)
h = 10/(length(xn)-1); // subinterval length
s=poly(0,"s"); // polynomial variable

for i=1:length(xn)-1
    // hermite interpolant, scilab polynomial on each subint
    alpha = (3/h^2)*(fpn(i)+fpn(i+1))+(6/h^3)*(fn(i)-fn(i+1));
    P(i) = (-fpn(i)/h)*((s-xn(i+1))^2/2 - h^2/2) ...
                 + (fpn(i+1)/h)*((s-xn(i))^2/2) ...
                 +alpha*(s-xn(i))^2*((s-xn(i))/3-h/2)+fn(i);
end
