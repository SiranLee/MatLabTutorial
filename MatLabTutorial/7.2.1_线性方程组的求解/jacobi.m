function [y,n] = jacobi(A,b,x0,ep)
% A表示系数矩阵，b表示常数向量，x0表示解的初值，ep表示精确度 
% y为求解结果，n为迭代次数
    D = diag(diag(A)); % 提取矩阵A的主对角元素的向量，并根据这个向量构造矩阵
    U = -triu(A,1);% 提取矩阵A的主对角线以上的元素
    L = -tril(A,-1); % 提取矩阵A的主对角线以下的元素
    B = D\(L+U);
    f = D\b;
    y = B*x0+f;
    n=1; % 设置迭代初值
    while norm(y-x0)>=ep % 实际上就是求标准差
        x0 = y;
        y = B*x0+f;
        n=n+1;
    end
end