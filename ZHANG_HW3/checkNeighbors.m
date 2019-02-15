function count = checkNeighbors(initialState,jj,kk)
% checkNeighbors(initialState,jj,kk) takes the initial
% state of the matrix and the scalar values of the row 
% and column of the index under consideration and
% returns the scalar number of neighbors that are alive 
% excluding the index consideration.

% numRow stores the length of the 1st dimension of the 
% initial state (number of rows)
numRow=size(initialState,1);
% numCol stores the length of the 2nd dimension of the 
% initial state (number of columns)
numCol=size(initialState,2);
% set counter 
count=0;

% checks if value to the right of the value in question
% is alive. If it is, the counter is incremented.
if jj+1<=numRow
    if initialState(jj+1,kk)==1
        count=count+1;
    end
end

% checks if value to the left of the value in question 
% is alive. If so, the counter is incremented.
if jj-1>=1
    if initialState(jj-1,kk)==1
        count=count+1;
    end
end

% checks if value above value in question is alive. If
% so, counter is incremented.
if kk+1<=numCol
    if initialState(jj,kk+1)==1
        count=count+1;
    end
end

% checks if value below value in question is alive. If
% so, counter is incremented.
if kk-1>=1
    if initialState(jj,kk-1)==1
        count=count+1;
    end
end

% returns total number of live neighbors
disp(count)
end