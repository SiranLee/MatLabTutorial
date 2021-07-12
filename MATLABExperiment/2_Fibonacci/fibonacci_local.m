function f = fibonaccci(n)
%FIBONACCCI 此处显示有关此函数的摘要
%   此处显示详细说明
    f = zeros(n,1); % 预先分配空间，长度为n的列向量
    f(1) = 1;
    f(2) = 2;
    for k = 3:n
        f(k) = f(k-1)+f(k-2);
    end
end

