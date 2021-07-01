%% 矩阵的稀疏存储方式和完全存储方式的转化
% 使用 sparse(S) 将矩阵S转化为稀疏存储的A
clear all
clc
S = eye(3);
A = sparse(S);
% 使用 full(A) 将稀疏存储的矩阵A转化为完全存储的矩阵S
full(A)
%% 以上的方式都是通过先将一个矩阵记为完全存储的矩阵，然后再将其转化为稀疏存储的矩阵
% 现在直接建立稀疏存储的矩阵
% sparse(u,v,S): 其中 u，v,s 是三个等长的向量。S是要建立的稀疏存储矩阵的非0元素，u(i),v(i)分别是
% S(i)的行下标和列下标
clear all
clc
sparse([1,2,3,4],[1,2,3,4],[9,5,2,7])
% 使用 spconvert(A)直接建立稀疏存储矩阵
% A 是一个m*3或者m*4的矩阵，前两列表示非零元素坐在的行和列，后两行表示非零元素的实部和虚部
clear all
clc
spconvert([1,4,9;2,3,5;3,2,2;4,1,7])