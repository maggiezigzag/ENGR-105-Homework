a = [];
b = [];
ctr = 0;
jj = 0;
N = round(logspace(5,7,20));

for jj = N
    ctr = ctr + 1;
    [outSum1, computeTime1] = forLoopsSum(N(ctr));
    a(end+1) = computeTime1;
    [outSum2, computeTime2] = vectSum(N(ctr));
    b(end+1) = computeTime2;
end

semilogx(N, a, 'r-o')
hold on;
semilogx(N, b, 'b-o')
hold off;
xlabel('N')
ylabel('computeTime')
title('forLoopsSum vs vectSum')
legend('for loop','Vectorization');
