function M = magic_db_odd(n)
%MAGIC_DB_ODD 求双偶数n的n阶魔方阵
    M = reshape(1:n^2,n,n)'; % 将1到n^2这个向量重构为n行n列的向量(列优先)
    [I,J] = ndgrid(1:n);
    K = fix(mod(I,4)/2) == fix(mod(J,4)/2); % fix(a)将a向着0的方向四舍五入
    M(k) = n^2+1-M(k); % M(k)索引到矩阵k中非0位置在M中对应的元素
end

