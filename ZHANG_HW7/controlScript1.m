%loading preset data
load('particlePositions')

% input data
tolSS=5*10^-5;
dt=0.001;
m=0.001;
ep=10;
sigma=2;
%calling the visualizeParticles function using the
%input data
visualizeParticles(xM,yM,xF,yF,tolSS,dt,m,ep,sigma)