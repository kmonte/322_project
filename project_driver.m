x = @(t) 0;
y = @(t) t;
time = linspace(0, 10, 25);
[xpos, ypos, theta] = gen_vectors(0, 0, x, y, time);
u_l = [];
u_r = [];
for i = 1:(length(xpos) - 1)
    [l, r] = move_addv(xpos(i), ypos(i), theta(i), xpos(i + 1), ypos(i + 1), theta(i + 1));
    u_l = [u_l l];
    u_r = [u_r r];
end
rt = linspace(0, 10, 72);
lt = linspace(0, 10, 72);
diffdrive(u_l, lt, u_r, rt, 10);
