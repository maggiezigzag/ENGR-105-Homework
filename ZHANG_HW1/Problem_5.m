%% Problem 5

%% Matrix method

% array a stores coefficients and array b stores constants of the
% equations
a = [-23 -18 2 -19 -15; -1 -16 10 1 3; ...
    -15 -23 1 8 7; -19 7 2 19 -4; -15 -11 -3 -11 -15];
b = [22; -21; -20; -18; -17];

% dividing array b by a
Y = a\b;

% rounds solutions to three sig figs
xSol1 = round(Y, 2)

%% Linsolve method

% list symbols and equations 
syms v w x y z
eqn1 = -23*v - 18*w + 2*x - 19*y - 15*z == 22;
eqn2 = -v - 16*w + 10*x + y + 3*z == -21;
eqn3 = -15*v - 23*w + x + 8*y + 7*z == -20;
eqn4 = -19*v + 7*w + 2*x + 19*y - 4*z == -18;
eqn5 = -15*v - 11*w - 3*x - 11*y - 15*z == -17;

% equationsToMatrix converts linear equations to matrix
% notation
[A,B] = equationsToMatrix([eqn1, eqn2, eqn3, eqn4, eqn5], [v,w,x,y,z]);

% linsolve solves the linear system 
% double() converts symbols into decimals
Y = double(linsolve(A,B));

% rounds solutions to three sig figs
xSol2 = round(Y, 2)

%% Solve method

% list symbols and equations
syms v w x y z
eqn1 = -23*v - 18*w + 2*x - 19*y - 15*z == 22;
eqn2 = -v - 16*w + 10*x + y + 3*z == -21;
eqn3 = -15*v - 23*w + x + 8*y + 7*z == -20;
eqn4 = -19*v + 7*w + 2*x + 19*y - 4*z == -18;
eqn5 = -15*v - 11*w - 3*x - 11*y - 15*z == -17;

% solve solves equations symbollically
sol = solve([eqn1, eqn2, eqn3, eqn4, eqn5], [v, w, x, y, z]);

% double() converts symbols into decimals
v = double(sol.v);
w = double(sol.w);
x = double(sol.x);
y = double(sol.y);
z = double(sol.z);

% formats variables into column array
Y = [v; w; x; y; z];

% rounds solutions to three sig figs
xSol3 = round(Y, 2)




