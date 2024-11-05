clear; clc; format('v',20);

dat = read_csv('C:\Users\cvidden\Documents\UWLAX\Teaching\MTH 371\Spring 2015\Group Projects\P2\dataf.csv', 'rt');

teamdat = mopen('C:\Users\cvidden\Documents\UWLAX\Teaching\MTH 371\Spring 2015\Group Projects\P2\teams.csv', 'rt');
// format, winning team, losing team, winner score, loser score
games=evstr(dat)
team=mgetl(teamdat)

nt=max(games(:,1:2));

[ng,gc] = size(games);
        
M = zeros(nt,nt)
for i=1:nt-1 // set diagonal of M
    M(i,i)=length(find(games(:,1:2)==i));
end

for i=1:ng // set off diagonal of M
    temp = games(i,1:2);
    temp = gsort(temp);
    M(temp(1),temp(2))=M(temp(1),temp(2))-1;
end

M=M+tril(M,-1)'; // finish constructing M by symmetry
M($,:)=ones(1,nt); // last row all zeros

// add up point differentials
p=zeros(nt,1);
for j=1:ng
    temp = games(j,:);
    p(temp(1))=p(temp(1))+temp(3)-temp(4);
    p(temp(2))=p(temp(2))-(temp(3)-temp(4));
end
p($)=0;

r=M\p;

[sr,k]=gsort(r);
dt=80;
disp([string([1:dt]'),string(sr(1:dt)),team(k(1:dt))])
