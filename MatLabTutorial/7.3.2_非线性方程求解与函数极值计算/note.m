%% 非线性方程求解
%% 对于单变量的非线性方程求解
% fzero函数: x = fzero(filename,x0)
%    这里filename表示待求根方程左端的函数表达式(可以使用匿名函数定义),x0是初始值
clear all
clc
f = @(x) x-1./x+5;
x = fzero(f,-5);
x2 = fzero(f,1);
fplot(f,[-6,2],'r');
hold on;
line([-6,2],[0,0],'Color','blue');
hold on;
plot(x,0,'k*',x2,0,'k*');
axis([-6,2,-10,10]);
% x0选择得不同，得出的解有时会有一些counterintuitive,所以要学会仔细辨别
%%
clear all
clc
f = @(x) x.^2-1
x = [];
x0 = -0.25:0.001:0.25;
for x00=x0
    x = [x,fzero(f,x00)];
end
plot(x0,x,'o');

%% 对于非线性方程组的求解
% fsolve函数: x = fsolve(filename,x0,option)
% 这里filename和x0的含义同上，option是用于设置优化工具箱的优化参数，可以调用optimset函数来完成
clear all
clc
f = @(x) x-1./x+5;
x = fsolve(f,-5,optimset('Display','off')); % 这里 Display: off 表示不显示中间数值搜索的过程
x2 = fsolve(f,0.01,optimset('Display','off')); % 这里fzero函数算不出来的根，fsolve算出来了
%% 
clear all
clc
% 定义待解方程组的匿名函数
f = @(x) [sin(x(1))+x(2)+x(3)^2*exp(x(1)),x(1)+x(2)+x(3),x(1)*x(2)*x(3)]; % 这里参数x表示未知数向量，用一个向量来表示方程向量
% 计算f在(1,1,1)处的值
f([1,1,1]);
x = fsolve(f,[1,1,1],optimset('Display','off'));
f(x)


%% 函数极值的计算
% matlab中只是计算某个区间内的最小值(极小值),而关于最大值的计算可以通过求 -f(x) 的最小值来求解
%% 无约束的最优化问题
% 无约束情况下求解最小值的函数为: 
% [xmin,fmin] = fminbnd(filename,x1,x2,option)  这里x1,x2表示所研究区间的左右边界
% [xmin,fmin] = fminsearch(filename,x0,option)
% [xmin,fmin] = fminunc(filename,x0,option) 这里以及上面的x0表示向量，代表极值点的初值
% 其中，xmin表示极小值点，fmin表示最小值，filename表示定义的目标函数，option为优化参数，可以通过optimset来设置
clear all
clc
f = @(x) x-1./x+5;
[xmin,fmin] = fminbnd(f,-10,-1,optimset('Display','off'));
xmin
fmin
[xmin2,fmin2] = fminbnd(f,1,10,optimset('Display','off'));
xmin2
fmin2

%% 有约束最优化问题
% 这里约束条件可以分为: 线性不等式约束，线性等式约束; 非线性不等式约束，非线性等式约束; x的上下界(upper bound, lower bound)
% [xmin,fmin] = fmincon(filename,x0,A,b,Aeq,beq,Lbnd,Ubnd,NonF,option)
% 这里xmin，fmin,filename,x0,option意义与上面相同。
% A表示线性不等式的系数矩阵，b表示线性不等式的常量矩阵
% Aeq表示线性等式的系数矩阵，beq表示线性等式的常量矩阵
% Lbnd,Ubnd分别表示x的上下界，是一个矩阵
% NonF是非线性等式，需要通过定义函数文件，使用函数文件名
% 如果某个约束不存在，用空矩阵来表示
clear all
clc
t1 = 0:0.1:2;
t2 = 0:0.1:2;
[T1,T2] = meshgrid(t1,t2);
Z = 0.4.*T2+T1.^2+T2.^2-T1.*T2+1/30.*T1.^3;
f = @(x) 0.4.*x(2)+x(1).^2+x(2).^2-x(1).*x(2)+1/30.*x(1).^3;
x0 = [0.5;0.5];% 列向量x0表示极值点的初始值
A = [-1,-0.5;-0.5,-1]; % 线性不等式的系数矩阵，这里要将所有大于等于转化为小于等于(下同)，所以乘上-1
b = [-0.4;-0.5];
lb = [0;0];
option = optimset('Display','off');
[xmin,fmin] = fmincon(f,x0,A,b,[],[],lb,[],[],option);
surf(T1,T2,Z);
hold on;
plot3(xmin(1),xmin(1),fmin,'ro');
hold on;
surf(T1,T2,T1+T2.*0.5-0.4);
hold on;
surf(T1,T2,T2+T1.*0.5-0.5);
axis([0,2,0,2,0,6]);

%% 
clear all
clc
a=[10,30,16.667,0.555,22.2221];
b=[10,50,29,29.888,49.988];
c=[10,18,20,14,25];
f=@(x) sum(c.*sqrt((x(1)-a).^2+(x(2)-b).^2));
[xmin,fmin]=fmincon(f,[15,30],[],[],[],[],[],[],'funny')






