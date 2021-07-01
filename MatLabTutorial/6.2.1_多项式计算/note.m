%% 在MATLAB中n次多项式用一个长为n+1的向量来表示:[an,an-1,an-2,...,a1,a0] 称其为多项式系数向量
% 多项式系数向量的顺序是从高到低的；如果多项式中有的项没有，对应的系数向量用0补上
% 多项式的四则运算
% 1. 多项式加减运算: 多项式的加减运算很简单，即向量相加减
% 2. 多项式的乘法:  y = conv(P1,P2): 多项式相乘，其中P1，P2是两个多项式系数向量,结果y是一个多项式向量
% 3. 多项式的除法: [Q,r] = deconv(P1,P2): 多项式相除，其中Q是多项式P1除以P2商，r是多项式P1除以P2的余式
%    根据乘法与除法的互逆，有 P1 = conv(Q,P2)+r
clear all
clc
f = [3,-5,0,-7,5,6]; % f的多项式
g = [3,5,3]; % g的多项式
g1 = [0,0,0,g]; % g的补足的多项式
f+g1 % f(x)+g(x)
f-g1 % f(x)-g(x)
conv(f,g) % f(x)*g(x)
[Q,r] = deconv(f,g) % f(x)/g(x)
% 加法和减法必须长度相同，乘法和除法则不要求

%% 多项式的求导: polyder()
% p = polyder(P): 求多项式P的导函数
% p = polyder(P,Q): 求P*Q的导函数
% [p,q] = polyder(P,Q): 求P/Q的导函数，导函数的分子存入p,分母存入q
clear all
clc
a = [3,1,0,-6]; b = [1,2];
polyder(a)
c = polyder(a,b)
[p,q] = polyder(a,b)

%% 多项式的求值
% polyval(p,x): 代数多项式求值，x可以是一个向量或者是一个矩阵，这两种情况下都是进行点乘
% polyvalm(p,A): 矩阵多项式求值，A是一个方阵，直接将矩阵视为一个x采用矩阵乘法进行运算
clear all
clc
a = [1,8,0,0,-10];
x = [-1,1.2;2,-1.8]; % 2*2的矩阵
y1 = polyval(a,x)
y2 = polyvalm(a,x)

%%  多项式的求根 roots()
clear all
clc
a = [1,8,0,0,-10];
x = roots(a)
% 可以另外使用 poly()来根据多项式的根来建立多项式
poly(x)

%% 综合例子
clear all
clc
f = [-38.89,126.11,-3.42];
cal_f = polyder(f);
points = roots(cal_f);
points_val = polyval(f,points);
x = 0:0.01:2;
plot(x,polyval(f,x),points, points_val,'rp');
hold on;
line([points, points], [-20, points_val],'linestyle','--');






