%% Problem 3

clear; clc; close all;

%% i)
figure()
ezplot('sin(x)+(cos(x.^2-pi/7)).^2',[-5*pi 5*pi]);
xlabel('x');
ylabel('y');

%% ii) 

% Iterating through slices and finding integral value.
integral_value = [];
for i = 5:500
     x = linspace(-5*pi,5*pi,i);
     fun1 = sin(x)+(cos(x.^2-pi/7)).^2;
     integral_value(end+1) = trapz(fun1,x);
end
 
figure()
plot(5:500,integral_value);
xlabel('Number of slices');
ylabel('Integral value');
title('Integral value as a function of number of slices');

% By visual inspection, you need about 350 slices
% before the trapezoidal approximation converges to
% quadrature-based solution.

%trap_val = trapz(fun1,-5*pi:5*pi);

%% iii)
% Integrating with numerical integration.
fun2 = @(x)sin(x)+(cos(x.^2-pi/7)).^2;
integral(fun2,-5*pi,5*pi)