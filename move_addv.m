
% returns controls and positions to move from the 
% current pose (x_0, y_0, o_0) to the desired end pose (x_f, y_f, z_f)
% currently DOES NOT account for max speed/errors/etc
% or RETURN x, y, o VALUES (im lazy)
function [u_l, u_r] = move_addv(x_0, y_0, o_0, x_f, y_f, o_f)
    r = 1; % radius of wheels
    L = 1; % radius of car
    i = 1;
    
    % first rotate to face x_f, y_f 
    x_diff = x_f - x_0;
    y_diff = y_f - y_0;
    ratio = y_diff/x_diff;
    if isnan(ratio) %incase distance is 0
       theta = o_f - o_0;
    else
        theta = atan(ratio) - o_0;
    end
    if x_diff < 0
        theta = theta + pi/2;
    end
    
    % not taking into account optimal turning direction
    if ~(theta == 0)
        u_l(i) = L*2/r * theta;
        u_r(i) = - u_l(i);  
        i = i+1;
    end
    
    
    % now move to x_f, y_f
    d = sqrt((x_diff)^2 + (y_diff)^2);
    if ~(d == 0)
        u_l(i) = 4/r * d;
        u_r(i) = u_l(i);
        i = i+1;
    end
    
    % now face to o_f
    if ~(o_f == theta +  o_0)
        theta = o_f - theta;
        u_l(i) = L*2/r * theta;
        u_r(i) = - u_l(i);
    end

end
% Given a starting location, two anonymous position functions, and a time
% vector, return an array of coordinates (x,y,angle). t must start after
% the starting coordinates, of course. The returned values will be: the x
% coordinate, y coordinate, and the angle of the line between the previous
% point and the current point. 
function [x, y, theta] = gen_vectors(x_0,y_0, x_t, y_t, t)
    x = [];
    y = [];
    theta = [];
    for i = 1 to length(t)
        x_temp = x_t(t(i));
        y_temp = y_t(t(i));
        x = [x x_temp];
        y = [y y_temp];
        if x_temp >= x_0 
            theta = [theta atan((y_temp-y_0)/(x_temp-x_0))];
        else
            theta = [theta atan((y_temp-y_0)/(x_temp-x_0))+pi];
        end
        x_0 = x_temp;
        y_0 = y_temp;
    end
end