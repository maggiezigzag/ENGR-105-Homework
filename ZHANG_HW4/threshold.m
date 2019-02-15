function B = threshold(A,lob,hib)
% threshold takes a matrix A, lowerbound lob, and
% higherbound hib and returns a matrix B with all
% elements lower than lob with lob and all elements
% greater than hib with hib. 

% replacing all elements greater than hib with hib
A(A>hib) = hib;
% replacing all elements less than lob with lob
A(A<lob) = lob;
B = A;


end

