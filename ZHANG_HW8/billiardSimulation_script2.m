load('testCases.mat')
j = 1;
walls = testCases(j).walls;
ballState = testCases(j).ballState;
dt = .1;
cr = .8;
tf = 100;
visState = true;

billiardSimulation2(walls,ballState,dt,cr,tf,visState);
