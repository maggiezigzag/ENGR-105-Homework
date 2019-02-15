%% Problem 4

clear; clc; close all;

%% i)
% Integrating log(log(x1)) and plotting both real and
% imaginary components over -10 to 10.
x1 = -10:.01:10;
fun = log10(log10(x1));
%fun_real = real(fun);
fun_imag = imag(fun);
plotyy(x1,fun,x1,fun_imag);

yyaxis left;
legend('real values','imaginary values');
ylabel('Y-axis');
xlabel('X-axis');
title('Plot of log(log(x)) from -10 to 10');

%% ii)
% Symbolic integration of log(log(x)).
syms x
fun = log10(log10(x));
int1 = int(fun,x)

%% iii)
% Taylor expansion of log(log(x)) about point 3 and
% order 10.
syms x
fun = log10(log10(x));

T = taylor(fun, 'ExpansionPoint', 3, 'Order', 10)

% Integral using int() of T from 2.5 to 3.5.
int_T = int(T,x);
ans_T = double(subs(int_T,{x},{2.5 3.5}));
ans_int_T = ans_T(2)-ans_T(1)

% Integral using integral() of T from 2.5 to 3.5.
anon_T = matlabFunction(T);
ans_integral_T = integral(anon_T,2.5,3.5)

% The integrals from int() and integral() are the same.
% Both give -.3249 for the test values.

%% iv)
syms x
fun = log10(log10(x));
anon_fun = @(x)log10(log10(x));

T2 = taylor(fun, 'ExpansionPoint', 3, 'Order', 10)

% Integral using int() of T2 from 1.5 to 4.5. 
int_T = int(T2,x);
ans_T = double(subs(int_T,{x},{1.5 4.5}));
ans_int_T = ans_T(2)-ans_T(1)

% Integral using integral() of T2 from 1.5 to 4.5.
ans_integral_fun = integral(anon_fun,1.5,4.5)

% The integral using int() of T2 is about the same 
% value of the integral using integral() of T2. The
% integral found using int() (-1.0844) was slightly smaller than
% the integral found using integral() (-1.0856).
