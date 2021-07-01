%%
% 使用无穷级数展开式求pi的近似值
clear all
clc
y = 0;
g = -1;
n = input('请输入n的值: ');
for i = 1:n
    g = -g;
    y = y + g*1/(2*i-1);
end
sim_pi = 4*y;
%%
clear all
clc
% 使用matlab独有的方式来求pi的近似值
y = 0;
n = input('请输入n的值: ');
x = 1:2:2*n-1;% 注意冒号表达式不一定能够取到最后一个，要看开始值和步长
y = (-1).^(2:n+1)./x;
pai = sum(y)*4
%% 
% 使用定积分的方式来求pi的近似值
clear all
clc
a = 0;
b = 1; % 定义积分区间
n = input('n =:');
h = (b-a)/n; % 区间宽度
x = a:h:b; % 每一个小曲边梯形的横坐标
f = sqrt(1-x.*x); % 定义被积函数
new_areas = [];
for i = 1:n %一共有 n+1 个小曲边梯形: a+0*h---a+n*h
    new_area = (f(i)+f(i+1))*h/2; % 梯形面积公式,也可采用小矩形面积来算
    new_areas = [new_areas,new_area]; % 合并集合
end
pai = 4*sum(new_areas)
%%
% 使用蒙特卡洛方法来计算pi的近似值，几何概型
clear all
clc
s = 0; % 落在1/4圆中的点的个数
n = input('请输入试验次数:');
for i = 1:n
    x = rand(1);
    y = rand(1);% 产生第一象限中的随机点
    if x^2+y^2<=1
        s = s+1;
    end
end
pai = s/n*4
%%
for k = [1,2,3,4]
    % for语句每次取矩阵中的一列，这里的一列是一个标量
    disp(k)
end
disp('******')
for k = [1;2;3;4]
    % for语句每次取矩阵中的一列，这里的一列是一个向量
    % 所以这里k是一个向量
    disp(k)
end
%%
clear all
clc
nums = [];
num = input('请输入一个数:');
while num~=0
    nums = [nums,num];
    num = input('请继续输入一个数:');
end
sum(nums)
sum(nums)/length(nums)
%%
clear all
clc
for i = 100:200
    if rem(i,21)==0
        i
        break
    end
end
%%
clear all
clc
% 使用筛法来找素数,即从2(index)开始，每次筛掉index的整数倍的倍数
m = input('请输入一个整数: ');
p = 1:m;
p(1)=0; % 表示1不是素数
for i = 2:sqrt(m) % 循环持续根号m-1次，每次筛掉i的倍数的数
    for j = 2*i:i:m % 这里有个trick就是p的index和p(index)的值是一样的
        p(j) = 0;
    end
end
n = find(p~=0);
p(n);
    










    
    