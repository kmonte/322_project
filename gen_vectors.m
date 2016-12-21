% Given a starting location, two anonymous position functions, and a time
% vector, return an array of coordinates (x,y,angle). t must start after
% the starting coordinates, of course. The returned values will be: the x
% coordinate, y coordinate, and the angle of the line between the previous
% point and the current point. 
function [x, y, theta] = gen_vectors(x_0, y_0, x_t, y_t, t)
    x = x_0;
    y = y_0;
    theta = 0;
    for i = 1:length(t)
        x_temp = x_t(t(i));
        y_temp = y_t(t(i));
        x = [x x_temp];
        y = [y y_temp];
        if x_temp-x_0 == 0
            theta = [theta 0];
        else
            if x_temp >= x_0 
                theta = [theta atan((y_temp-y_0)/(x_temp-x_0))];
            else
                theta = [theta atan((y_temp-y_0)/(x_temp-x_0))+pi];
            end
        end
        x_0 = x_temp;
        y_0 = y_temp;
    end
end