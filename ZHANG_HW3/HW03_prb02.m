% script for bubble_sort(v)

% creates a vector n that increases linearly from 50 to
% 3000 in 40 points
n=round(linspace(50,3000,40));
% preallocates array for number of points we want to plot
times=[1:40];
% for loop calls bubble_sort 40 times feeding in 1xn
% vectors of uniformly distributed random numbers.
for i=1:40
    
   unsorted=rand(n(i));
   times(i)=bubble_sort(unsorted);
    
end

% plotting and labelling the sort time vs. vector
% length graph
plot(n,times);
title('Bubble Sort time vs. Vector length');
xlabel('Vector length');
ylabel('Sort time (ms)');