% Homework 2 Problem 5
% ENGR 105

function dNum = descrambler(sNum)
% Returns a 10-digit phone number after performing
% multiple changes to a given string of numbers.

% Deletes every 4th index starting with the first index 
sNum(1:4:end) = [];    

% Stores last integer in the number for future use
y = sNum(end);

% Swaps even and odd indices using the reshape method,
% which splits the even indices and odd indices of an
% array into a column vector of two rows and then
% reshapes it into an array of dimension 1. The -1 at
% the end of the second row was added due to a mismatch
% in index.
sNum = sNum(reshape([2:2:end;1:2:end-1],1,[]));

% Just in case the resultant array has an odd number of
% indices after reshape() neglects the last index, this
% if statement reappends the "lost" number to the end of
% sNum
if rem(length(sNum),2) == 1
    sNum(end+1) = y;
else
    sNum = sNum;
   
% Takes the last 6 indices and places them at the front 
% of the vector using the circshift method.
sNum = circshift(sNum,6);

% Subtracts 1 from every even index and ensures that the
% resultant integer is positive.
sNum(2:2:end) = abs(sNum(2:2:end) - 1);

% Removes an equal number of indices from the left and
% right hand side of the vector to yield the 10 digit 
% phone number
while length(sNum) > 10
    sNum(1) = [];
    % if sNum is now a ten-digit number, then stop.
    if length(sNum) == 10
        sNum = sNum;
        break;
    % else, keep removing.
    else
        sNum(end) = [];
    end
    sNum = sNum;
end

disp(sNum)
end
