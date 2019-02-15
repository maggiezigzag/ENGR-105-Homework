function plotAFMdata(H,F,I,ss,saveName)
% plots data from AFMdata0001.mat and specified scan
% size and saves resulting figure to a jpeg of
% specified file name

f = figure(1); clf
set(gca,'FontSize',10,'FontName','Arial');
axis off;

% reshapes friction and current matricies into row
% vectors for scatter plot function
F1 = reshape(F,1,[]);
I1 = reshape(I,1,[]);

%% Current as a function of friction plot
axes('Position',[.07 .6 .4 .35]);
set(gca,'FontSize',10,'FontName','Arial');
scatter(F1,I1,'k','.');
xlabel('Friction (mV)');
ylabel('Current response (V)');
title('Current as a function of friction');

%% Current histogram plot
axes('Position',[.55 .6 .4 .35]);
set(gca,'FontSize',10,'FontName','Arial');
histogram(I);
xlabel('Current response (V)');
ylabel('Counts');
title('Current histogram');
xlim([-1 7]);
xticks([-1 0 1 2 3 4 5 6 7]);

%% Friction overlaid height plot
axes('Position',[.07 .07 .4 .37]);

x = linspace(1,ss,256);
y = linspace(1,ss,256);

[X,Y] = meshgrid(x,y);
surf(X,Y,H,F);
xlabel('nm');
ylabel('nm');
zlabel('nm');
zlim([-inf inf]);
xticks([0 100 200]);
yticks([0 100 200]);
title('Friction overlaid height');
shading interp
c1 = colorbar;
title(c1,'Friction (mV)');
colormap default;
view([-47 65]);
grid off;
box on;

%% Current overlaid heigh plot
axes('Position',[.55 .07 .4 .37]);
surf(X,Y,H,I);
xlabel('nm');
ylabel('nm');
zlabel('nm');
zlim([-inf inf]);
xticks([0 100 200]);
yticks([0 100 200]);
title('Current overlaid height');
shading interp
colormap default;
c2 = colorbar;
title(c2,'Current Response (V)');
view([-47 65]);
grid off;
box on;

% sets background of figure to white, sets figure
% window 1000x460 pixels
set(gcf,'Color','w','PaperPositionMode','auto','Position',[0 0 1000 460])
% moves figure to center of screen
movegui(f,'center')
% saves figure to jpeg of 300pixels/in resolution to specified
% name
print(gcf,'-djpeg','-r300',saveName)
close(f);



