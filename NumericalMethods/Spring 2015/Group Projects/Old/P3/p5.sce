clc; clear; xdel(winsid()); format('v',16);

// problem 5

exec('C:\Users\cvidden\Documents\UWLAX\Teaching\MTH 371\Spring 2013\Homework\Group Projects\P3\CompGaussianQuad.sci', -1)
 
function y=f(x)
    y=x.^5;
endfunction

function y=g(x)
    y=sin(x)./x;
endfunction

af=0; bf=1; 
ag=0; bg=1; 
nf=2; mf=[1,2,10];
ng=3; mg=1:4;
yfexact=1/6;;
ygexact=0.9460830703671830149413533138231796578123379547381117904714547735666870365407979180887021330817407112;

for i=1:length(mf)
    yf(i)=CompGaussianQuad(f,af,bf,nf,mf(i))
end
for i=1:length(mg)
    yg(i)=CompGaussianQuad(g,ag,bg,ng,mg(i))
end

disp('int_0^1 x^5 dx,             error')
disp([yf,abs(yfexact-yf)])
disp('exact')
disp(yfexact)
disp('int_0^1 sin(x)/x dx,             error')
disp([yg,abs(ygexact-yg)])
disp('exact')
disp(ygexact)


