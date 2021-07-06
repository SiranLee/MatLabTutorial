%% 级数求和
% 使用symsum(s,v,n,m)来进行级数求和: s表示级数的通项，是一个符号表达式; v是求和的变量; n和m是求和变量v的初值和末值
% 这里的初值和末值一般指的是求和变量的初值和末值
clear all
clc
syms n;
s1 = symsum(n^2,n,1,100)
s2 = symsum((-1)^(n+1)*1/n,n,1,inf)
s3 = symsum((-1)^(n+1)*1/(2*n-1),n,1,inf)
%% 银行利率问题
clear all
clc
syms k r;
x = 2:40
pi = [];
p2 = symsum(50000*(1+0.045/k)^k,k,2,2) % 求某一项的值将n和m设置为相等
limit((1+r/k)^k,k,inf)

%% 泰勒级数
% 泰勒级数似乎是非线性->线性
% taylor()函数将函数展开为幂级数
% taylor(f,v,a,name,value): 将函数f按变量v在a点展开为泰勒级数，name和value是选项的键值对
% name可取三个字段: 'Expansionpoint'-> 指定展开点，value可以是标量或者向量，默认为0
%                  'Order'-> 指定展开到的幂级数的次数+1，默认为6，即最高次数为5
%                  'OrderMode'-> 指定展开式采用绝对阶(Absolute)或者相对阶(Relative).默认为绝对阶
clear all
clc
syms x
f = (1+x+x^2)/(1-x+x^2);
f2 = taylor(f,x,1,'Order',6)
simplify(f2)
expand(f2)
%% 
clear all
clc
syms x
f = taylor(cos(x),x,pi);
x = 0:0.01:2*pi;
eval(f)
cos(3)
plot(x,cos(x),'r',x,eval(f),'b'); % 只有在展开点附近才会拟合得很好，超出一定范围差距就大了
%%
clear all
clc
syms x
f = taylor(cos(x),x,pi);
g = f-cos(x);
x = 0:0.01:2*pi;
plot(x,eval(g),'b');
hold on;
indexes = find(eval(g)>-0.0001);
plot(x(indexes),0,'r*');






