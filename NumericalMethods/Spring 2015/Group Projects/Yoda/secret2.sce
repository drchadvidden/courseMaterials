clear; clc; format('v',20); xdel(winsid());

loadmatfile('C:\Users\cvidden\Documents\UWLAX\Teaching\MTH 371\Spring 2015\Group Projects\Yoda\secret.mat')

sangle = -%pi;
eangle = 0;
//starting and ending angles
slides = 10;//frame of the animation
tpf = 0.5; //pause time per frame (seconds)
rts = (eangle-sangle)/(slides-1);//rotation angle per slide
//patch data
[m,n] = size(F4);
X = zeros(4,m,slides);
Y = X;
Z = X;
for time = 1:slides
    rt = sangle + (time-1)*rts;
    R_y = [cos(rt) 0 -sin(rt); 0 1 0; sin(rt) 0 cos(rt)];
    Vr = V*R_y;
    xf = zeros(4,m);
    yf = xf;
    zf = xf;
    for i = 1 : m
        index = F4(i,:);
        coordinate = [Vr(index(1),:);Vr(index(2),:);Vr(index(3),:);Vr(index(4),:)];
        yf(:,i) = coordinate(:,1);
        zf(:,i) = coordinate(:,2);
        xf(:,i) = coordinate(:,3);
    end
    X(:,:,time) = xf;
    Y(:,:,time) = yf;
    Z(:,:,time) = zf;
end
//Draw initial figure
tcolor = 2*ones(m,1);
figure(1);
plot3d(X(:,:,1),Y(:,:,1),list(Z(:,:,1),tcolor),theta=0,alpha=90,flag = [2,6,0]);
frame = gce();
a = get('current_axes');
temp = a.title;
temp.text = "May the Numerical Analysis be with you...";
temp.font_style = 5;
temp.font_size = 5;
a.x_label.visible = 'off'
a.y_label.visible = 'off'
a.z_label.visible = 'off'
//loop animation
for k = 1:slides
    drawlater();
    xpause(tpf*10^6);//frame pause (10e-6 second)
    frame.data.x = X(:,:,k);
    frame.data.y = Y(:,:,k);
    frame.data.z = Z(:,:,k);
    xpause(1);
    drawnow();
end
