function [i,j] = winningmove(X,p)
%WINNINGMOVE ������һ����ʤ������λ��

s = 2*p; % �趨һ����ʤ���ж���׼
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
    j = find(diag(flipud(X))==0);% flipud����Ԫ�����ڵ��в��䣬����������
    i = 4-j;
elseif
    i = [];
    j = [];
end

end

