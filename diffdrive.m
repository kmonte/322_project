function [t,y] = diffdrive(u_l, lt, u_r, rt, tend)
LD = lt.*u_l;
RD = rt.*u_r;
tspan = [1 tend];
ic = [0; 0; 0];
opts = odeset('RelTol',1e-2,'AbsTol',1e-4);
[t,y] = ode45(@(t,y) diffdrive1(t,y,rt,RD,lt,LD), tspan, ic, opts);
plot(y(:,1),y(:,2));grid
xlabel('Time (sec)','FontSize',14,'FontWeight','bold','Color','k');
ylabel('Signals','FontSize',14,'FontWeight','bold','Color','k');
title('Robot Pose Versus Time','FontSize',16,'FontWeight','bold','Color','k');