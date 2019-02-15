%% Problem 3
% plots the flag of Germany using rectangle and patch

clear; clc; close all;

rectangle('Position',[0 0 7 3])

% specifies verticies of rectangle
b1 = [0 0; 7 0; 7 3; 0 3];
% specifies how to connect verticies of rectangle
b2 = [1 2 3 4];
% patches together faces with verticies and specifies
% color of rectangle
patch('Faces',b2,'Vertices',b1,'FaceColor','black')

r1 = [0 0; 7 0; 7 2; 0 2];
r2 = [1 2 3 4];
patch('Faces',r2,'Vertices',r1,'FaceColor','red')

y1 = [0 0; 7 0; 7 1; 0 1];
y2 = [1 2 3 4];
patch('Faces',y2,'Vertices',y1,'FaceColor','yellow')

axis off;
title('Flag of Germany');



