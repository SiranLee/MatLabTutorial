%%
% ʹ�������չ��ʽ��pi�Ľ���ֵ
clear all
clc
y = 0;
g = -1;
n = input('������n��ֵ: ');
for i = 1:n
    g = -g;
    y = y + g*1/(2*i-1);
end
sim_pi = 4*y;
%%
clear all
clc
% ʹ��matlab���еķ�ʽ����pi�Ľ���ֵ
y = 0;
n = input('������n��ֵ: ');
x = 1:2:2*n-1;% ע��ð�ű��ʽ��һ���ܹ�ȡ�����һ����Ҫ����ʼֵ�Ͳ���
y = (-1).^(2:n+1)./x;
pai = sum(y)*4
%% 
% ʹ�ö����ֵķ�ʽ����pi�Ľ���ֵ
clear all
clc
a = 0;
b = 1; % �����������
n = input('n =:');
h = (b-a)/n; % ������
x = a:h:b; % ÿһ��С�������εĺ�����
f = sqrt(1-x.*x); % ���屻������
new_areas = [];
for i = 1:n %һ���� n+1 ��С��������: a+0*h---a+n*h
    new_area = (f(i)+f(i+1))*h/2; % ���������ʽ,Ҳ�ɲ���С�����������
    new_areas = [new_areas,new_area]; % �ϲ�����
end
pai = 4*sum(new_areas)
%%
% ʹ�����ؿ��巽��������pi�Ľ���ֵ�����θ���
clear all
clc
s = 0; % ����1/4Բ�еĵ�ĸ���
n = input('�������������:');
for i = 1:n
    x = rand(1);
    y = rand(1);% ������һ�����е������
    if x^2+y^2<=1
        s = s+1;
    end
end
pai = s/n*4
%%
for k = [1,2,3,4]
    % for���ÿ��ȡ�����е�һ�У������һ����һ������
    disp(k)
end
disp('******')
for k = [1;2;3;4]
    % for���ÿ��ȡ�����е�һ�У������һ����һ������
    % ��������k��һ������
    disp(k)
end
%%
clear all
clc
nums = [];
num = input('������һ����:');
while num~=0
    nums = [nums,num];
    num = input('���������һ����:');
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
% ʹ��ɸ����������,����2(index)��ʼ��ÿ��ɸ��index���������ı���
m = input('������һ������: ');
p = 1:m;
p(1)=0; % ��ʾ1��������
for i = 2:sqrt(m) % ѭ����������m-1�Σ�ÿ��ɸ��i�ı�������
    for j = 2*i:i:m % �����и�trick����p��index��p(index)��ֵ��һ����
        p(j) = 0;
    end
end
n = find(p~=0);
p(n);
    










    
    