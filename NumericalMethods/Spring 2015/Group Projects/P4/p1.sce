clc; clear; xdel(winsid()); format('v',20);

// p1

function z=f(t,y) 
    z = [-0.2*y(2) , 0.8*y(1)];
//    z = [-0.2*y(2) , 0.8*y(1)-0.1*y(2)];
endfunction


a=0; b=60
y0=[2, 0];

n=10000; h=(b-a)/n;
t=a:h:b;

w(1,:)=y0;
for i=1:n // eulers method
    w(i+1,:) = w(i,:)+h*f(t(i),w(i,:));
end

// plot all that schnaziness
tplot=linspace(0,1,10000)
subplot(131)
plot(t,w(:,1),'g',t,w(:,2),'r'); 
xtitle("Eulers Method Approximation", ...
    "x-axis", "y-axis");
legend(['Romeo', 'Juliet'],2); 
a=gca(); 
a.children.children.thickness = 3;
subplot(132)
plot(w(:,1),w(:,2),'b'); 
a=gca(); 
a.children.children.thickness = 3;
subplot(133)
plot3d3(w(:,1),w(:,2),t'); 
plot3d3(zeros(n+1,1),zeros(n+1,1),t');
