%% 
%% ���ֶ�������ͼ
% semilogx(x,y) y�����겻�䣬��xȡ������10Ϊ�ף�
% semilogy(x,y) x�����겻�䣬��yȡ����
% loglog(x,y) x�ᣬy���ȡ����
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

%% ������ͼ
% polar(theta,rho,ѡ��) thetaΪ���ǣ�rhoΪ������ѡ��������ͣ���ɫ�ȣ���plot��ͬ
theta = 0:pi/100:2*pi;
r = 1-sin(theta);
subplot(1,2,1);
polar(theta,r,'b');
subplot(1,2,2);
polar(theta-pi/2,r,'b');

%% ͳ����ͼ
%% ����ͼ
% bar������barh����
% bar(y,style): ��y������ֵΪ�������ĸ߶ȣ�indexΪ�����ꣻstyle: 'grouped','stacked'
% bar(x,y,style): x�Ǻ�����
clear all
clc
x = [2015,2016,2017];
y = [68,80,115;75,88,102;81,86,125];
subplot(1,2,1);
bar(y);% Ĭ�� grouped
title('Grouped');
subplot(1,2,2);
bar(x,y,'stacked');
title('Stacked');

%% ֱ��ͼ
% ֱ��ͼ������ͼ�ǲ�һ���ģ�����ͼֻ�Ǽ򵥷�ӳ�����ݵĶ��٣���ֱ��ͼ������һ����������ݵĸ���
% ���ֱ��ͼһ���̶��Ϸ�ӳ����������ķֲ�
% hist������rose����
% hist����: hist(y),hist(x,y);
% hist(y): ��y�е����ݽ���ͳ�ƣ��Զ���������(y�������Сֵ�����ֵȾ�����)����ͳ��y���������ڸ�������ĸ���
% hist(y,x): y��ͳ�Ƶ����ݣ�x��ָ�����仮�ֵķ�ʽ����x�Ǳ��������ʾ���ֳ�x�����䣻��x��������
% x�е�ÿһ��Ԫ��������ʾÿһ����������ĵ㣬x�ĳ���Ϊ���ݷ���ĸ���
clear all
clc
y = randn(500,1);
subplot(3,1,1);
hist(y);
title('Gaussian Distribution')
subplot(3,1,2);
% ���ֳ�31�����䣬ÿ����������ĵ�����
x = -3:0.2:3;
hist(y,x);
title('Gaussian Distribution with Determined Center');
y2 = rand(500,1);
subplot(3,1,3);
hist(y2);
title('Random Distribution');

%% ֱ��ͼ��rose����(õ��ͼ)
% rose(theta,x): theta ����ȷ��ÿһ��������ԭ��ĽǶ�,x����ָ������Ļ��ַ�ʽ
clear all
clc
y = randn(500,1);
theta = y*pi; % ת��Ϊ����
rose(theta);

%% �����ͼ��
% ��ͼ: pie; ���ͼ: area����ʵ���Ƕ�plot����ͼ����·���ɫ)
% pie(x,explode): x��Ҫͳ�Ƶ����ݣ�explode��һ��binary��������������x��ͬ��ָ����Щ��������
x = [31,25,43,70];
explode = [0,1,0,0];
pie(x,explode);

%% ɢ����ͼ��
% scatter������stairs������stem����
clear all
clc
t = 0:pi/50:2*pi;
x = 16*sin(t).^3;
y = 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t);
subplot(1,2,1);
scatter(x,y,'rd','filled'); % x,yָ�����λ�ã�rdָ������Ϊ��ɫdiamond��filledָ��diamond�Ƿ�յģ�������ɫ
subplot(1,2,2);
fplot(@(t)16*sin(t).^3,@(t)13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t),[0,2*pi]);

%% ʹ��quiver����������ʸ��ͼ
% quiver(x,y,u,v): ����(x,y)��ʸ����㣬(u,v)��ʸ���յ㣬x,y,u,v��ͬ����С��������ͬ�;���
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





