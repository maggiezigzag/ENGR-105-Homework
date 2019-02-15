function visualizeParticles(xM,yM,xF,yF,tolSS,dt,m,ep,sigma)
% visualizeParticles() takes in parameters about
% particle behavior and updates the positions of the 
% moving particles every 100 iterations.

% storing the moving and fixed x and y particles into
% one vector each.
xAll=[xM,xF];
yAll=[yM,yF];

% defining qualities of graph
figure('pos',[10 10 560 420]);
movegui('center');
hold on;
plotF=plot(xF,yF,'.r','markers',100);
xlim([-11 11])
ylim([-11 11])
plotM=plot(xM,yM,'.k','markers',100);
xlim([-11 11])
ylim([-11 11])

% setting "previous" positions equal to 0 and counter
% equal to 0
xAllp=0;
yAllp=0;
count=0;
% while the conditions for tolerance are met,
while (tolSS<=sum(sqrt((xAll-xAllp).^2+(yAll-yAllp).^2)))
    % update counter
    count=count+1;
    % replace "previous" particles vectors with
    % positions of particles
    xAllp=xAll;
    yAllp=yAll;
    % updating positions of moving particles based on
    % partDynamics information
    for i=1:length(xM)
        [xM(i),yM(i)]=partDynamics(xM(i),yM(i),xAll,yAll,dt,m,ep,sigma);
    end
    % storing new updated positions into position
    % vectors
    xAll=[xM,xF];
    yAll=[yM,yF];
    % plotting positions every 100 iterations
    if mod(count,100)==0
        set(plotM,'XData',xM,'YData',yM)
        set(plotF,'XData',xF,'YData',yF)
        drawnow;
    end    
end

hold off;

end