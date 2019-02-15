function [x,y] = partDynamics(x,y,X,Y,dt,m,ep,sigma)
% partDynamics() takes in information about particles
% and updates position, force, and acceleration for
% function visualizeParticles().

% removing interactions between the same particle.
X(X==x)=[];
Y(Y==y)=[];

% calculating the distance between each particle
xD=X-x;
yD=Y-y;
rD=sqrt(xD.^2+yD.^2);

% calculating interaction force between particles
Fx=(-48.*ep./sigma^2).*((sigma./rD).^14-0.5.*(sigma./rD).^8).*xD;
Fy=(-48.*ep./sigma^2).*((sigma./rD).^14-0.5.*(sigma./rD).^8).*yD;

% calculating acceleration for the sysem of particles
ax=(1/m).*sum(Fx);
ay=(1/m).*sum(Fy);

% calculating position of particles
x=0.5*ax.*dt^2+x;
y=0.5*ay.*dt^2+y;


end