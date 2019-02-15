data = [];
data = xlsread('data.xlsx',1);
for i=2:length(data(1,:))
    if(data(1,i)>50)
        plot(data(:,1), data(:,i))
        hold on
    end
end
xlabel('x')
ylabel('y')
title('for loop test')
ylim([0 100])