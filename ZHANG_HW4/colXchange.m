function B = colXchange(A)
% colXchange takes a matrix A and returns a matrix B
% with every column pair swapped.

B=A;
% if matrix has an even number of columns, then nothing
% needs to be done about the dimensions. if it has an
% odd number, then the dimensions must be changed. the
% odd columns then replace the even columns and vice
% versa.
if mod(size(B,2),2)==0
    B(:,1:2:end)=A(:,2:2:end);
    B(:,2:2:end)=A(:,1:2:end);
else
    B(:,1:2:end-1)=A(:,2:2:end-1);
    B(:,2:2:end-1)=A(:,1:2:end-1); 
end


end