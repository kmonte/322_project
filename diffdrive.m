function points = diffdrive(ic, u_l, lt, u_r, rt)
    LD = lt.*u_l;
    RD = rt.*u_r;
    tspan = [0 1];
    opts = odeset('RelTol',1e-2,'AbsTol',1e-4);
    [~, points] = ode45(@(t,y) diffdrive1(t,y,rt,RD,lt,LD), tspan, ic, opts);
end