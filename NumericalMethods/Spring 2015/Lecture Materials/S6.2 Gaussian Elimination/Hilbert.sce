clc; clear; 

n=10;

for i=1:n
    for j=1:n
        H(i,j)=1/(i+j-1);// Hilbert matrix
    end
end

//disp(H)
//disp(H*inv(H))
disp(cond(H))
//disp(det(H))
disp(spec(H))
x=spec(H)
disp(x($)/x(1))
