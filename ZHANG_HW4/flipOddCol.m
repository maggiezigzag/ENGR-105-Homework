function B = flipOddCol(A)
% flipOddCol takes array A and returns array B with all
% odd columns flipped.
  
% flips every odd column in A and replaces it in A
A(:,1:2:end) = flip(A(:,1:2:end));
B = A;

end

