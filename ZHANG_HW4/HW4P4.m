% Problem 4

speed = [0.2, 0.3, 0.7, 1.3, 1.9, 255, 1.6, 1.1, 1.3, 255, 0.9, ...
0.7, 255, 0.4, 0.6];
time = [0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, ...
1100, 1200, 1300, 1400];

a = sum(speed < 0.5)
% a) three measurements were less than 0.5 m/s
b = time(speed < 0.5)
% b) the times 0, 100, and 1300 corresponded to
% measurements less than 0.5 m/s
c = speed(time > 350 & time < 1050)
% c) the wind speed measurements of 1.9, 255, 1.6, 1.1,
% 1.3, 255, and 0.9 were recorded between 350 and 1050
% seconds
speed(speed == 255) = nan
plot(time, speed)