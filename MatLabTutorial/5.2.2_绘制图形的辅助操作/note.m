%% 图形标注
%% title():
%     用法1: 直接跟一个字符串
%     用法2: 用大括号括起多个字符串 title({'标题1','标题2'}) 表示换行的标题
%     用法3: 使用LeTax格式的控制符来标题，使用latex的部分需要用大括号括起来: title('y = cos{\omega}t')
%     用法4: 含属性设置的标题: title('标题'，属性名，属性值)
%            Color 属性: title('标题','Color','r') 颜色属性值同plot的
%            FontSize 属性: title('标题','FontSize',24)

%% xlabel() & ylabel()
%     用法: 直接跟字符串，可以出现latex的控制字符

%% text函数 用于给图像加标注
% text(x,y,说明), 说明中可以出现latex控制字符
x = linspace(0,2*pi,100);
plot(x, sin(x))
text(0,0,'start')
text(5/6*pi,0.6,'\leftarrow sin(x)')

%% legend() 函数 加图例



%% 坐标控制
%% axis函数 用于控制x轴和y轴的范围: axis([xmin,xmax,ymin,ymax])
%          axis equal: 纵，横坐标采用等长刻度 单位元是一个正方形
%          axis off: 取消坐标轴
%          axis on: 显示坐标轴
x = 0:0.05:2*pi;
plot(sin(x),cos(x),'b')
axis([-2,2,-2,2]);
grid on % 开启网格，grid off 关闭网格 axis和grid在plot后调用，理解为画好图像后才上网格
box off % 关闭边框，box on 开启边框
axis equal

%% 图形保持
%% 由于matlab绘图时会自动覆盖前一次画的图像，所以需要在一个图像窗口中画多次图像时可以使用
% hold on 命令来让matlab避免覆盖之前一次画的图像
clear all
clc
x = 0:0.05:2*pi;
e = ones(1,length(x));
plot(x,sin(x),'r-.');
hold on % 用在画了一次之后
plot(x,cos(x),'b:');
hold on
plot(x,e,'g');
axis([0,2*pi,-2,2]);


%% 图形窗口的分割
%% subplot(m,n,p) 其中，将一个图像窗口分割成m行n列的图形矩阵，p指的是当前活动区
subplot(1,2,1);
x = 0:0.05:2*pi;
plot(x,sin(x),'r-.');
axis([0,2*pi,-2,2]);
subplot(1,2,2);
plot(x,cos(x),'b-');
axis([0,2*pi,-2,2]);

%% 多个图形窗口 figure(n) 函数
%%
figure(1)
x = 0:0.05:2*pi;
plot(x,sin(x),'r-.');
axis([0,2*pi,-2,2]);
figure(2)
x = 0:0.05:2*pi;
plot(x,cos(x),'r-.');
axis([0,2*pi,-2,2]);



