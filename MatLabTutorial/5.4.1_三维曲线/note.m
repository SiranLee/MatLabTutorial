%% plot3 ����
% plot(x,y,z)
clear all
clc
x = [0.2,1.8,2.5];
y = [1.3,2.8,1.1];
z = [0.4,1.2,1.6];
plot3(x,y,z);
grid on;
axis([0,3,1,3,0,2]);
%% ʹ��plot3��������������
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
plot3(x(1:4:200),y(1:4:200),z(1:4:200)); % ֻȡ50�����ݵ�
grid on;
%% plot3(x,y,z)���������ı仯��ʽ
% ����x,y,z��ͬ�͵ľ�������Ϊ����������ÿһ�л���һ����ά���ߣ�һ������������ά����
% ����x,y,z�м�������Ҳ�о���: ����������������ʱ�����������Ҫ�����������ĳ��ȣ������������ʾ��ά���ߵ�����
%                             ��������������ʱ�����������Ҫ�����������ĳ��ȣ������������ʾ��ά���ߵ�����
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
%% plot3(x1,y1,z1,x2,y2,z2,....); �൱�ڰѾ����������

%% plot3����Ҳ����plot����������
clear all
clc
t = 0:pi/50:6*pi;
x = cos(t);
y = sin(t);
z = t;
plot3(x,y,z,'p');
xlabel('X');ylabel('Y');zlabel('Z');
grid on;

%% fplot3(funx,funy,funz,tlims) ��Ҫ���ڻ��������̵���ά����
% funx,funy,funz һ��ʹ�þ��������
%  tlims��ʾ����t��ȡֵ��Χ
clear all
clc
xt = @(t)exp(-t/10)*sin(5*t);
yt = @(t)exp(-t/10)*cos(5*t);
z = @(t)t;
fplot3(xt,yt,z,[-12,12]);





