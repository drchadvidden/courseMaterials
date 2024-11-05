clear; clc; format('v',20); xdel(winsid());

loadmatfile('C:\Users\cvidden\Documents\UWLAX\Teaching\MTH 371\Spring 2015\Group Projects\Yoda\secret.mat')

rt = -7*%pi/24;
//rt is the rotation angle
R_y = [cos(rt) 0 -sin(rt); 0 1 0; sin(rt) 0 cos(rt)];
Vr = V*R_y;
[m,n] = size(F4);
//m is the number of faces
xf = zeros(4,m);
yf = xf;
zf = xf;
//xf, yf, zf are 4 by m matrices.Each column will store the x,y,z coordinates of the face
for i = 1 : m
    index = F4(i,:);
    coordinate = [Vr(index(1),:);Vr(index(2),:);Vr(index(3),:);Vr(index(4),:)];
    yf(:,i) = coordinate(:,1);
    zf(:,i) = coordinate(:,2);
    xf(:,i) = coordinate(:,3);
end
tcolor = 2*ones(m,1);
plot3d(xf,yf,list(zf,tcolor),theta=0,alpha=90,flag = [2,6,0]);
frame = gce();
a = get('current_axes');
temp = a.title;
temp.text = "May the Numerical Analysis be with you...";
temp.font_style = 5;
temp.font_size = 5;
a.x_label.visible = 'off'
a.y_label.visible = 'off'
a.z_label.visible = 'off'
