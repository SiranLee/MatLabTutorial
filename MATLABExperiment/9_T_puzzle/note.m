%%
% ��������ͨ������ e^(i*theta)������������Ʋο�����ʱ����תtheta����
% ��: (a+bi)*e^itheta
% ��ʵ����ת����ͨ����ʵ��ƽ��ת��Ϊ����ƽ���ø�������ת��ʽ��
% Ҳ����������ӳ�䣬������ת������ӳ�����ʽΪ: [cos(theta) sin(theta);-sin(theta) cos(theta)];
% ͨ��ŷ����ʽ���ǿ���д�������ļ�������ʽ:
% z = x+yi = r(cos(theta)+i*sin(theta)) = r*e^(i*theta)
% ����r��z��ģ��������ͨ��abs(z)�������theta����ͨ��angle(z)���
z = 3+4*i;
r = abs(z);
theta = angle(z);
w = r*exp(i*theta);

%%
clear all
clc
figure;
z = [0 1 1+2i 3i 0];
line(real(z),imag(z),'color','red');
mu = mean(z(1:end-1)); % ����ε����ĵ�
hold on
dot2dotz(mu);
axis([-1.5 1.5 -.5 4.0]);
axis equal
theta = 0:pi/20:2*pi;
z = exp(i*theta).'*(z-mu)+mu;% �����ĵ�Ϊ�ο���(z-mu)�������ĵ���ת,Ȼ���ٻ�ԭ����ԭ��Ϊ�ο���(+mu)
% ����ע�����ֱ�Ӷ�һ����������A����A'������ʵ���ϵõ�����A�Ĺ���ת��(����ת���˻���ÿһ��Ԫ�����˹���),
% ʹ��A.'����һ�����������������ת��
line(real(z.'),imag(z.'),'color','green');

%% 
z1 = i;
z2 = -4;
z3 = 3-4i;
w1 = abs(z1)*exp(i*angle(z1));
w2 = abs(z2)*exp(i*angle(z2));
w3 = abs(z3)*exp(i*angle(z3));
w4 = exp(i*pi);
w5 = exp(i*pi/3);
w6 = exp(3);
z4 = cos(pi)+i*sin(pi);
z5 = cos(pi/3)+i*sin(pi/3);
z6 = cos(-3i)+i*sin(-3i);


%%
clear all
clc
n = 20;
z = exp(i*2*pi*(0:n)'/n); % �����ļ������ʾ��thetaΪ��n����Բ�Ľǣ�����Ϊ1
plot(z,'-o');
axis square
s = sum(z);

%%






