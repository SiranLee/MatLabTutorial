%% 对角阵（diag）
% 提取矩阵的对角线元素：
% diag(A):其中A是矩阵; diag(A,k): 提取矩阵A的第k条对角线的元素，主对角线是第0条，往上依次是1,2,...，
% 往下依次是-1，-2
clear all
clc
A = magic(3);
diag(A,0);
diag(A,1);
diag(A,-1);
% 根据向量来构造对角阵：
% diag(V): 以向量V为主对角线元素构造对角阵；diag(V,k): 以向量V为第k条对角线元素，产生对角矩阵
V = [9,5,2,7]
diag(V)
diag(V,1)
%% 三角阵
% 上三角阵：triu(A) triangle uppper: 提取矩阵A的主对角线及以上的元素,结果是一个上三角阵
clear all
clc
triu(magic(4))
triu(magic(4),-1) %提取矩阵A的第-1条对角线及以上的元素
% 下三角阵：tril(A) triangle lower: 提取矩阵A的主对角线及以下的元素，结果是一个下三角阵
clear all
clc
tril(magic(3))
tril(magic(3),1)
%% 矩阵的转置
% .': 普通转置
% ': 共轭转置
% 共轭转置和普通转置在被转置矩阵都为实数矩阵时，转置的结果相同
clear all
clc
A = magic(3)
A.'
A'
%% 矩阵的翻转
% fliplr(A): 对矩阵A实施左(left)右(right)翻转, 将第一列与最后一列交换，第二列与倒数第二列交换，以此类推
% flipud(A): 对矩阵A进行上(up)下(down)翻转，将第一行与最后一行交换，第二行与倒数第二行交换，以此类推
clear all
clc
A = magic(4)
fliplr(A)
flipud(A)
%% 矩阵的求逆
% 通过inv(A)来求矩阵A的逆
clear all
clc
A = magic(3)
inv(A)





