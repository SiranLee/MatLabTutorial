function [i,j] = winningmove(X,p)
%WINNINGMOVE 检查可能一击制胜的落子位置

s = 2*p; % 设定一击制胜的判定标准
if any(sum(X)==s)
    j = find(sum(X)==s);
    i = find(X(:,j)==0);
elseif any(sum(X')==s)
    i = find(sum(X')==s);
    j = find(X(i,:)==0);
elseif sum(diag(X))==s
    i = find(diag(X)==0);
    j = i;
elseif sum(diag(flipud(X)))==s
    j = find(diag(flipud(X))==0);% flipud各个元素所在的列不变，所以先找列
    i = 4-j;
elseif
    i = [];
    j = [];
end

end

