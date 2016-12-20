function dzdt = diffdrive1(t,y,rt,RD,lt,LD)
% This defines the right hand side of the differential equation model for
% the simple car with two wheels. RD,rd is the control for the right wheel
% and LD,ld is the control for the left wheel
r=1; % Radius of wheel
L=1; % Distance between wheels
RD = interp1(rt,RD,t); % Interpolate the data set at time t
LD = interp1(lt,LD,t); % Interpolate the data set at time t
dzdt = [
 (r*(RD+LD)/2)*cos(y(3));
 (r*(RD+LD)/2)*sin(y(3));
 (r*(RD-LD)/L)
 ];