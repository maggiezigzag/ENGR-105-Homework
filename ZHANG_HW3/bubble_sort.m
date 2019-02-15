function[t,v]=bubble_sort(v)
% bubble_sort(v) takes a vector v of size 1xn and 
% returns the time it took to complete the sort and
% the sorted vector v

% len stores the length of the vector v
len=length(v);
% start timer
tic;

% first for loop iterates through the first index, then
% second for loop iterates through the following index
% while checking if the second value is greater than
% the first. If the second value is greater than the
% first, the value at that index is stored in a temp 
% and the first value is set to the location of the 
% second value while the temp is stored in the location
% of the first value.
for c=[1:(len)]
    for counter=[1:(len-c)]
        if v(counter)<v(counter+1)
            temp=v(counter);
            v(counter)=v(counter+1);
            v(counter+1)=temp;
        end
    end
end
disp(counter)
% end timer
t=toc;
end