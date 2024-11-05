clc; clear; xdel(winsid()); format('v',20);

// problem 1

xn = [0 %pi/4 %pi/2];
fn = sin(xn);
n = length(xn)-1;
s=poly(0,"s"); // create polynomial variable s
P = 0; // initialize the polynomial

for i=1:n+1 // loop to compute Lagrange interp poly
    L=1;
    for j=[1:i-1,i+1:n+1] 
        L=L*(s-xn(j))/(xn(i)-xn(j)); 
    end
    P=P+L*fn(i); 
end

x = linspace(0,%pi/2,200);
Pvals = horner(P,x); // polynomial evaluation

// plot function and intepolant
subplot(121)
plot(x,sin(x),"b",x,Pvals,"g"); 
xtitle("n = " + string(n) + " Interpolation Polynomial", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['y=sin(x)', 'y=P(x)'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;


// compute and plot error
err = abs(Pvals - sin(x));
subplot(122)
plot(x,err,"r"); // plot error
xtitle("n = " + string(n) + " Error", ...
    "x-axis", "y-axis"); // graph title and axis labels
legend(['Error'],2); // graph legend
a=gca(); // make lines thicker
a.children.children.thickness = 3;

// function evaluations
disp('P(pi/3) = ' + string(horner(P,%pi/3)))
disp(sin(%pi/3))
disp(abs(horner(P,%pi/3)-sin(%pi/3)))
disp('P(pi/6) = ' + string(horner(P,%pi/6)))
disp(sin(%pi/6))
disp(abs(horner(P,%pi/6)-sin(%pi/6)))

// error checking
W = s*(s-%pi/4)*(s-%pi/2);
disp('check for error max and min on [0,pi/2]')
disp('w(0) = ' + string(horner(W,0)))
disp('w(%pi/4-%pi/(4*sqrt(3))) = ' + string(horner(W,%pi/4-%pi/(4*sqrt(3)))))
disp('w(%pi/4+%pi/(4*sqrt(3))) = ' + string(horner(W,%pi/4+%pi/(4*sqrt(3)))))
disp('w(%pi/2) = ' + string(horner(W,%pi/2)))
disp('MAX AT w(%pi/4-%pi/(4*sqrt(3))) = ' + string(horner(W,%pi/4-%pi/(4*sqrt(3)))))
disp('final max error = ' + string(horner(W,%pi/4-%pi/(4*sqrt(3)))/6))
disp('comp max error = ' + string(max(err)))
