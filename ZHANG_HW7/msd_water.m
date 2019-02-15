function msd_water(c,k,m,yi,vi,t_beg,t_end)
%this function plots the effect of mass on the system
%position as a function of time

%intiates time vector with beginning and end parameters
%with divisions the size of the data vectors
tt=linspace(t_beg,t_end,length(m));
%assigning the x variable to time
x=tt;
%assigning the y variable to mass
y=m;

%looping through with iterations=size of mass input
%vector
for i=1:length(m)
%using the ode solver to solve the differential
%equations corresponding to each element of the mass
%vector
[t,zz]=ode45(@msd,tt,[yi vi],[],c,k,m(i));
%assigning the result of the differential equation to
%corresponding column vector element of z
z(i,:)=zz(:,1);
end
%plotting x,y,z using surf function
surf(x,y,z);
%setting axis
axis tight;
%setting view to make plot visualizable
view(-35,40);
%setting x,y,z lablels
ylabel('Mass (kg)');
xlabel('Time (s)');
zlabel('Position (m)');
%turning box on and grid off
box on;
grid off;
end