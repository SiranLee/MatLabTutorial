%% 使用eig(A)来求矩阵A的全部特征值
A = magic(3)
E = eig(A)
[X, D] = eig(A) % 求矩阵A的全部特征值，构成对角阵D,并产生矩阵X, X各列是相应于D的特征向量
% 一波验证
A*X(:,1)
D(1)*X(:,1)
%%
clear all
clc
R = magic(3);
S= magic(2);
A = [R,zeros(3,2);zeros(2,3),S]
[tzxl_R, tzz_R] = eig(R)
[tzxl_S, tzz_S] = eig(S)
[tzxl_A, tzz_A] = eig(A)
%% eigshow 在单位圆上演示向量x和Ax之间的关系
clear all
clc
eigshow()
%% 
clear all
clc
coordinates = [0,0.5,0.5,3,5.5,5.5,6,6,3,0;0,0,6,0,6,0,0,8,1,8];
A = [1,0.5;0,1];
y = A*coordinates;
subplot(2,2,1);
fill(coordinates(1,:),coordinates(2,:),'b');
subplot(2,2,2);
fill(y(1,:),y(2,:),'b');