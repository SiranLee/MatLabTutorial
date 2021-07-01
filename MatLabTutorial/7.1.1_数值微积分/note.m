%% 数值微分
% 这里使用数值的意思是，函数本身的表达式未知(如果已知，可以使用符号函数进行求解)，只有离散的函数的值，所以通过
% 数值计算的方式来计算函数的导数
% 微分与差分相近，使用差分代替微分；导数与差商相近，使用差商代替导数
% 向前差分: 上delta_f = f(x+h)-f(x);
% 向后差分: 下delta_f = f(x)-f(x+h);
% matlab提供了求向前差分的函数 diff,其调用格式有三种:
% dx = diff(X): 计算向量X的差分，dx是一个向量，维度比X少1, dx(i) = X(i+1)-X(i) i=1,2,3,...,n-1
% dx = diff(x,n): 计算向量的X的n阶差分，例如 diff(x,2)=diff(diff(x))
% dx = diff(A,n,dim): 计算矩阵A的n阶差分，dim=1时(默认状态)按列计算，dim=2时按行计算，dx是一个矩阵，行数或者列数比A少1
clear all
clc
x = [0,sort(rand(1,1000)*2*pi),2*pi];
y = sin(x);
dx = diff(x);
dy = diff(y);
cal_y = dy./dx; % 理论值 差商约为导数
std_cal_y = cos(x(1:end-1)); % 实际值
plot(x(1:end-1),cal_y,'r',x(1:end-1),std_cal_y,'b');
d = norm(cal_y-std_cal_y); % 计算cal_y-std_cal_y向量的元素的平方和的平方根(即向量的第二范数),由上下文知此值越小越好

%% 数值积分
% matlab的数值积分方法有以下几种:
% 基于自适应辛普森方法: [I,n] = quad(filename,a,b,tol,trace)
% 基于自适应Gauss-Lobatto方法: [I,n] = quadl(filename,a,b,tol,trace)
% 这里filename是被积函数名(可以是匿名函数);a,b是积分的上下限，不能为无穷大;tol用来控制积分精度默认为10^-6
% trace控制是否展现积分过程，默认不展现，取0就是不展现 I即为定积分的值，n为被积函数的调用次数
format long
clear all
clc
f = @(x) 4./(1+x.^2);
[I1,n1] = quad(f,0,1,1e-8);
[I2,n2] = quadl(f,0,1,1e-8);
%% 基于全局自适应的积分方法: I = integral(filename,a,b),这里积分限可以无穷大
clear all
clc
format short
f = @(x) 1./(x.*sqrt(1-(log(x)).^2));
I = integral(f,1,exp(1));
I


%% 基于自适应高斯-康落得方法: [I,err] = quadgk(filename,a,b)
% err返回误差范围，积分的上下限可以是无穷大
clear all
clc
f = @(x) sin(1./x).*(1./x.^2);
I = quadgk(f,2/pi,+Inf);
I


%% 多重定积分的数值求解
% 二重
%    integral2(filename,a,b,c,d);
%    quad2d(filename,a,b,c,d);
%    dbquad(filename,a,b,c,d,tol)
%    先积的变量的上下限写在前面，后积的变量的上下限写在后面
% 三重
%    integral3(filename,a,b,c,d,e,f)
%    triplequad(filename,a,b,c,d,e,f)
clear all
clc
f = @(x,y) exp(-power(x,2)./2).*sin(x.^2+y);
I1 = quad2d(f,-2,2,-1,1);
I1_c = quad2d(f,-1,1,-2,2);
I1
I1_c
f2 = @(x,y,z) 4*x.*z.*exp(-power(z,2).*y-x.^2)
I2 = integral3(f2,0,pi,0,pi,0,1);
I2





