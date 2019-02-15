%% Problem 2

clear; clc; close all;

% Initializing variables used in symbolic
% integration

syms x n y z

%% 1)
% f(x) = x^2-5x
fun1 = x.^2-5*x;
% Taking indefinite integral with respect to x
int1 = int(fun1,x)
% Substuting test value into x to yield numerical
% answer
ans1 = double(subs(int1,x,1))

%% 2)
fun2 = x.^(2-n)-5*x;
int2 = int(fun2,x)
ans2 = double(subs(int2,{x n},{1 4}))

%% 3)
fun3 = x.^(2-n)-5*x;
int3 = int(fun3,y)
ans3 = double(subs(int3,{x y n},{1 2 4}))

%% 4)
fun4 = exp(2*x).*sin(x)-cos(x);
int4 = int(fun4)
ans4 = double(subs(int4,x,1))

%% 5)
fun5 = sin(x)./x;
int5 = int(fun5)
ans5 = double(subs(int5,x,1))

%% 6)
fun6 = sin(x).*cos(y).*tan(z)+y.*cos(x)+x.*sin(y);
int6 = int(int(int(fun6,x),y),z)
ans6 = double(subs(int6,{x y z},{1 2 3}))