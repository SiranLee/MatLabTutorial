function [i,j] = strategy(X,p)
%STRATEGY ���Բ�ȡ�Ĳ���
%   X����״̬����p��ʾ���: p=1��ʾ���ӣ�p=-1��ʾ����

% ������ܣ�ִ��һ������Ӯ�ñ���������
[i,j] = winningmove(X,p);

% ������У���϶����߿���Ӯ�ñ���������
if isempty(i)
    [i,j] = winningmove(X,-p); % ����-p��ʾ����
end

% ��������У��������һ����δ���ӵ�λ������
if isempty(i)
    [i,j] = find(X~=0); % �ҵ�X�е���Ԫ�ص�λ�ã����зֱ𱣴���i,j��
    m = ceil(rand*length(i)); % ��ȻҲ����+1������ȡ��
    i = i(m);
    j = j(m);
end
end

