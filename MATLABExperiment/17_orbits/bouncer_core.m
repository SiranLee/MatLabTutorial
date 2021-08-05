z0 = 0;
% [z0,h] = initialize_bouncer;
g = 9.8;
c = 0.75;  % elasticity coefficient
delta_t = 0.005;
v0 = 21;
y = [];
while v0>=1
    z = z0;
    v = v0;
    while all(z>=0)
        % set(h,'zdata',z);
        % draw now;
        v = v - delta_t*g;
        z = z + delta_t*v;
        y = [y z];
    end
    v0 = v*c;
end
% finalize_bouncer;