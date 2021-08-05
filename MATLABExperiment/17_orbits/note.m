%% three dimensional Brownian motion
n = 50; % 进行随机游走的点的个数
delta = 0.125; % 一个极短的时间
P = zeros(n,3);
for t = 1:10000 % 随机游走一万步
    V = randn(n,3); % 各个方向的速度们
    P = P + delta*V;
end
% 原来都在原点，经过10000步的随机游走之后形成了下面图中的分布
plot3(P(:,1),P(:,2),P(:,3),'.');

%%
