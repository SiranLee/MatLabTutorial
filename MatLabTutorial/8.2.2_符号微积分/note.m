%% 符号微积分
%% 符号函数的极限
% 使用limit(f,x,a)来求函数f关于变量x在趋于a时的极限
% 使用limit(f,x,a,'right'),limit(f,x,a,'left')则可以求单边极限
clear all
clc
syms a m x n;
limit((power(x,1/m)-power(a,1/m))/(x-a),x,a)
limit((1+1/n)^n,n,inf)

%% 符号函数的导数
% diff(f,x,n): 对函数f关于x求n阶导
clear all
clc
syms x y z
diff(sqrt(1+exp(x)),x,1)
diff((x*exp(y))/y^2,x,1) % 对x求偏导
diff((x*exp(y))/y^2,y,1) % 对y求偏导

%% 符号的积分
%% 求不定积分
% 使用 int(f,x) 来求f对x的不定积分
clear all
clc
syms x t
int((3-x^2)^3,x)
int(5*x*t/(1+x^2),t)
%% 求定积分
% 使用 int(f,x,a,b)来求f关于x在区间[a,b]上的定积分
% 仅当f在给定区间上可积时，函数才返回一个定积分结果
% 当a,b中有一个是inf时，函数返回一个广义积分
% 当a,b中有一个是符号表达式时，函数返回一个符号函数
clear all
clc
syms x t;
int(abs(1-x),x,1,2)
int(1/(1+x^2),x,-inf,inf) % 返回一个广义积分
int(4*x/t,t,2,sin(x)) % 返回一个关于x的符号函数

%% 河流水流量的估计问题
clear all
clc
xi=0:50:600;
yi=[4.4,4.5,4.6,4.8,4.9,5.1,5.4,5.2,5.5,5.2,4.9,4.8,4.7];
% 第一问求面积，使用积分求面积，在那之前，需要使用曲线拟合出横截面位置关于高度的函数
p = polyfit(xi,yi,3);
plot(xi,yi,'r*',xi,polyval(p,xi),'b');
% 然后将求出的多项式系数转化为关于x的符号函数，使用poly2sym()函数
syms f x
f = poly2sym(p,x);
area = int(f,x,xi(1),xi(end));
v = area*0.6;
eval(v); % 使用积分一定要记住最后eval一下。不然得出的是表达式
yj = -yi;
p2 = polyfit(xi,yj,3);
plot(xi,yj,'r*',xi,polyval(p2,xi),'b');
syms f2 diff_f2
f2 = poly2sym(p,x);
diff_f2 = diff(f2,x,1);
x=50:60; % 给x赋值
k = eval(diff_f2); % 然后计算在给定x下的diff_f2的值
all(abs(k)<1/1.5) % all(i) 若向量i中所有元素非0，结果为1,；否则结果为0
% 也可以将p2对x在50-60的区间进行多项式求值，然后对求得值进行差分(不过没有上面的导数精确，因为这里取单位为1)







