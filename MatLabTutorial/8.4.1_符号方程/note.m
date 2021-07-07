%% 代数方程符号求解
% 使用 solve()函数求解符号表达式表示的代数方程，具体有以下几种方式:
% solve(s): 求解符号表达式s所表示的方程，求解变量默认
% solve(s,v): 设置求解变量为v
% solve(s1,s2,....,sn,v1,v2,...,vn): 求解s1,s2,...,sn的方程组，v1,v2,...vn为求解变量
% 求解 ax^2+bx+c = 0
% 1.
clear all
clc
syms a b c x;
f = a*x^2+b*x+c;
coefficiants = coeffs(f,x);
coefficiants = coefficiants(end:-1:1);
roots1 = roots(coefficiants);
% 2.
roots2 = solve(f,x);
% 要注意使用solve函数求解方程时，得到的结果不一定精确，所以解方程时没有得到结果一定要换多种方式来求解
% 或者变换方程来求解

%% 常微分方程符号求解
% matlab中，用Dy来表示y',D2y表示y'',Dy(0)=c表示y'(0)=c
% 使用 dsolve() 函数来求解符号常微分方程: dsolve(e,c,v)，这里e使用字符串来表示,c也用符号串来表示
% 其中e(equation)表示所要求解的常微分方程，c表示给定的初值，v表示方程中的自变量，若c未给出，则求通解
% 使用 dsolve(e1,e2,...,en,c1,c2,...,cn,v)来求解 e1，e2，...,en这个常微分方程组的解
clear all
clc
syms x y t
gen_root = dsolve('2*x^2*Dy-(x^2+y^2)',x);% 未给定初值则求通解
[x,y] = dsolve('4*x-2*y-Dx','2*x-y-Dy', t);% 这里常微分方程组中的变量为t

%% 
clear all
clc
syms a b c y t; % a是lamda,c是mu
f = dsolve('Dy-a*y*(1-y)+c*y','y(0)=b',t);
% 若 a = c，则再次解常微分方程
f2 = dsolve('Dy=a*y*(1-y)-a*y','y(0)=b',t);








