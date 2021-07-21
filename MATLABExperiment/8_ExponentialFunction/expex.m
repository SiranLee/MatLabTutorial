function expex(t)
    s = 1; % 幂级数的和
    r = 0; % 判断收敛
    term = 1; % 幂级数中的每一项
    n = 0; % 指明处理到了第几项
    tic
    while r~= s % 如果前一项和后一项近似相等，级数收敛，退出循环
        r = s;
        n = n+1;
        term = (t/n)*term;
        s = s+term;
    end
    toc
    s
end