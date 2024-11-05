clc; clear; format('v',20)

function y=f(x)
    y=sin(x);
endfunction

function y=df(x)
    y=cos(x);
endfunction

function y=g(x)
    y=(sin(x)).^2;
endfunction

function y=dg(x)
    y=2.*sin(x).*cos(x);
endfunction

x(1)=0.65*%pi;
n=20; i=1;

while abs(x(i)-%pi)>2*%eps
   x(i+1)=x(i)-f(x(i))/df(x(i));
//    x(i+1)=x(i)-g(x(i))/dg(x(i));
    i=i+1;
    if i==50
        break
    end
end

disp(x)
disp(abs(x-%pi*ones(i,1)))

for i=2:length(x)-2
    r(i)=log(abs((x(i+1)-%pi))/abs((x(i)-%pi)))...
            /log(abs((x(i)-%pi))/abs((x(i-1)-%pi)))
end

disp(r)
