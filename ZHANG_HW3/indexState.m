function[outputState]=indexState(inputState,numberAlive)
% indexState(inputState,numberAlive) takes the scalar 
% value of the index of initialState under
% consideration and the scalar value of the number of
% its live neighbors and returns the outputState based
% on the Game of Life rule set.

% sets inputState equal to outputState to test the
% following conditions:
outputState=inputState;

% any live index with more than three live neighbors
% lives on to the next generation. If the inputState is
% initially 0, and the index in question has three live
% neighbors, their outputState is 1.
if inputState==0
    if numberAlive==3
        outputState=1;
    end
end

% if the index in question is already alive, and if the
% number of neighbors surrounding the index is greater
% than three, then the live index dies due to
% overpopulation and the outputState is set to 0.
if inputState==1
    if numberAlive>3
        outputState=0;
        % if the index in question has two or three
        % neighbors, then it lives on to the next
        % generation and the outputState is set to 1.
    elseif numberAlive>=2
        outputState=1;
        % in all other cases, the live index dies.
    else
        outputState=0;
    end
end



end