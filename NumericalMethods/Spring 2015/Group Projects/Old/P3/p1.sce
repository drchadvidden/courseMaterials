clc; clear; xdel(winsid()); format('v',20);

// problem 1, given the legendre polynomial zeros, compute
// the gaussian quadrature coefficients A_i's via the
// method of undetermined coefficients

function y=f(x,p)
    y=x.^p
endfunction

// gaussian nodes
xi = [-sqrt(1/3),sqrt(1/3),0,0,0; ...
    -sqrt(3/5),0,sqrt(3/5),0,0; ...
    -sqrt((3+4*sqrt(0.3))/7),-sqrt((3-4*sqrt(0.3))/7), ...
    sqrt((3-4*sqrt(0.3))/7),sqrt((3+4*sqrt(0.3))/7),0; ...
    -sqrt((5+2*sqrt(10/7))/9),-sqrt((5-2*sqrt(10/7))/9),0, ...
    sqrt((5-2*sqrt(10/7))/9),sqrt((5+2*sqrt(10/7))/9)];

// integrals of x^p oer [-1,1], p=0,1,2,3,4
intxp = [2, 0, 2/3, 0, 2/5];

// solve system M*A=b, force exactness for all needed polys
Aall=zeros(4,4);
for k=2:5
    M=[];
    for p=1:k
        for q=1:k
            M(p,q)=f(xi(k-1,q),p-1);
        end
    end
    b=intxp(1:k)';
    A=M\b;
    Aall(k-1,1:k)=A';
end

disp(Aall)

