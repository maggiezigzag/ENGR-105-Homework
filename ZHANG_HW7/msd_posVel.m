function msd_posVel(c,k,m,yi,vi,t_beg,t_end)
%position and velocity solver


%solving the differential equation using ode45 and the
%input values, and assigning x1 and x2 to x
[t,x]=ode45(@msd,[t_beg,t_end],[yi vi],[],c,k,m);
%plot x1 vs t and x2 vs 2 by calling the first and
%second columns of x respectivley
p=plotyy(t,x(:,1),t,x(:,2));
%setting x and y labels for the left and right axes
xlabel('Time(sec)');
yyaxis left;
ylabel('Position(m)');
yyaxis right;
ylabel('Velocity(m/s)');
%setting axes limits of y
ylim([-4 6]);
%turning grid off
grid off
%creating title
title('msd posVel');

end