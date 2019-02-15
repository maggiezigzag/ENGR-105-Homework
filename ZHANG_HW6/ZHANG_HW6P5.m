%% Problem 5

clear; clc; close all; 

% Initializing figure and axes qualities 
figure
hold on;
R = 2;
r = 1;
theta  = linspace(0,2.*pi,64);
phi    = linspace(0,2.*pi,64); 
[PHI, THETA] = meshgrid(phi, theta);
x = (R+r.*cos(THETA)).*cos(PHI);
y = (R+r.*cos(THETA)).*sin(PHI);
z = r.*sin(THETA);

torus = surfl(x,y,z);
shading flat
alpha(.5)
view([-37.5 45])
grid off
axis equal
box on
set(gca,'xtick',[],'ytick',[],'ztick',[],'BoxStyle','full')

% N is number of iterations, points
N = 5000;
counter_inside = 0;
counter_outside = 0;

point = plot3(NaN,NaN,NaN,'.','LineWidth',0.01,'MarkerEdgeColor','k');

for i = 1:N
    x = range([-3 3])*rand-3;
    y = range([-3 3])*rand-3;
    z = range([-1 1])*rand-1; 
    % Testing to see if point is inside the torus
    d = sqrt(x^2+y^2);
        if (d <= R+r) && (d >= R-r) && ((R-d)^2 + z^2 <= r^2)
            % If the point is inside, then increment
            % the counter by 1
            counter_inside = counter_inside+1;
            
            % Draws point inside the torus
            
            point.XData(end+1) = x;
            point.YData(end+1) = y;
            point.ZData(end+1) = z;
           
            grid off
            pause(0.00001)
            %drawnow limitrate
            % Reports volume with every new point
            v_temp = num2str(round((counter_inside/(counter_outside+counter_inside))*72,1));
            title(['Vol = ',v_temp]);
            
            % Rotates torus and box about origin 
            camorbit(.01,0)
            axis vis3d
        else
            % All other points outside the torus
            counter_outside = counter_outside+1;
        end
end
% Find volume of torus by dividing points on inside of 
% torus by total points and multiplying by the volume
% of the box.
volume = (counter_inside/(counter_outside+counter_inside))*72;
