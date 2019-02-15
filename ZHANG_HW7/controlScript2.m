%loading preset data
load('particlePositions')


%setting the fixed particles to mobile particles
xM=[xM,xF];
xF=[];
yM=[yM,yF];
yF=[];
%setting constants
tolSS=5e-5;
dt=0.001;
m=0.001;
ep=10;
sigma=2;
%calling visualizeparticles with the input data
visualizeParticles(xM,yM,xF,yF,tolSS,dt,m,ep,sigma)