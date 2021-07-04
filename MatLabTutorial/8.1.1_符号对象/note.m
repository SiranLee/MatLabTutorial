%% 符号对象的建立
% sym函数: a = sym(A),
% 这里A可以是一个数值常量，数值矩阵或者数值表达式(不加单引号),表示用a来代表这个数值来进行符号运算，此时a这个符号对象为一个符号常量
% A还可以是一个变量名(加单引号),这时符号对象为一个符号变量
clear all
clc
t = sym(2); % t代数2，t是一个符号常量
t+1/2 % 返回的是一个表达式，而不是5/2=2.500这个结果
sin(sym(pi/3))
sin(pi/3)
% 比较sin的两个值，前者对符号对象的运算返回一个表达式(这是该值的精确结果),后者返回一个数值(这是该值的一个近似结果)
a = 5; b = -8;
x = sym('a'); % 用变量名a初始化符号对象x,x是一个符号变量
y = sym('b');
w = (a+b)*(a-b); % w算出来的是一个数值结果
s = (x+y)*(x-y); % s算出来的是一个表达式
% 使用eval(符号表达式),来计算符号表达式的值
eval(s)
% 可以使用 syms 命令一次定义多个符号变量: syms s1 s2 s3
syms a b c d
% 总结: 符号计算的结果是一个精确的数学表达式，数值计算结果是一个数值

%% 符号对象的运算
%% 四则运算
% 包括: +,-,*,/,^  运算结果依然是符号表达式
clear all
clc
syms x;
f = 2*x^2+3*x-5;
g = x^2-x+7;
f+g % 两个符号表达式相加

%% 关系运算
% 6种关系运算符: <,<=,>,=>,==,~=
% 对应的6个函数: lt(),le(),gt(),ge(),eq(),ne()
% 若参加运算的是符号表达式，其结果是一个 符号 关系
% 表达式，若参加运算的是符号矩阵，其结果是由符号关系表达式组成的矩阵(对矩阵中的每一个元素进行运算)
% 可以在进行符号运算之前，使用assume函数对符号对象设置取值范围，函数的调用格式如下
% assume(condition), assume(expr,set)
clear all
clc
syms x;
assume(x<0); % assume(condition)的形式
abs(x)==x % 这里并不会计算这个关系运算，而是计算abs(x)，然后返回一个符号表达式
syms y;
assume(x,'positive');
abs(x)==x

%% 逻辑运算
% 3种逻辑运算: &,|,~
% 4个逻辑运算函数: and(a,b),or(a,b),not(a)和xor(a,b)(异或)
clear all
clc
syms x;
y = x>0 & x<10
y2 = and(x>0,x<10)

%% 因式分解与展开
% factor(s): 对s进行因式分解
% expand(s): 对s进行展开
% collect(s): 对s合并同类项
% collect(s,v): 对s按照变量v合并同类型
clear all
clc
syms a b;
s = a^3-b^3;
t = (a+b)^3;
factor(s)
expand(t)
% 另外，factor还可以进行质因数分解
factor(24)

%% 其他运算
% 提取有理分式的分子分母: [n,d] = numden(s) n是分子，d是分母
syms a b c
s = (a+b)/(a+b+c);
[n,d] = numden(s)
% 提取符号表达式的系数: c = coeffs(s,x)，其中，x表示该表达式中的变量，而其他相对于x为常量
% 符号表达式化简: simplify(s)
% 符号表达式与多项式系数向量之间的转换
%   符号多项式转化为多项式的系数向量: p = sym2poly(s)
%`  多项式系数转化为符号多项式: s = poly2sym(p)
% 这里要注意的是 c = coeffs(s,x) 与 p = sym2poly(s)一般情况下式不同的，
clear all
clc
syms a b c x;
f = a*x^2+b*x+c;
g = coeffs(f,x)
% g = sym2poly(f) % 这里报错，因为sym2poly不知道f中是将x视为变量还是a将,b,c视为变量
g2 = sym2poly(2*a^2+a+4*a) % 返回[2,5,0],可见是sym2poly只适用于单变量的符号多项式转多项式，且附带合并多项式系数的操作
g = g(end:-1:1)
roots(g)
% 可以使用symvar()函数来查找一个符号表达式中的符号变量，函数的调用格式为:
% symvar(s,n),所以可以使用symvar(s,1)来查找s中的主变量
symvar(f,1)

%% 符号矩阵
% 以上介绍的所有  函数  在作用于符号矩阵时，分别作用于矩阵的每一个元素
clear all
clc
syms a b x y alp;
m = [a^3-b^3, sin(alp)^2+cos(alp)^2;(15*x*y-3*x^2)/(x-5*y),78]
simplify(m)
 
%% 
syms lamda
f = [1-lamda,-2,4;2,3-lamda,1;1,1,1-lamda];
D = det(f) % 求f的行列式
factor(D)





