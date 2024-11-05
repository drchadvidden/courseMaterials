function y=threenplus1(n)

y(1)=n;
k=1;

while y(k)~=1
    if modulo(y(k),2)~=0
        y(k+1)=3*y(k)+1;
    else
        y(k+1)=y(k)/2;
    end
    k=k+1;
end

endfunction
