function B = stripes(n)
% stripes takes a scalar n and returns an array B with
% zeros in odd rows and ones in even rows.

% creates nxn matrix of ones
B = ones(n);
[nRows,nCols] = size(B);
% replaces odd rows with zeros
B(1:2:nRows,:) = 0;

end