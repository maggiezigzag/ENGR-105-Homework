function B = diagEye(A)
% diagEye takes mxn matrix A and returns mxm matrix B
% with diagonal elements equal to the sum of the
% diagonal elements in A.

[nRows,nCols] = size(A);

% creating square matrix B
if nRows > nCols
    nRows = nCols;
end
if nCols > nRows
    nCols = nRows;
end

% x creates a row vector of ones the size of A along
% dimension 2
x = ones(1,nCols);
% y creates a new row vector of same size as x storing
% the sum of the diagonal elements of A
y = x.*sum(diag(A));

% checks to see if A was originally a row vector, if
% so, replaces y with the element at location 1 in y
if nRows == 1
    y = y(1);
end

% replaces diagonal of B with sum of diagonal elements
% of A
B(1:nRows,1:nCols) = diag(y);

end