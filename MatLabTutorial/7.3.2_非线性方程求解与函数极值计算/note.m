%% �����Է������
%% ���ڵ������ķ����Է������
% fzero����: x = fzero(filename,x0)
%    ����filename��ʾ�����������˵ĺ������ʽ(����ʹ��������������),x0�ǳ�ʼֵ
clear all
clc
f = @(x) x-1./x+5;
x = fzero(f,-5);
x2 = fzero(f,1);
fplot(f,[-6,2],'r');
hold on;
line([-6,2],[0,0],'Color','blue');
hold on;
plot(x,0,'k*',x2,0,'k*');
axis([-6,2,-10,10]);
% x0ѡ��ò�ͬ���ó��Ľ���ʱ����һЩcounterintuitive,����Ҫѧ����ϸ���
%%
clear all
clc
f = @(x) x.^2-1
x = [];
x0 = -0.25:0.001:0.25;
for x00=x0
    x = [x,fzero(f,x00)];
end
plot(x0,x,'o');

%% ���ڷ����Է���������
% fsolve����: x = fsolve(filename,x0,option)
% ����filename��x0�ĺ���ͬ�ϣ�option�����������Ż���������Ż����������Ե���optimset���������
clear all
clc
f = @(x) x-1./x+5;
x = fsolve(f,-5,optimset('Display','off')); % ���� Display: off ��ʾ����ʾ�м���ֵ�����Ĺ���
x2 = fsolve(f,0.01,optimset('Display','off')); % ����fzero�����㲻�����ĸ���fsolve�������
%% 
clear all
clc
% ������ⷽ�������������
f = @(x) [sin(x(1))+x(2)+x(3)^2*exp(x(1)),x(1)+x(2)+x(3),x(1)*x(2)*x(3)]; % �������x��ʾδ֪����������һ����������ʾ��������
% ����f��(1,1,1)����ֵ
f([1,1,1]);
x = fsolve(f,[1,1,1],optimset('Display','off'));
f(x)


%% ������ֵ�ļ���
% matlab��ֻ�Ǽ���ĳ�������ڵ���Сֵ(��Сֵ),���������ֵ�ļ������ͨ���� -f(x) ����Сֵ�����
%% ��Լ�������Ż�����
% ��Լ������������Сֵ�ĺ���Ϊ: 
% [xmin,fmin] = fminbnd(filename,x1,x2,option)  ����x1,x2��ʾ���о���������ұ߽�
% [xmin,fmin] = fminsearch(filename,x0,option)
% [xmin,fmin] = fminunc(filename,x0,option) �����Լ������x0��ʾ����������ֵ��ĳ�ֵ
% ���У�xmin��ʾ��Сֵ�㣬fmin��ʾ��Сֵ��filename��ʾ�����Ŀ�꺯����optionΪ�Ż�����������ͨ��optimset������
clear all
clc
f = @(x) x-1./x+5;
[xmin,fmin] = fminbnd(f,-10,-1,optimset('Display','off'));
xmin
fmin
[xmin2,fmin2] = fminbnd(f,1,10,optimset('Display','off'));
xmin2
fmin2

%% ��Լ�����Ż�����
% ����Լ���������Է�Ϊ: ���Բ���ʽԼ�������Ե�ʽԼ��; �����Բ���ʽԼ���������Ե�ʽԼ��; x�����½�(upper bound, lower bound)
% [xmin,fmin] = fmincon(filename,x0,A,b,Aeq,beq,Lbnd,Ubnd,NonF,option)
% ����xmin��fmin,filename,x0,option������������ͬ��
% A��ʾ���Բ���ʽ��ϵ������b��ʾ���Բ���ʽ�ĳ�������
% Aeq��ʾ���Ե�ʽ��ϵ������beq��ʾ���Ե�ʽ�ĳ�������
% Lbnd,Ubnd�ֱ��ʾx�����½磬��һ������
% NonF�Ƿ����Ե�ʽ����Ҫͨ�����庯���ļ���ʹ�ú����ļ���
% ���ĳ��Լ�������ڣ��ÿվ�������ʾ
clear all
clc
t1 = 0:0.1:2;
t2 = 0:0.1:2;
[T1,T2] = meshgrid(t1,t2);
Z = 0.4.*T2+T1.^2+T2.^2-T1.*T2+1/30.*T1.^3;
f = @(x) 0.4.*x(2)+x(1).^2+x(2).^2-x(1).*x(2)+1/30.*x(1).^3;
x0 = [0.5;0.5];% ������x0��ʾ��ֵ��ĳ�ʼֵ
A = [-1,-0.5;-0.5,-1]; % ���Բ���ʽ��ϵ����������Ҫ�����д��ڵ���ת��ΪС�ڵ���(��ͬ)�����Գ���-1
b = [-0.4;-0.5];
lb = [0;0];
option = optimset('Display','off');
[xmin,fmin] = fmincon(f,x0,A,b,[],[],lb,[],[],option);
surf(T1,T2,Z);
hold on;
plot3(xmin(1),xmin(1),fmin,'ro');
hold on;
surf(T1,T2,T1+T2.*0.5-0.4);
hold on;
surf(T1,T2,T2+T1.*0.5-0.5);
axis([0,2,0,2,0,6]);

%% 
clear all
clc
a=[10,30,16.667,0.555,22.2221];
b=[10,50,29,29.888,49.988];
c=[10,18,20,14,25];
f=@(x) sum(c.*sqrt((x(1)-a).^2+(x(2)-b).^2));
[xmin,fmin]=fmincon(f,[15,30],[],[],[],[],[],[],'funny')






