%% 图形对象的句柄
% 句柄: 在matlab中每一个图形都是由若干个不同的图形对象组成的，使用句柄来标识这些对象，通过句柄来访问这些对象的属性
clear all
clc
t = 0:pi/10:2*pi;
h1 = plot3(t+pi,t-2*pi,sin(t),'r'); % h1是该空间曲线的句柄
hold on;
[x,y] = meshgrid(t);
z = sin(x);
h2 = mesh(x-2*pi,y,z);% h2 是该空间曲面的句柄
[x3,y3,z3] = cylinder(t);
h3 = surf(x3,y3,z3);% h3是圆锥曲面的句柄
% 可以通过点运算来访问和设置句柄中的属性值,改变基本上实时发生
% 获取特定图形对象的句柄函数
% gcf(graph current figure): 获取当前图形窗口的句柄
% gca:(graph current axis): 获取当前坐标轴的句柄
% gco(graph current object): 获取最近被选中的图形对象的句柄
% findobj: 按照指定的属性来获取图形对象的句柄
% 图形对象的属性:
%    Children属性: 该对象的所有子对象的句柄组成的一个向量  重复画图形会Children的某些向量元素会重复
%    Parent属性: 该对象的父对象的句柄
%    Type属性: 对象的类型，这是一个只读属性
%    Tag属性: 用于给对象定义一个标识符
%%
clear all
clc
subplot(1,2,1); 
h1 = fplot(@(t)t.*sin(t),@(t)t.*cos(t),[0,6*pi]);
axis equal
subplot(1,2,2); [x,y,z] = peaks(20);
h2 = mesh(x,y,z);
h1_p = h1.Parent;
h1_p.Color = 'y'; % 设置坐标平面的颜色
h2.Parent.Color = 'cyan'; % 设置坐标平面的颜色为青色

%% 图形窗口的操作
% 建立图形窗口对象
%    句柄=figure(属性1,属性值1,..)
%    句柄=figure 按照matlab默认的属性值建立图形窗口
%    figure(窗口句柄) 设置该句柄对应的窗口为当前窗口



%% 坐标轴对象的操作
% 建立坐标轴对象
%    句柄=axes(属性1,属性值1,...)
%    句柄=axes
%    axes(句柄变量)








