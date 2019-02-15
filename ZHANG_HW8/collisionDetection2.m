function [state, tHit, x, y, vx, vy] = collisionDetection2(walls, dt, x, y, vx, vy, cr)

% state of colision: 0 - dont collide, 1 - collide
% collision

% matrix of collision times
t = [];
% vector of collision positions
yC = [];
xC = [];
wallHit = [];

[wallNum,~] = size(walls);

 
vxC = [];
vyC = [];


%% determine time to wall collision
% loop through all walls
for i= 1:wallNum
    
    % if vertical wall
    if (walls(i,1) == walls(i,3))
        % find displacement between wall plane and ball
        rX = (walls(i,1) - x);
        % (1) check if ball travelling towards wall
        if (rX*vx > 0)
            % (2) calculate time of hit plane
            tempT = rX/vx;
            
            % (3) calculate y position it hits plane
            yC(i) = y + vy*tempT;
            xC(i) = walls(i,1);
            
            % set up upper and lower bounds of wall
            upperY = max(walls(i,2), walls(i,4));
            lowerY = min(walls(i,2), walls(i,4));
            
            % if y position within endpoints of wall = hit wall
            if (yC(i) <= upperY) & (yC(i) >= lowerY)
                t(end+1) = tempT;
                wallHit(end+1) = i;
                
                % update velocities
                vxC(end+1) = -cr*vx;
                vyC(end+1) = cr*vy;
            end
        end
    else
        % horizontal wall
        rY = (walls(i,2) - y);
        % (1) check if ball travelling towards wall
        if (rY*vy > 0)
            % (2) calculate time of hit plane
            tempT = rY/vy;
            
            % (3) calculate x position it hits plane
            xC(i) = x + vx*tempT;
            yC(i) = walls(i,2);

            % set up upper and lower bounds of wall
            upperX = max(walls(i,1), walls(i,3));
            lowerX = min(walls(i,1), walls(i,3));
            
            % if x position within endpoints of wall = hit wall
            if (xC(i) <= upperX) & (xC(i) >= lowerX)
                t(end+1) = tempT;
                % store wall cell indice in a vector
                wallHit(end+1) = i;
                
                % update velocities
                vxC(end+1) = cr*vx;
                vyC(end+1) = -cr*vy;
            end
        end
    end
end

% find time to hit wall
tHit = min(t);
numWallsHit = length(t((t == tHit ) |((t < tHit  + 10^(6)*eps) & (t > tHit  - 10^(6)*eps))));

% no collision in time step
if (tHit > (dt+10*eps))
    state = 0;
% collision in time step
else
    state = 1;
    % position index of tHit value within t vector
    [~,j] = find(t == min(t));
    
    % if there is two minimum distances, plot the first
    i = wallHit(j(1));
    x = xC(i);
    y = yC(i);
    
    % corner
    if numWallsHit == 2
        vx = -cr*vx;
        vy = -cr*vy;
        
    else
        % find velocity after collision with desired wall
        vx = vxC(j);
        vy = vyC(j);
    end
    
    % find index of wall ball is colliding with and therefore
    % find position of collision
    
    
end
end