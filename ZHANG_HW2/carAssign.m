% Homework 2 Problem 4
% ENGR 105

function carNumber = carAssign(f,i)
% takes inputs f (feet) and i (inches) and converts the
% resultant height into inches.
heightToInches = f*12 + i;
    % carNumber is 1 if height is less than or equal to 60 inches
    if heightToInches <= 60
        carNumber = 1
    % carNumber is 2 if height is greater than 60 inches and
    % less than or equal to 72 inches and 
    elseif heightToInches <= 72 && heightToInches > 60
        carNumber = 2
    % carNumber is 3 if height is greater than 72 inches
    elseif heightToInches > 72
        carNumber = 3
    end
end
    