% given values for projectile graph
g= 9.81 ;
c= 0.002 ;
x0= 0 ;
y0= 1;
v0= 820 ;
tstep = 0.01  ;
grid on
hold on
axis tight
% for every angle from 5 to 85 in increments of 10,
% computes the initial velocities in the x and y
% direction. inputs these and other given projectile
% values into the projectile function, which stores it
% into a vector to be plotted.
for i=linspace(5,85,10)
    vx0=v0*cos(i*pi/180);
    vy0=v0*sin(i*pi/180);
    [x,y]= projectile(g,c,x0,y0,vx0,vy0,tstep);
    plot(x,y,'k.');
end

xlabel('X position(m)');
ylabel('Y position(m)');