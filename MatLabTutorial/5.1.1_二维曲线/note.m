% plot函数:
%% 
% plot(x): x是一个向量，plot函数以x的index为横坐标，以x的值为纵坐标来绘图
% 当x是一个复数向量时，plot(x)将以x中元素的实部为横坐标，虚部为纵坐标来绘图
clear all
clc
% plot([1,0.5,2,1.5]);
x = [2.5, 3.5, 4,5];
y = [1.5,2,1,1.5];
cx = complex(x,y);% 构造一个复数
plot(x);
%%
clear all
clc
% plot(x,y)函数: 当x,y均为同维的向量时，以x为横坐标向量，y为纵坐标向量来绘图
%                当x是向量，y是矩阵时则表示同一个横坐标向量下要绘制多条曲线，即
%                如果矩阵y的列数等于x的长度，则将y的每一行视为纵坐标向量来绘制多条曲线;
%                如果矩阵y的行数等于x的长度，则将y的每一列是为纵坐标向量来绘制多条曲线
x = linspace(0,2*pi,100); % linspace(x1,x2,N)是用来产生起点为x1，终点为x2的100个点，并且相邻点的步长相同
y = [sin(x);sin(2.*x);sin(0.5.*x)]; % 这里y矩阵的列数与x的长度相同，故以y矩阵的每一行作为纵坐标向量来绘图
plot(x,y)
% plot(x,y)函数: 当x,y为同型的矩阵时，用x,y的每一列来表示横纵坐标向量
%%
clear all
clc
% plot(x1,y1,x2,y2,...,xn,yn)函数: 是含多个参数的plot函数，每一对x1,y1构成一组数据点的横纵坐标，绘制一条曲线
x1 = linspace(0,2*pi,10);
x2 = linspace(0,2*pi,50);
x3 = linspace(0,2*pi,100);
plot(x1,sin(x1),x2,sin(x2)+1,x3,sin(x3)+2);
%%
clear all
clc
% plot(x,y,option)函数: option包括三个方面: 线型，颜色，数据点标记
% 线型: "-": 实线；":":虚线；"-.":点划线；"--":双划线
% 颜色: "r": red "g":green "b": blue "w":white "k":black
% 数据点标记: "*": 星号 "o":圆圈 "s":方块 "p": 五角
x = 0:pi/50:2*pi; %采样的横坐标
y1 = 2*exp(-0.5.*x).*[-1,1]'; % 包络线的纵坐标
y2 = 2*exp(-0.5.*x).*sin(2*pi.*x); %实际函数的纵坐标
x1 = 0:0.5:6; % 取零点横坐标
y3 = 2*exp(-0.5.*x1).*sin(2*pi.*x1);
plot(x,y1,'k:',x,y2,'b--',x1,y3,'rp')
%%
clear all
clc
% 由于plot函数需要用户自己选择采样点，所以当函数图像十分依赖采样点的选择时，就不好用了
% 所以出现了 fplot 函数
% fplot的基本用法: fplot(f,lims,options),其中，f代表一个函数(一般用句柄定义),lims为x轴的
% 取值范围，用二元组表示: [xmin, xmax],options与plot相同
   %  fplot(@(x)sin(1/x),[0,pi/5],'b');
% fplot画参数方程确定的函数: fplot(funx,funy,tlims,options)
fplot(@(t)t.*sin(t), @(t)t.*cos(t), [0,20*pi],'b');






