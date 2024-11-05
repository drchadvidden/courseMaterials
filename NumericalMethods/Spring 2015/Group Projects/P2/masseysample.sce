clear; clc; format('v',20);

teams = ['Duke','Miami','UNC','UVA','VT']';
nt=length(length(teams));
// format, winning team, losing team, winner score, loser score
games = [2, 1, 52, 7; ...
            3, 1, 24, 21; ...
            4, 1, 38, 7; ...
            5, 1, 45, 0; ...
            2, 3, 34, 16; ...
            2, 4, 25, 17; ...
            2, 5, 27, 7; ...
            3, 4, 7, 5; ...
            5, 3, 30, 3; ...
            5, 4, 52, 14];
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

//disp(M)
//disp(p)
r=M\p;
//disp(r)

[sr,k]=gsort(r);
disp([string([1:nt]'),string(sr(1:nt)),teams(k(1:nt))])
