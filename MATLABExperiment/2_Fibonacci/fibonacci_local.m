function f = fibonaccci(n)
%FIBONACCCI �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    f = zeros(n,1); % Ԥ�ȷ���ռ䣬����Ϊn��������
    f(1) = 1;
    f(2) = 2;
    for k = 3:n
        f(k) = f(k-1)+f(k-2);
    end
end

