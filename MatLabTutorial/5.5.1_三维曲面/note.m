%% 三维曲面的绘制一般需要经过两步: 
%  1. 将坐标转化为网格坐标
%  2. 使用绘制三维曲面的函数进行曲面绘制

%% 生成平面的网格数据(生成平面的网格坐标矩阵)
% 将一个平面区域按照单位划分成若干个小矩形，然后使用两个矩阵分别存储构成这个平面区域的
% 小矩形横坐标和纵坐标，对应的矩阵就称为该矩形区域的基于xy平面的网格坐标矩阵
% 你要画一个三维曲面，你至少得有两个自变量吧(参数方程的情况另说)，但是一般变量都是
% 向量，要将其转化为网格坐标矩阵有两种方法: 1. 自己手动转； 2. 使用matlab函数提供的meshgrid来转
% 1. 自己手动转:
x = 2:6; % x自变量的范围,是一个行向量
y = (3:8)';% y自变量的范围，这一个要列为列向量
X = ones(size(y))*x; % 列向量乘行向量得到矩阵，这个矩阵每一列表示同一个x坐标
Y = y*ones(size(x)); % 列向量乘行向量得到矩阵，这个矩阵每一行代表一个y坐标
% 2. 使用meshgird函数来建立网格坐标矩阵
[Z,W] = meshgrid(x,y);% Z,W分别是建立的对应于x,y的网格坐标矩阵
Z == X
W == Y

%% 网格矩阵的三维曲线的关系
% 本着 线动成面 的原则，我们还是先来看看网格矩阵与三维曲线的关系
% 根据得出的自变量的网格矩阵，然后根据网格矩阵中每一个(x,y)，通弄已定的函数关系计算出函数值的矩阵Z
% 矩阵X,Y,Z中的每一个列向量单拎出来组成x,y,z的一个向量组，就得到了在同一个x坐标下的不同y的函数值z
% 说成人话就是 x 固定，在x固定的yz面上的一条曲线
clear all
clc
x = 2:6;
y = (3:8)';% 这里y一定要是函数值
[X,Y] = meshgrid(x,y);
Z = randn(size(X));
plot3(X,Y,Z); % 这里产生5条空间曲线，因为有5个x的坐标
grid on;

%% 网格点到线的旅程已经结束，现在可以开始从线到面的旅程了
% matlab使用mesh函数和surf函数来绘制基于网格点坐标矩阵的三维曲面
% mesh(x,y,z,c): x,y是网格矩阵，z是对应的函数值矩阵，c是用于指定函数值到颜色的映射，缺省时颜色正比于函数值大小(函数值越大，颜色越趋于红色(暖色))
% mesh函数不对曲面着色
% surf(x,y,z,c): 同上
% surf函数对曲面着色
clear all
clc
t = -2:0.1:2;
[X,Y] = meshgrid(t);% 这里x和y的坐标范围相同，所以只使用一个参数来产生X,Y网格坐标矩阵
Z = X.*exp(-X.^2-Y.^2);
subplot(1,2,1);
mesh(X,Y,Z);
grid on;
title('mesh');
xlabel('x-axis');
subplot(1,2,2);
surf(X,Y,Z);
grid on;
title('surf');
% 当然当X,Y缺省时，Z矩阵需要是应该是三行的，第一行是X，第二行是Y,第三行是Z

%% 以上的两个函数是最主要的两个三维曲面绘制函数
% 其他还包括以下的三维曲面绘制函数
% 带等高线的: meshc
% 带底座的: meshz
% 带等高线的并着色的: surfc
% 具有光泽效果的: surfl
[x,y] = meshgrid(0:0.1:2,1:0.1:3);
z = (x-1).^2+(y-2).^2-1;
subplot(2,2,1);
meshc(x,y,z);title('meshc:带等高线的');
subplot(2,2,2);
meshz(x,y,z);title('meshz:带底座的');
subplot(2,2,3);
surfc(x,y,z);title('surfc:带等高线并着色的');
subplot(2,2,4);
surfl(x,y,z);title('surfl:有光泽效果的');


%% matlab还提供一些话标准三维曲面的函数用来画诸如圆锥，圆柱，球等的三维面
%% [x,y,z] = sphere(n) 产生三个n+1阶的方阵x,y,z，使用这些个方阵可以画出圆心在顶点，半径为1的单位球
clear all
clc
[x,y,z] = sphere();% 默认是20
surf(x,y,z);
axis equal
%% [x,y,z] = cylinder(R,n) 参数R是一个向量(如果是一个标量，则表示是一个圆柱)，
%  R存放柱面各个高度上的半径(也就是截面半径,利用这个可以用来画圆锥，沙漏等三维曲面)
%  n表示在圆柱圆周上有n个间隔点，默认20个(可以将n视为曲面的光滑度，越大越光滑，但是性能越低)
%  x,y,z是三个矩阵，矩阵的列数就是间隔点的数目加一，矩阵的行数是不同截面半径的数目
clear all
clc
[x1,y1,z1] = cylinder();% 这里z1的值要不就是0要不就是1,因为圆柱上不存在其他的不同截面的半径，故这两个值就够了
subplot(1,3,1);
surf(x1,y1,z1);
title('圆柱');
t = linspace(0,2*pi,40);
[x2,y2,z2] = cylinder(2+cos(t),30);% 这里z2的值就要t的长度那么多个了，因为他不是像圆柱那样的，它每一点处的截面半径都不同，所以都要指示出来，所以有t的长度那么多行
subplot(1,3,2);
surf(x2,y2,z2);
title('花瓶');
t2 = [2:-0.2:0];
t2 = [t2,0.2:0.2:2];
[x3,y3,z3] = cylinder(t2,30);
subplot(1,3,3);
surf(x3,y3,z3);
title('沙漏');
%% 用cylinder绘制两个相互垂直且直径相等的圆柱面的相交图形
clear all
clc
[x,y,z] = cylinder(1,60);
z = [-1.*z(2,:);z(2,:)];% 将圆柱的高度扩大到-1到1
surf(x,y,z);
hold on;
surf(y,z,x);
axis equal;
%% 使用fmesh 和 fsurf 函数来绘制参数方程定义的曲面
% fsurf(funx,funy,funz,uvlims)
% fmesh(funx,funy,funz,uvlims)
% 这里uvlims表示两个参数的取值范围: [umin,umax,vmin,vmax];
clear all
clc
funx = @(u,v) u.*sin(v);
funy = @(u,v) -u.*cos(v);
funz = @(u,v) v;
fsurf(funx,funy,funz,[-5,5,-5,2]);
hold on;
fmesh(funx,funy,funz,[-5,5,-2,2]);
hold off;











