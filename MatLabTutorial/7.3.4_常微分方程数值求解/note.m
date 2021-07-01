%% 一般求解的是常微分方程在某些个给定初值下的解
% [t,y] = solver(filename,tspan,y0,option)
% 其中，t和y分别给出时间向量和相应的数值解，而对应的常微分方程的解则有t和y所确定的函数曲线决定
% filename是所定义的函数(用来表示出微分的函数),该函数必须返回一个列向量
% tspan形式为[t0,tf],表示求解的区间。y0表示初始状态向量。
% Option是可选参数，用于设置求解属性，如设置相对误差值 ReTol(默认为1e-3)和绝对误差值AbsTol(默认值为1e-6)

%% 常微分方程数值求解函数的统一命名格式
% odenxx(): Ordinary Differential Equation 参数格式同solver
% nn 是数字，代表所使用的方法的阶数，例如，ode23采用2阶龙格-库塔算法，并使用3阶公式做误差估计来调节步长，具有低等精度
%           而ode45具有中等精度
% xx是字母，用于标注方法的专门特征，例如，ode15s中的s表示stiff,主要适用于求解刚性方程
clear all
clc
f = @(t,y) (y^2-t-2)/(4*(t+1)); % 定义filename所指的函数 f(t,y)
[t,y] = ode23(f,[0,10],2); % 进行上述微分方程的数值求解
y1 = sqrt(t+1)+1;
plot(t,y,'b:',t,y1,'r');
%% 求解高阶常微分线性方程组（以二阶为例）
% 由于ode只能用于求解一阶的常微分方程，所以在求解高阶常微分线性方程组时，需要将高阶的方程转化为一阶的方程
% 这个步骤可以通过换元来做到
clear all
clc
% 这里x(2)是x(1)的导，而x(1)的导又是x(2)的导的-2倍
f = @(t,x) [-2,0;0,1]*[x(2);x(1)]; % 采用矩阵乘，转为线性方程组的形式
[t,x] = ode45(f,[0,20],[1,0]); % 这里初值的顺序为:[x(1),x(2)];
% 结果中的x有两列，分别对应x(1)和x(2)
subplot(2,2,1); plot(t,x(:,2));
subplot(2,2,2); plot(x(:,2),x(:,1));

%% 刚性问题(stiff)
% 刚性问题是指这样的一类常微分方程求解的问题: 其解的分量有的变化很快，有的变化很慢，且相差悬殊
% 刚性问题使用刚性解法会更节约时间
clear all
clc
lamda = 0.01;
f = @(t,y) y^2-y^3;
tic;
[t,y] = ode45(f,[0,2/lamda],lamda);
toc;
disp(['ode45计算的点数: ' num2str(length(t))]);
% 现在改变lamda的值，看看结果
lamda2 = 1e-5;
tic;
[t2,y2] = ode45(f,[0,2/lamda2],lamda2);
toc;
disp(['ode45计算的点数: ' num2str(length(t2))]);
% 这时常微分方程表现出刚性
tic;
[t3,y3] = ode15s(f,[0,2/lamda2],lamda2); % 采用专门的刚性解法，计算时间大大减少
toc;
disp(['ode45计算的点数: ' num2str(length(t3))]);


