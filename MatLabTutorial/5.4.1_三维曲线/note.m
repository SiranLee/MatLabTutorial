%% plot3 函数
% plot(x,y,z)
clear all
clc
x = [0.2,1.8,2.5];
y = [1.3,2.8,1.1];
z = [0.4,1.2,1.6];
plot3(x,y,z);
grid on;
axis([0,3,1,3,0,2]);
%% 使用plot3函数绘制螺旋线
clear all
clc
t = linspace(0,10*pi,200);
x = sin(t)+t.*cos(t);
y = cos(t)-t.*sin(t);
z = t;
subplot(1,2,1);
plot3(x,y,z);
grid on;
subplot(1,2,2);
plot3(x(1:4:200),y(1:4:200),z(1:4:200)); % 只取50个数据点
grid on;
%% plot3(x,y,z)函数参数的变化形式
% 参数x,y,z是同型的矩阵，以列为坐标向量，每一列画出一个三维曲线，一共有列数条三维曲线
% 参数x,y,z中既有向量也有矩阵: 当向量是行向量的时，矩阵的列数要等于行向量的长度，矩阵的行数表示三维曲线的条数
%                             当向量是列向量时，矩阵的行数要等于列向量的长度，矩阵的列数表示三维曲线的条数
clear all
clc
t = 0:0.01:2*pi;
t = t';
x = [t,t,t,t,t];
y = [sin(t),sin(t)+1,sin(t)+2,sin(t)+3,sin(t)+4];
z = [t,t,t,t,t];
subplot(1,2,1);
plot3(x,y,z);
grid on;
subplot(1,2,2);
y_2 = [sin(t),sin(t)+1,sin(t)+2,sin(t)+3,sin(t)+4];
plot3(t,y_2,t);
grid on;
%% plot3(x1,y1,z1,x2,y2,z2,....); 相当于把矩阵拆解出来了

%% plot3函数也有像plot函数的属性
clear all
clc
t = 0:pi/50:6*pi;
x = cos(t);
y = sin(t);
z = t;
plot3(x,y,z,'p');
xlabel('X');ylabel('Y');zlabel('Z');
grid on;

%% fplot3(funx,funy,funz,tlims) 主要用于画参数方程的三维曲线
% funx,funy,funz 一般使用句柄来定义
%  tlims表示参数t的取值范围
clear all
clc
xt = @(t)exp(-t/10)*sin(5*t);
yt = @(t)exp(-t/10)*cos(5*t);
z = @(t)t;
fplot3(xt,yt,z,[-12,12]);





