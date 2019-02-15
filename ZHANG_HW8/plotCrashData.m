function plotCrashData(inputFile,timeStep,framesRemoved,scaleFactor,windowSize)

load(inputFile);
hCom(1:end) = hCom(end:-1:1);
hCom = -hCom;
hCom(1:framesRemoved) = [];
wCom(1:framesRemoved) = [];

hCom = hCom/scaleFactor;
wCom = wCom/scaleFactor;

b = (1/windowSize)*ones(1,windowSize);
hCom = filter(b,1,hCom);
wCom = filter(b,1,wCom);

%setting origin to 0
hCom(1:windowSize) = [];
hCom = hCom-hCom(1);
wCom(1:windowSize) = [];
wCom = wCom-wCom(1);

figure(1); clf
set(gca,'FontSize',10,'FontName','Arial');
axis off;
set(gcf,'Color','w','PaperPositionMode','auto','Position',[0 0 1000 460])

%xpos vs ypos
axes('Position',[.1 .1 .23 .80]);
plot(wCom,hCom,'k')
axis tight
xticks([-2.5 -2 -1.5 -1 -.5]);
yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3]);
xlabel('x position (m)')
ylabel('y position (m)')

vhCom = (diff(hCom)./timeStep);
vwCom = diff(wCom)./timeStep;
%vCom = sqrt(vhCom.^2+vwCom.^2);
time = 1:size(vhCom,2);

%vhCom(1:end) = vhCom(end:-1:1);

% vhCom = filter(b,1,vhCom);
% vwCom = filter(b,1,vwCom);

% vhCom(1:windowSize) = [];
% vwCom(1:windowSize) = [];

%vy
axes('Position',[.71 .55 .23 .35]);
plot(time(1:end),vhCom,'k')
xticks([0 50 100 150 200 250]);
yticks([0 1 2 3 4 5 6 7 8]);
ylim([0 8]);
xlabel('time (ms)')
ylabel('v_y (m/s)')

%vx
axes('Position',[.41 .55 .23 .35]);
plot(time(1:end),vwCom,'k')
xticks([0 50 100 150 200 250]);
yticks([-25 -20 -15 -10 -5 0]);
xlabel('time (ms)')
ylabel('v_x (m/s)')

ahCom = diff(vhCom)./timeStep;
awCom = diff(vwCom)./timeStep;
% aCom = sqrt(ahCom.^2+awCom.^2);
time2 = 1:size(ahCom,2);
g = 9.81;

%ay
axes('Position',[.71 .1 .23 .35]);
plot(time2,ahCom./g,'k')
xticks([0 50 100 150 200 250]);
yticks(-50:20:70);
ylim([-30 50])
xlabel('time (ms)')
ylabel('a_y (g''s)')

%ax
axes('Position',[.41 .1 .23 .35]);
plot(time2,awCom./g,'k')
xticks([0 50 100 150 200 250]);
yticks(-50:20:70);
ylim([-30 50])
xlabel('time (ms)')
ylabel('a_x (g''s)')

end