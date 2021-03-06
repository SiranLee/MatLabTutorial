%% 曲线对象
% 使用line函数建立曲线对象: line(x,y,z,属性1,属性值1,属性2,属性值2,...); x,y,z存储数据点的坐标
% line函数与plot函数的区别是: line函数不会刷新坐标轴，所以不会清空已经画的图形
% 曲线对象的常用属性: Color,LineStyle,LineWidth,Marker,MarkerSize,XData,YData,ZData
clear all
clc
t = -0.1:0.1:2*pi;
x = cos(t); y=sin(t);
line(x,y,'Color','b');
line(x+1.2,y-1,'Color','y');
line(x+2.4,y,'Color','k');
line(x+3.6,y-1,'Color','g');
line(x+4.8,y,'Color','r');
ha = gca;
for i = 1:size(ha.Children)
    ha.Children(i).LineWidth = 5;
end
%ha.XLim = [-2,7];
%ha.YLim = [-3,2];
axis([-2,7,-3,2]);
axis equal;

%% 曲面对象
% 建立曲面对象使用surface函数，其调用格式为: 句柄变量=surface(x,y,z,c,属性1,属性值1,...);
% x,y,z存储数据点的坐标，与mesh,surf函数含义相同，c用于指定从z到颜色的映射
% 同样surface函数不会清空原有图形，在原来的图形上叠加绘制
% surface绘制的曲面，默认视点在图形正上方，即方位角为0，仰角为90
% 与曲面形态相关的属性: 
%     FaceColor: 定义曲面网格片的颜色，可取的值有: 'flat','interp','none','texturemap',
% 其中 flat 表示每一网格片用单一颜色填充; interp表示用渐变方式填充网格片; 
%     EdgeColor: 定义曲面网格线的颜色
clear all
clc
r = linspace(0,2*pi,60);
[u,v] = meshgrid(r);
x = (8+3.*cos(v)).*cos(u);
y = (8+3.*cos(v)).*sin(u);
z = 3*sin(v);
% 设置方位角 该操作应该在surface之前
axes('view',[-37.5,30]);
ha = surface(x,y,z); % ha是该三维图形的句柄
axis equal;
grid on;
ha.EdgeColor = 'none';
ha.FaceColor = 'interp';

%% 光照处理 略






