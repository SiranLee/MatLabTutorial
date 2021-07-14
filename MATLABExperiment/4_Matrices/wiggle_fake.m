function  wiggle_fake(X)
    thetamax = 0.1;
    delta = 0.025; % 增量
    t = 0;
    while true
        % 计算弧度
        theta = (4*abs(t-round(t))-1)*thetamax; % 这里使用sin，cos也可以只需要使得能够有一个周期即可
        G = [cos(theta), -sin(theta);sin(theta),cos(theta)]; % 旋转矩阵
        trans_X = G*X;
        dot2dot(trans_X);
        drawnow
        t = t+delta;
    end
end

