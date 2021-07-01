%% 求最大值和最小值
% max():求向量或者矩阵的最大元素
% min():求向量或者矩阵的最小元素
% 调用格式(以max为例): 
% 当参数为向量时，求该向量的最大值:
%   y = max(X): 返回向量的最大值存入y中(复数按模取最大值)
%   [y,k] = max(X): 返回向量的最大值存入y，最大值元素的序号存入k
% 当参数为矩阵时,求该矩阵每列或者每行的最大值:
%   y = max(A): 按列求每一列的最大值，返回一个行向量
%   [y,u] = max(A): 按列求每一列的最大值，返回的行向量存于y中，u是一个向量，存储每一列最大值元素的行号
%   max(A,[],dim): dim取1或2. dim取1表示按列求最大值，返回一个行向量;dim取2表示按行取最大值,返回一个列向量
A = [13,-56,78;25,63,-235;78,25,563;1,0,-1];
% 求A的每列的最大元素
max(A)
% 求A的每一行的最大元素
max(A')
% 求A的最大元素
max(max(A))

%% 求矩阵的平均值和中值
% mean(): 求向量或者矩阵的平均值
% median(): 求向量或者矩阵的中值
% 二者调用格式和上述的max的调用格式相同
clear all
clc
x = [1200,800,1500,1000,5000];
mean(x)
median(x)

%% 求和与求积
% sum(): 求和函数，调用格式同上
% prod(): 求积函数，调用格式同上
% 求累加和与累加积
% cumsum(): 对一个向量求累加和，返回一个向量，其中每一个元素是到它为止(包括它)前面所有元素之和
% cumprod(): 对一个向量求累加积，返回一个向量，其中每一个元素是到它为止(包括它)掐面所有元素之积
clear all; clc;
x = [1,2,3,4,5,6,7,8,9,10];
% 求累加和
cumsum(x)
% 求累加积
cumprod(x)

%% 标准差和相关系数
% 标准差有个两个计算公式，一个是除以N-1的(code为0)，另一个是除以N的(code为1)
% std(): 用于计算标准差
% 调用格式: 
% std(X): 计算向量X的标准差
% std(A): 计算矩阵A各列的标准差
% std(A,flag,dim): 一般格式，flag对应上面的code,表示标准差的计算法，dim为1,2同上
clear all
clc
x = randn(500,4);
y1 = std(x,0,1)
y2 = std(x,1,1)

% 相关系数
% corrcoef(A): 返回有矩阵A所形成的一个相关系数矩阵，其中，第i行第j列表示矩阵A的第i列和第j列的相关系数。
%              所以返回的是一个对称的方阵 阶数为A的列数
% corrcoef(X,Y): 返回一个标量，求X与Y之间的相关系数








