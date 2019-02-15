load('testCases.mat')
j = 3;
walls = testCases(j).walls;
ballState = testCases(j).ballState;
dt = testCases(j).dt;
cr = testCases(j).cr;
tf = testCases(j).tf;
visState = true;

billiardSimulation_1(walls,ballState,dt,cr,tf,visState);
