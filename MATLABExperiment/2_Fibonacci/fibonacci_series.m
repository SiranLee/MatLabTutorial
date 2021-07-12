function f = fibonacci_series(x)
%FIBONACCI_SERIES 求得斐波那契级数在给定x取值的情况下的值
%   fibonacci_series(x)
%% initialization
pkm1 = x; % p_(k-1)的值
pk = 2*x^2; % p_k的值 p_k都代表斐波那契级数中的项
ykm1 = pkm1;
yk = ykm1+pk;
%% iteration
while any(abs(yk-ykm1)>2*eps(yk)) % 表示如果出现在某个x下级数收敛，那么就退出循环；否则继续执行
    pkp1 = x(pk+pkm1*x); % 计算出第k+1项
    pkm1 = pk;
    pk = pkp1; % 迭代赋值
    ykm1 = yk;
    yk = ykm1+pk;
    k = k+1;
end
end

