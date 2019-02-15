% Homework 2 Problem 3
% ENGR 105

function [outSum, computeTime2] = vectSum(N)

tic
k = 1:N;
x = k.^3;
outSum = sum(x);
computeTime2 = toc;

end
