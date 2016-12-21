% x = @(t) t;
% y = @(t) t.^2;
% time = linspace(0, 2, 100);
% [xpos, ypos, theta] = gen_vectors(0, 0, x, y, time);
% u_r = [];
% u_l = [];
% for i = 1:(length(xpos) - 1)
%     [l, r] = move_addv(xpos(i), ypos(i), theta(i), xpos(i + 1), ypos(i + 1), theta(i + 1));
%     u_r = [u_r r];
%     u_l = [u_l l];
% end
% rt = linspace(0, 1, 100);
% lt = linspace(0, 1, 100);
% ic = [0; 0; 0];
% figure;  
% grid;
% xlabel('Time (sec)','FontSize',14,'FontWeight','bold','Color','k');
% ylabel('Signals','FontSize',14,'FontWeight','bold','Color','k');
% title('Robot Pose Versus Time','FontSize',16,'FontWeight','bold','Color','k');
% hold on;
% for i = 1:length(u_r)
%     points = diffdrive(ic, u_l(i), lt, u_r(i), rt);
%     len = length(points);
%     ic = points(len, :).';
%     plot(points(:,1),points(:,2),'b');
% end
% hold off;

%1. See simulation code

%2. Move from (0,0) to (1,1) as a demonstration

x = @(t) t;
y = @(t) t;
time = linspace(0, 1, 10);
[xpos, ypos, theta] = gen_vectors(0, 0, x, y, time);
u_r = [];
u_l = [];
for i = 1:(length(xpos) - 1)
    [l, r] = move_addv(xpos(i), ypos(i), theta(i), xpos(i + 1), ypos(i + 1), theta(i + 1));
    u_r = [u_r r];
    u_l = [u_l l];
end
rt = linspace(0, 1, 10);
lt = linspace(0, 1, 10);
ic = [0; 0; 0];
figure;  
grid;
xlabel('Time (sec)','FontSize',14,'FontWeight','bold','Color','k');
ylabel('Signals','FontSize',14,'FontWeight','bold','Color','k');
title('Robot Pose Versus Time','FontSize',16,'FontWeight','bold','Color','k');
hold on;
for i = 1:length(u_r)
    points = diffdrive(ic, u_l(i), lt, u_r(i), rt);
    len = length(points);
    ic = points(len, :).';
    for j = 1:(len - 1)
        plot(points(j:(j + 1),1),points(j:(j + 1),2),'b');
        %pause(0.001);
    end
end
hold off;

%3. Intercept and follow a parabola

x = @(t) t;
y = @(t) t.^2;
time = linspace(0, 1, 10);
[xpos, ypos, theta] = gen_vectors(0, 0, x, y, time);
u_r = [];
u_l = [];
for i = 1:(length(xpos) - 1)
    [l, r] = move_addv(xpos(i), ypos(i), theta(i), xpos(i + 1), ypos(i + 1), theta(i + 1));
    u_r = [u_r r];
    u_l = [u_l l];
end
rt = linspace(0, 1, 10);
lt = linspace(0, 1, 10);
ic = [0; 0; 0];
figure;  
grid;
xlabel('Time (sec)','FontSize',14,'FontWeight','bold','Color','k');
ylabel('Signals','FontSize',14,'FontWeight','bold','Color','k');
title('Robot Pose Versus Time','FontSize',16,'FontWeight','bold','Color','k');
hold on;
for i = 1:length(u_r)
    points = diffdrive(ic, u_l(i), lt, u_r(i), rt);
    len = length(points);
    ic = points(len, :).';
    for j = 1:(len - 1)
        plot(points(j:(j + 1),1),points(j:(j + 1),2),'b');
        %pause(0.001);
    end
end
hold off;

%4. Intercept a line with two robots

%5. Intercept a line with a lot more robots
