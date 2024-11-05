clc; clear; xdel(winsid()); format('v',20);

// problem 2

exec('C:\Users\cvidden\Documents\UWLAX\Teaching\MTH 371\Spring 2013\Homework\Group Projects\P3\GaussianQuad.sci', -1)

function y=f(x)
    y=x.^{-1/2};
endfunction

function y=g(x)
    y=sin(x)./x;
endfunction

af=0; bf=1; 
ag=0; bg=1; 
n=1:4;
yfexact=2;
ygexact=0.9460830703671830149413533138231796578123379547381117904714547735666870365407979180887021330817407112;

for i=1:length(n)
    yf(i)=GaussianQuad(f,af,bf,n(i))
    yg(i)=GaussianQuad(g,ag,bg,n(i))
end

disp('int_0^1 x^{-1/2} dx,             error')
disp([yf,abs(yfexact-yf)])
disp('exact')
disp(yfexact)
disp('int_0^1 sin(x)/x dx,             error')
disp([yg,abs(ygexact-yg)])
disp('exact')
disp(ygexact)

