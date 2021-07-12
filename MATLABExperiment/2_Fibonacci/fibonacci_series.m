function f = fibonacci_series(x)
%FIBONACCI_SERIES ���쳲����������ڸ���xȡֵ������µ�ֵ
%   fibonacci_series(x)
%% initialization
pkm1 = x; % p_(k-1)��ֵ
pk = 2*x^2; % p_k��ֵ p_k������쳲����������е���
ykm1 = pkm1;
yk = ykm1+pk;
%% iteration
while any(abs(yk-ykm1)>2*eps(yk)) % ��ʾ���������ĳ��x�¼�����������ô���˳�ѭ�����������ִ��
    pkp1 = x(pk+pkm1*x); % �������k+1��
    pkm1 = pk;
    pk = pkp1; % ������ֵ
    ykm1 = yk;
    yk = ykm1+pk;
    k = k+1;
end
end

