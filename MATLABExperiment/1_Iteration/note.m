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
% �Ӹ�����ʼ����ǵõ��ƽ�ָ��
x = -366;
y = 0;
while abs(x-y)>eps(x)
    y = x;
    x = sqrt(1+x);
end

%% 
clear all
clc
% ����ʽ�������
root = roots([1,-1,-1]);
% ���ŷ������
syms t;
g = t^2-t-1;
root4 = solve(g,t);
% �������ֶ������������������ȡ��һ����ȡ������ȡ�õ�x��ֵ
% �����Է������
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







