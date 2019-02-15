
% creating matrix A as shown in problem 4
A=[1,2,3;4,5,6;7,8,9];

% 'unwrapping' A and taking its transpose gives us the
% row vector B.
B=A(:)'
% taking the overlap of all three rows and the
% first two columns of A gives us the matrix C.
C=A(1:3,1:2)
% taking the overlab of the first two rows and all
% three columns of A gives us the matrix D.
D=A(1:2,1:3)
% fills E with values of A from the front every 
% 2 indices in columns and rows
E(1:2:5,1:2:5)= A(1:3,1:3)
% fills F with values of A from back every 2 indices in
% columns and rows
F(5:-2:1,5:-2:1)= A(1:3,1:3)




