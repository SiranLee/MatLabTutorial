%% matlab的图形修饰处理主要包括: 视点处理；色彩处理；图形的裁剪处理
%% 视点处理
% 视点有两个参数确定(方位角，仰角) 记住PPT上的图模型
% 方位角: 视点与原点的连线在xy面上的投影与y轴负方向的夹角，为负时为顺时针，为正时为逆时针旋转xy平面
% 仰角: 视点与原点的连线与xy面所成角的大小，仰角为正表示视点在xy面上方，仰角为负表示视点在xy面下方
% matlab中使用view函数来调整视点: view(az,el)
% 其中az表示方位角，el表示仰角，单位都是度(默认方位角为-37.5度(偏y轴正方向)，仰角为30度)
[x,y] = meshgrid(0:0.1:2,1:0.1:3);
z = (x-1).^2+(y-2).^2;
subplot(2,2,1);
surf(x,y,z);
title('默认角度');
subplot(2,2,2);
surf(x,y,z);
title('方位角0度，仰角90度')
view(0,90);% 方位角0度，仰角90度，看的是xy面
grid on;
subplot(2,2,3);
surf(x,y,z);
view(90,0);% 方位角90度，仰角0度，看的是yz面(方位角是90度的倍数，仰角为0时，看的都是xz或者yz面)
title('方位角90度，仰角0度');
ylabel('y-axis');
zlabel('z-axis');
grid on;
subplot(2,2,4);
surf(x,y,z);
view(-45,-60);% 方位角-45度，仰角-60度
title('位角-45度，仰角-60度');
grid on;

%% 色彩处理
% matlab中的颜色用一个三元组表示，[R,G,B]，各分量的取值范围是0--1
% matlab在进行绘图时使用的是默认的 parula色图(可以理解为调色盘),还有其他的色图
clear all
clc
maps = ["hot","hsv","summer","spring"];
for i = 1:length(maps)
    subplot(2,2,i);
    surf(peaks);
    colormap(maps(i)); % 一个figure图窗只能用一个colomap
    title(maps(i));
end

%% 图形的裁剪处理
% 原理: 将图形中需要裁剪部分对应的函数值设置为NaN就可以在绘制时，使得函数值为NaN的部分不显示出来，从而达到裁剪图形的目的
%% 绘制3/4圆
clear all
clc
t = linspace(0,2*pi,50);
x = sin(t);
y = cos(t);
p = y>0.5; % p是与y相同大小的向量，对于符合条件的元素做1标记，不符合条件的元素做0标记
y(p) = NaN; % 将y中与p中1的位置对应的元素设为NaN;
plot(x,y);
axis([-1.1,1.1,-1.1,1.1]);
axis equal;
%% 绘制3/4球
clear all
[x,y,z] = sphere(60);
z(z>0.5) = NaN;
surf(x,y,z);
axis([-1,1,-1,1,-1,1]);
axis equal;
view(-37.5,10);












