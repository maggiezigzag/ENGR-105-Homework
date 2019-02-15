function [outSum, computeTime1] = forLoopsSum(N)
    
tic
for k = 1:N
    x(k) = k^3;
end
outSum = sum(x);
computeTime1 = toc;
end


