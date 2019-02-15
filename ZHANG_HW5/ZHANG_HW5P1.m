%% Problem 1
% plots a 3D curve described by x, y, and z over domain
% 0 <= t <= 20.
clear; clc; close all;

t = 0:.001:20;
x = cos(t);
y = sin(t);
z = t;

figure;
plot3(x,y,z);
set(gca,'FontSize', 15);
grid on;

% specify tick increments
xticks([-1 0 1]);
zticks([0 10 20]);

% specify label location
xlabel('x = cos(t)');
ylabel('y = sin(t)');
zlabel('z = t');
set(get(gca,'xlabel'),'rotation',16);
set(get(gca,'ylabel'),'rotation',-22);

% specify color and line width
cla;
patch([x nan],[y nan],[z nan],[z nan],'EdgeColor',...
    'interp','FaceColor','none','LineWidth',4);

