%% 
%% 三种对数坐标图
% semilogx(x,y) y轴坐标不变，对x取对数（10为底）
% semilogy(x,y) x轴坐标不变，对y取对数
% loglog(x,y) x轴，y轴均取对数
x = 0:0.1:10;
y = 1./x;
subplot(2,2,1);
plot(x,y);
title('plot')
grid on;
subplot(2,2,2);
semilogx(x,y);
hold on;
title('semilogx')
grid on;
subplot(2,2,3)
semilogy(x,y);
title('semilogy')
grid on;
subplot(2,2,4)
loglog(x,y);
title('loglog')
grid on;

%% 极坐标图
% polar(theta,rho,选项) theta为极角，rho为极径，选项包括线型，颜色等，与plot相同
theta = 0:pi/100:2*pi;
r = 1-sin(theta);
subplot(1,2,1);
polar(theta,r,'b');
subplot(1,2,2);
polar(theta-pi/2,r,'b');

%% 统计类图
%% 条形图
% bar函数，barh函数
% bar(y,style): 以y向量的值为矩形条的高度，index为横坐标；style: 'grouped','stacked'
% bar(x,y,style): x是横坐标
clear all
clc
x = [2015,2016,2017];
y = [68,80,115;75,88,102;81,86,125];
subplot(1,2,1);
bar(y);% 默认 grouped
title('Grouped');
subplot(1,2,2);
bar(x,y,'stacked');
title('Stacked');

%% 直方图
% 直方图和条形图是不一样的，条形图只是简单反映了数据的多少；而直方图是落在一个区间的数据的个数
% 因此直方图一定程度上反映了随机变量的分布
% hist函数和rose函数
% hist函数: hist(y),hist(x,y);
% hist(y): 对y中的数据进行统计，自动划分区间(y中最大最小值来划分等距区间)，来统计y中数据落在各个区间的个数
% hist(y,x): y是统计的数据，x是指定区间划分的方式，若x是标量，则表示划分成x个区间；若x是向量，
% x中的每一个元素用来表示每一个区间的中心点，x的长度为数据分组的个数
clear all
clc
y = randn(500,1);
subplot(3,1,1);
hist(y);
title('Gaussian Distribution')
subplot(3,1,2);
% 划分成31个区间，每个区间的中心点如下
x = -3:0.2:3;
hist(y,x);
title('Gaussian Distribution with Determined Center');
y2 = rand(500,1);
subplot(3,1,3);
hist(y2);
title('Random Distribution');

%% 直方图的rose函数(玫瑰图)
% rose(theta,x): theta 用于确定每一个区间与原点的角度,x用来指定区间的划分方式
clear all
clc
y = randn(500,1);
theta = y*pi; % 转化为弧度
rose(theta);

%% 面积类图形
% 饼图: pie; 面积图: area（其实就是对plot函数图像的下方着色)
% pie(x,explode): x是要统计的数据，explode是一个binary的向量，长度与x相同，指定哪些块分离出来
x = [31,25,43,70];
explode = [0,1,0,0];
pie(x,explode);

%% 散点类图形
% scatter函数，stairs函数，stem函数
clear all
clc
t = 0:pi/50:2*pi;
x = 16*sin(t).^3;
y = 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t);
subplot(1,2,1);
scatter(x,y,'rd','filled'); % x,y指明点的位置，rd指明线型为红色diamond，filled指明diamond是封闭的，对其着色
subplot(1,2,2);
fplot(@(t)16*sin(t).^3,@(t)13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t),[0,2*pi]);

%% 使用quiver函数来绘制矢量图
% quiver(x,y,u,v): 其中(x,y)是矢量起点，(u,v)是矢量终点，x,y,u,v是同样大小的向量或同型矩阵
A = [4,5]; B = [-10,0]; C = A+B;
hold on;
quiver(0,0,A(1),A(2));
quiver(0,0,B(1),B(2));
quiver(0,0,C(1),C(2));
text(A(1),A(2),'A');
text(B(1),B(2),'B');
text(C(1),C(2),'C');
axis([-12,6,-1,6]);
hold on;





