function [x,y]= projectile(g,c,x0,y0,vx0,vy0,tstep)
    
% given values for projectile motion
    x(1)=x0;
    y(1)= y0;
    vx(1)=vx0;
    vy(1)=vy0;
% t is the first number, corresponding to location
    t=1;
% the min row vector checks to see if y is positive, 
% meaning the projectile is still in the air. 
   while min(y)>=0
      % velocities and positions in the x and y 
      % direction are generated in time steps of t
       vx(t+1)=vx(t)+(-c*vx(t)*sqrt(vx(t)^2+vy(t)^2))*tstep;
       vy(t+1)=vy(t)+(-g-c*vy(t)*sqrt(vx(t)^2+vy(t)^2))*tstep;
       x(t+1)=x(t)+vx(t)*tstep;
       y(t+1)=y(t)+vy(t)*tstep;
      % increment t
       t=t+1;

   end
  
end
