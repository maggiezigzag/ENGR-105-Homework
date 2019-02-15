function finalState = gameOfLife(initialState,N)
% Run the Game of Life on a two dimensional matrix of arbitrary
% size, initialState, for N iterations. Matrix initialState
% should contain values of only 0 (a dead state) or 1 (a live
% state). See the following for a description of the Game of
% Life: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life


% If a figure does not exist (first time code is executed),
% create a visualization of the initialState matrix, i.e. the
% incoming matrix.
if isempty(findall(0,'Type','Figure'))
    imagesc(initialState) % plot the matrix
    axis off  % remove axes and scale equally
    pause(.5) % pause to update the figure/give time to view vis.
end


% Size of the incoming matrix.
[s1,s2] = size(initialState); 


% For each index element of the initialState, check how many
% neighbors are alive and the current state of the index to
% determine if the index should be alive or dead in the next
% state, finalState.
for jj = 1:s1
    for kk = 1:s2
        
        % Check how many neighbors of index (jj,kk) of
        % initialState are alive.
        
        % ***you must create the function checkNeighbors***
        
        % ***substitute checkNeighbors_ex for checkNeighbors to
        % test the known solution***
        numberAlive = checkNeighbors(initialState,jj,kk);
        
        
        % Compare the current state of index (jj,kk) and the
        % number of neighbors of index (jj,kk)  that are alive to
        % determine if index (jj,kk) is alive or dead in the next
        % state, in accordance with the Game of Life rule set.
        
        % ***you must create the function indexState***
        
        % ***substitute indexState_ex for indexState to test the
        % known solution***
        finalState(jj,kk) = ...
            indexState(initialState(jj,kk),numberAlive);
        
        
    end
end


% Update the visualization. This method overwrites the color data
% of the existing visualizaton (best/fastest practice) created
% the first time the function is executed. The gameOfLife relies
% on recursive calls (see the last commands of the code) and the
% identity of the figure is not communicated (via inputs/outputs)
% between recursive function calls. The workaround - the
% following code looks for the only open figure (gcf), finds the
% data inside the figure (aObj and dObj), and then updates the
% visualization with the new finalState matrix information. This
% isn't standard practice.
f = gcf; 
aObj = get(f, 'Children');
dObj = get(aObj, 'Children');
set(dObj,'CData',finalState)
pause(.5)


% Decrement the counter and recursively call gameOfLife if
% additional iterations are required.
N = N-1;
if N>0
    finalState = gameOfLife(finalState,N);
end