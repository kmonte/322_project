% returns controls and positions to move from the 
% current pose (x_0, y_0, o_0) to the desired end pose (x_f, y_f, z_f)
% currently DOES NOT account for max speed/errors/etc
% or RETURN x, y, o VALUES (im lazy)
function [u_l, u_r, x, y, o] = move_addv(x_0, y_0, o_0, x_f, y_f, o_f)
    r = 1; % radius of wheels
    L = 1; % radius of car
    
    % first rotate to face x_f, y_f 
    theta = o_f - atan(y_o/x_o); % Need to have cases for atan
    u_l(1) = L*2/r * theta;
    u_r(1) = - u_l(1);
    
    % now move to x_f, y_f
    d = sqrt((x_f-x_0)^2 + (y_f-y_0)^2);
    u_l(2) = 4/r * d;
    u_r(2) = u_l(2);
    
    % now face to o_f
    
    theta = o_f - theta;
    u_l(3) = L*2/r * theta;
    u_r(3) = - u_l(3);
end
    