%% Problem 6

function spirograph(R,r,d)
    % theta stores values from 0 to 10pi with spacing
    % of 0.001
    theta = linspace(0, 31.4159, 31416.93);
    % equations of x and y for spirograph
    x = (R+r)*cos(theta)+d*cos(((R+r)/r)*theta);
    y = (R+r)*sin(theta)-d*sin(((R+r)/r)*theta);
    % plots spirographs
    figure()
    plot(x,y)

