m = 50; % total steps of random walk;
x = cumsum(randn(m,1));
y = cumsum(randn(m,1));
% cumsum: cumulative sum,累计求和，
% 以x为例: 若randn(m,1)产生了: r1,r2,r3,...,rm这m个随机数，那么cumsum(randn(m,1))
% 的结果仍是一个长度为m的向量x,x1 = r1;x2 = r1+r2;x3 = r1+r2+r3;...依次类推
plot(x,y,'.-');
s = 2*sqrt(m); % sqrt(m)是随机游走的边界
axis([-s s -s s]);
