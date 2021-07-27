function p = winner(X)
% winner: 通过此时的X矩阵判断赢家
%   p = 0: 尚无赢家
%   p = 1: 绿子赢
%   p = -1: 蓝子赢
%   p = 2: 平局
for p = [-1 1]
    s = 3*p; % 同一行，同一列，同一对角线的必要条件
    is_win = any(sum(X)==s) || any(sum(X')==s) || any(sum(diag(X) == s) || any(sum(diag(fliplr(X))==s));
    % flipud: 将矩阵或者向量上下翻转
    % fliplr: 将矩阵或者向量左右翻转
    if is_win
        return
    end
end
% 到这里就是p=0和p=2的可能了
p =  2*all(X(:)~=0); % X(:)获取X中的所有元素，返回一个列向量
end
% 这里all和any作用的单位都是向量，也就是说如果它们作用在矩阵上，那么会返回又它们对矩阵每一列作用的结果形成的行向量
