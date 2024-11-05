% YODA      Load low or high resolution model of Yoda character. 
%           and rotate model about x, y, or z axis. 
%
% Code created by Tim Chartier - June 2006
% Models created by Kecskemeti B. Zoltan.  
% Images courtesy of Lucasfilm LTD.

%load yodapose_low
load yodapose    % uncomment to use higher resolution model of Yoda

theta = -7*pi/24;
R_y = [cos(theta) 0 -sin(theta); 0 1 0; sin(theta) 0 cos(theta)];
Vr = V*R_y;
clf
patch('Vertices',Vr,'Faces',F3,'FaceColor',[.76 .87 .78]);
patch('Vertices',Vr,'Faces',F4,'FaceColor',[.76 .87 .78]);
axis off; axis tight; axis equal; axis vis3d

%break   % Comment out this line for animated rotation

pause(.02);

slides = 24;

alpha = pi/slides;

% Create the rotation matrices
R_y = [cos(alpha) 0 -sin(alpha); 0 1 0 ; sin(alpha) 0 cos(alpha)];

for i=1:2*slides
    Vr = Vr*R_y;
    cla
    patch('Vertices',Vr,'Faces',F3,'FaceColor',[.76 .87 .78]);
    patch('Vertices',Vr,'Faces',F4,'FaceColor',[.76 .87 .78]);
    axis off
    axis equal
    axis vis3d
    axis tight
    pause(.001)
end