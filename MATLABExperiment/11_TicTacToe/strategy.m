function [i,j] = strategy(X,p)
%STRATEGY 电脑采取的策略
%   X代表状态矩阵，p表示玩家: p=1表示绿子，p=-1表示蓝子

% 如果可能，执行一个可以赢得比赛的落子
[i,j] = winningmove(X,p);

% 如果不行，阻断对弈者可能赢得比赛的落子
if isempty(i)
    [i,j] = winningmove(X,-p); % 这里-p表示对手
end

% 如果还不行，就随便找一个还未落子的位置落子
if isempty(i)
    [i,j] = find(X~=0); % 找到X中的零元素的位置，行列分别保存在i,j中
    m = ceil(rand*length(i)); % 当然也可以+1后向下取整
    i = i(m);
    j = j(m);
end
end

