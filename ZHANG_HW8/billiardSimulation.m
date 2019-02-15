function [x,y] = billiardSimulation(walls,ballState,dt,cr,tf,visState)

% initial position and velocity
x(1) = ballState(1); 
y(1) = ballState(2);
vx = ballState(3); 
vy = ballState(4);

timePassed = 0;

% If ball is travelling towards each of the system
% walls,
    
while visState == true
    [state, tCol, xC, yC, vx, vy] = collision(walls, dt, x(end), y(end), vx, vy, cr);
    if state == 0
        x(end+1) = x(end)+vx*dt;
        y(end+1) = y(end)+vy*dt;
        timePassed = timePassed+dt;
    else
        timeAfterCol = dt-tCol;
        if timeAfterCol <eps
            timeAfterCol = 0;
        end
        while (state == 1) && (timeAfterCol > 0)
            [state,tCol,xC,yC,vx,vy] = collision(walls,dt,cr,x(end),y(end),vx,vy);
            if (state==1)&&(timeAfterCol>0)
                timeAfterCol = dt-tCol;
            end
        end
      x(end+1) = xC+vx*(timeAfterCol);
      y(end+1) = yC+vy*(timeAfterCol);
      timePassed = timePassed+dt;
    end
    if timePassed >= tf
        visState = false;
    end       
end

animatePath(walls,x,y);

    function [state,tCol,x,y,vx,vy] = collision(walls,dt,x,y,vx,vy,cr)
    % vectors for collision posiitons and times
    xCol = []; yCol = [];
    vxCol = []; vyCol = [];
    Cols = [];
    tEval = []; 

    % If ball is travelling towards each of the system
    % walls,
    [numWalls, ~] = size(walls);
        
        for i = 1:numWalls
            % vertical collision
            if (walls(i,1)-x)*vx>0 && ...
                walls(i,1)==walls(i,3)
                    % calculate time to hit
                tInt = (walls(i,1)-x)/vx;
                    % calculate y position of hit
                yCol(i) = y + vy*tInt;
                xCol(i) = walls(i,1);
                % checks to see if the hit is within the
                % bounds of the wall
                % if it is, then hit the wall and update
                % velocities
                if (yCol(i) <= max(walls(i,2),walls(i,4))) ...
                        & (yCol(i) >= min(walls(i,2),walls(i,4)))
                    tEval(end+1) = tInt;
                    Cols(end+1) = i;
                    vxCol(end+1) = -cr*vx;
                    vyCol(end+1) = cr*vy;
                end
            % horizontal collision
            else
                distY = (walls(i,2)-y);
                if (distY*vy)>0
                    tInt = distY/vy;
                    xCol(i) = x+vx*tInt;
                    yCol(i) = walls(i,2);

                    if (xCol(i) <= max(walls(i,1),walls(i,3))) & (xCol(i) >= min(walls(i,1),walls(i,3)))
                        tEval(end+1) = tInt;
                        Cols(end+1) = i;
                        vxCol(end+1) = cr*vx;
                        vyCol(end+1) = -cr*vy;
                    end
                end
            end
        end

        %finds index of closest wall it will hit and time to
        %the collision
        tCol = min(tEval);
        % fudging factor for corners
        numCol = length(tEval((tEval == tCol)|...
            ((tEval<tCol+10^(6)*eps)&(tEval>tCol-10^(6)*eps))));

        if(tCol>(dt+10*eps))
            state = 0;
        else
            state = 1;
            [~,j] = find(tEval==min(tEval));
            i = Cols(j(1));
            x = xCol(i);
            y = yCol(i);
            if numCol == 2
                vx = -cr*vx;
                vy = -cr*vy;
            else
                vx = vxCol(j);
                vy = vyCol(j);
            end
        end
    end
end
