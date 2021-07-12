%% recap 1
x = -pi:pi/256:pi;
y = tan(sin(x))-sin(tan(x));
z = 1+tan(1);
plot(x,y,'-',pi/2,z,'ro');
xlabel('x');ylabel('y');
title('tan(sin(x))-sin(tan(x))');

%% recap 2
golden_spiral(4);

%% excersise 4
% 从负数开始最后还是得到黄金分割比
x = -366;
y = 0;
while abs(x-y)>eps(x)
    y = x;
    x = sqrt(1+x);
end

%% 
clear all
clc
% 多项式方程求解
root = roots([1,-1,-1]);
% 符号方程求解
syms t;
g = t^2-t-1;
root4 = solve(g,t);
% 上面两种都有两个根，而下面的取哪一个根取决于所取得的x初值
% 非线性方程求解
f = @(x) x^2-x-1;
root2 = fzero(f,[-0.5,2]);
root3 = fsolve(f,-2,optimset('Display','off'));

%% 
clear all
clc
syms x;
length(char(x));
array = [];
for i = 1:10
    x = sqrt(1+x);
    array = [array,length(char(x))];
end
y = polyfit(1:10,array,2);
plot(1:10,array,'ro',1:10,polyval(y,1:10),'b-');

%% 
clear all
clc
x = 10;
y = 0;
iterate_y = [];
times = 0;
while abs(x-y) > eps(x)
    y = x;
    iterate_y = [iterate_y, y];
    x = 1/(x-1);
    times = times+1;
end
times2 = 0;
x2 = 10;
y2 = 0;
iterate_y2 = [];
while abs(x2-y2) > eps(x2)
    y2 = x2;
    iterate_y2 = [iterate_y2, y2];
    x2 = 1/(x2-1);
    times2 = times2+1;
end
plot(1:times,iterate_y,'b-',1:times2,iterate_y2,'r-');

%% 
clear all
clc
x = 3;
format long
times = 1;
while x~=sqrt(1+x^2)
    x = sqrt(1+x^2);
    times = times+1;
end

%% 
golden_spiral(10);

%% 
rabbits







