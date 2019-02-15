%% Problem 2
% plots the measurements of the US population for every
% decade from 1790 to 1950.

clear; clc; close all;

years = 1790:10:1950;
population = [3939, 5308, 7240, 9638, 12866, 17069, 23192,...
    31443, 38558, 50156, 62948, 75995, 91972, 105711,...
    122775, 131669, 150697]./1000;

% specifying vector from 1765 instead of 1790 to
% extend fitted line to 0
t = linspace(1765,1950);
P = (197273000./(1+exp(1).^-(0.03134.*(t-1913.25))))./1000000;

figure;
% plots fitted line of population from 1765 to 1950
plot(t,P,'k','LineWidth',5);
hold on
% plots measured points of population
plot(years,population,'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',10);
hold off;

% specifying axis extends fitted line to 0
axis([1765 1975 0 200]);
set(gca,'FontSize', 15);
set(gcf,'color','w');
title('Population of the United States');
xlabel('Year');
ylabel('Population (millions)');
xticks([1800 1850 1900 1950]);
yticks([0 50 100 150 200]);
legend('Fit','Measured','Location','northwest');
box off;