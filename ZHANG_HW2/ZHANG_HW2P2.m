clear, clc, close all;

% Homework 2 Problem 2 by Maggie Zhang
% ENGR 105

%% Problem 2

function nums = lucas(N)
% LUCAS(N) returns a list of the first N+1 Lucas series numbers.
% N is anticipated to be an integer >= 0.

nums = [];
lucas(0) = 2;
lucas(1) = 1;

    for i = 1:N
        lucas(i) = lucas(i-1) + lucas(i-2);
        nums = lucas(n);
    end
end
    
