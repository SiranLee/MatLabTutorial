function  wiggle_fake(X)
    thetamax = 0.1;
    delta = 0.025; % ����
    t = 0;
    while true
        % ���㻡��
        theta = (4*abs(t-round(t))-1)*thetamax; % ����ʹ��sin��cosҲ����ֻ��Ҫʹ���ܹ���һ�����ڼ���
        G = [cos(theta), -sin(theta);sin(theta),cos(theta)]; % ��ת����
        trans_X = G*X;
        dot2dot(trans_X);
        drawnow
        t = t+delta;
    end
end

