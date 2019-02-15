function mandelbrotPlot(N,xLims,yLims,pass)
% mandelbrotPlot plots takes as input scalar NxN for
% data field, 1x2 row vector xLims specifying lower and
% upper bound of the domain, 1x2 row vector yLims
% specifying lower and upper bound of the range, and
% scalar pass for the number of iterative evaluations
% of z.

% using xLims and yLims to specify size of meshgrid
x = linspace(xLims(1),xLims(2),N);
y = linspace(yLims(1),yLims(2),N);
[X,Y] = meshgrid(x,y);
Z = zeros(N);
% iterating through mandelbrot algorithm
for k = 1:pass
    Z = Z.^2+(X+1i*Y);
    W = exp(-abs(Z));
end
% specifying qualities of the plot
colormap jet;
pcolor(W);
shading flat;
axis('square','equal','off');

