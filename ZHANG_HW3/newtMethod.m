function [N,x]=newtMethod(a,tol)
% newtMethod(a,tol) takes a scalar 'a' with a tolerance
% 'tol' and returns the number of iterations and the 
% estimated cube root using a while loop.

% diff is the difference between last guess and current guess
diff=a; 
% N is a counter that returns the number of iterations
% necessary to achieve the cube root
N=0;
% x is the initial guess
x=a/3;
% x1 is initially x, but gets replaced with each
% following guess in the while loop
x1=a/3;

while (diff>=tol)
    % setting x1 equal to x
    x=x1;
    % x1 is now replaced with the next guess, creating
    % a recursive loop
    x1=(1/3)*((a/x^2)+2*x);
    % increment N
    N=N+1;
    % updating the absolute value of diff  
    diff=abs(x1-x)
end
disp(x)
end