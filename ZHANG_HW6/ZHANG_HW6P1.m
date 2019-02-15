%% Problem 1

clear; clc; close all;

% Initializing variables used in symbolic
% differentiation

syms x y z;

%% 1)
% f(x,y) = cos(x)sin(y) + y^3log(x)
fun1 = cos(x).*sin(y)+y.^3.*log(x);
% finding the derivative of fun1 with respect to x
dzdx = diff(fun1,x)
% substituting test values for x and y for
% numerical answer
ans1 = double(subs(dzdx,{x y},{4 5}))

%% 2)
fun2 = [2*(cos(x)).^2,(sin(y)).^3,2*x.^2+y.^2+4*z.^2];
d1 = divergence(fun2)
ans2 = double(subs(d1,{x y z},{4 5 6}))

%% 3)
fun3 = [2*x.^2+cos(y)+tan(z),cos(x)+sin(x),x.^2+y.^2+z.^2];
c1 = curl(fun3)
ans3 = double(subs(c1,{x y z},{4 5 6}))