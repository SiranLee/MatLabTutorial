%%
% 复数可以通过乘以 e^(i*theta)来将这个复数绕参考点逆时针旋转theta弧度
% 如: (a+bi)*e^itheta
% 而实数旋转可以通过将实数平面转化为复数平面用复数的旋转方式；
% 也可以用线性映射，这里旋转的线性映射的形式为: [cos(theta) sin(theta);-sin(theta) cos(theta)];
% 通过欧拉公式我们可以写出复数的极坐标形式:
% z = x+yi = r(cos(theta)+i*sin(theta)) = r*e^(i*theta)
% 这里r是z的模长，可以通过abs(z)求出，而theta可以通过angle(z)求出
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
mu = mean(z(1:end-1)); % 多边形的中心点
hold on
dot2dotz(mu);
axis([-1.5 1.5 -.5 4.0]);
axis equal
theta = 0:pi/20:2*pi;
z = exp(i*theta).'*(z-mu)+mu;% 以中心点为参考点(z-mu)，绕中心点旋转,然后再还原到以原点为参考点(+mu)
% 这里注意如果直接对一个复数矩阵A进行A'操作，实际上得到的是A的共轭转置(即既转置了还对每一个元素求了共轭),
% 使用A.'来对一个复数矩阵进行朴素转置
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
z = exp(i*2*pi*(0:n)'/n); % 复数的极坐标表示，theta为正n边形圆心角，极径为1
plot(z,'-o');
axis square
s = sum(z);

%%






