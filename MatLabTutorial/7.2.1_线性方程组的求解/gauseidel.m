function [y,n] = gauseidel(A,b,x0,ep)
    D = diag(diag(A));
    U = -triu(A,1);% 提取矩阵A的主对角线以上的元素
    L = -tril(A,-1); % 提取矩阵A的主对角线以下的元素
    B = (D-L)\U;
    f = (D-L)\b;
    y = B*x0+f;
    n=1;
    while norm(y-x0)>=ep
        x0 = y;
        y = B*x0+f;
        n = n+1;
    end
end