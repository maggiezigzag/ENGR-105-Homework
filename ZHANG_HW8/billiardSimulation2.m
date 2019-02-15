function [x,y] = billiardSimulation2(walls,ballState,dt,cr,...
    tf,visState)

% set initial variables for position and time
x(1) = ballState(1);
y(1) = ballState(2);

vx = ballState(3);
vy = ballState(4);

% total time of simulation
time = 0;

while visState == true
    % call collision Detection. Output - time for collision
    [state, tHit, xHit, yHit, vx, vy] = collisionDetection2(walls, dt, x(end), y(end), vx, vy, cr);
   
    %% if not collide with time step, time for collision > dt
     if state == 0
        % update position
        x(end+1) = x(end)+ vx*dt;
        y(end+1) = y(end)+ vy*dt;
        
        % move forward time
        time = time + dt;
    else
        
        %% ELSE (if collide within time step, time for collision =< dt)
        % whilst collision will occur, loop through...
        
        timeAfterC = dt - tHit;
        
        if (timeAfterC < eps) 
            timeAfterC = 0;
        end
        
        while (state == 1) && (timeAfterC > 0)
            
            % calculate time to NEXT collision
            [state, tHit, xHit, yHit, vx, vy] = collisionDetection2(walls, timeAfterC, xHit, yHit, vx, vy, cr);
            
            if (state ==1) && (timeAfterC > 0)
                timeAfterC = dt - tHit;
            end
        end
        
        x(end + 1) = xHit + vx*(timeAfterC);
        y(end + 1) = yHit + vy*(timeAfterC);
        time = time + dt;
     end
    
    if time >= tf
        visState = false;
    end    
end
animatePath(walls,x,y);