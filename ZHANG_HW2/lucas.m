% Homework 2 Problem 2
% ENGR 105

%% Problem 2

function nums = lucas(N)
% LUCAS(N) returns a list of the first N+1 Lucas series numbers.
% N is anticipated to be an integer >= 0.

a = 2;
b = 1;
nums = [2,1];

    for n = 3:N
        c = a+b;
        lucas(n) = c;
        if n > 1
            nums(end+1) = c;
        end
        a = b;
        b = c;
    end
end
    
