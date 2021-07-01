%% 一些通用的特殊矩阵
% zeros 零矩阵: zeros(m)-->m阶方阵；zeros(m,n)-->m*n的矩阵
clear all;
clc;
zeros(3)
zeros(3,2)
% ones 幺(1)矩阵
ones(3)
% eye 产生对角线为1的矩阵，当是方阵时，即产生单位阵
eye(3)
eye(3,2)
% rand 产生(0,1)区间服从均匀分布的随机矩阵
rand(3)
rand(1,4) %产生随机向量
% randn 产生均值(u)为0，σ(标准差)为1的标准正态分布随机矩阵
randn(3)
randn(2,1)
%% 练习：产生5阶的两位的随机整数矩阵A,再产生均值(u)为0.6、方差为0.1的5阶正态分布矩阵B,最后验证 (A+B)I=IA+BI
clear all
clc;
% 产生 [a,b] 上均匀分布的随机整数的方式: fix(a+(b-a+1)*rand(阶数)）
A = fix(10+(99-10+1)*rand(5))
% 产生 均值为u,方差为 σ的标准正态分布的随机数的方式：u+σx,x是服从标准正态分布的随机矩阵
B = 0.6+0.1*randn(5)
I = eye(5)
(A+B)*I == I*A+B*I

%% 专门学科的特殊阵
% 魔方阵： magic(n), 每行每列以及主副对角线上各n个元素相等
clear all;
clc
magic(3)
% 帕斯卡矩阵(杨辉三角形)
pascal(5)

