%% ����΢����
%% ���ź����ļ���
% ʹ��limit(f,x,a)������f���ڱ���x������aʱ�ļ���
% ʹ��limit(f,x,a,'right'),limit(f,x,a,'left')������󵥱߼���
clear all
clc
syms a m x n;
limit((power(x,1/m)-power(a,1/m))/(x-a),x,a)
limit((1+1/n)^n,n,inf)

%% ���ź����ĵ���
% diff(f,x,n): �Ժ���f����x��n�׵�
clear all
clc
syms x y z
diff(sqrt(1+exp(x)),x,1)
diff((x*exp(y))/y^2,x,1) % ��x��ƫ��
diff((x*exp(y))/y^2,y,1) % ��y��ƫ��

%% ���ŵĻ���
%% �󲻶�����
% ʹ�� int(f,x) ����f��x�Ĳ�������
clear all
clc
syms x t
int((3-x^2)^3,x)
int(5*x*t/(1+x^2),t)
%% �󶨻���
% ʹ�� int(f,x,a,b)����f����x������[a,b]�ϵĶ�����
% ����f�ڸ��������Ͽɻ�ʱ�������ŷ���һ�������ֽ��
% ��a,b����һ����infʱ����������һ���������
% ��a,b����һ���Ƿ��ű��ʽʱ����������һ�����ź���
clear all
clc
syms x t;
int(abs(1-x),x,1,2)
int(1/(1+x^2),x,-inf,inf) % ����һ���������
int(4*x/t,t,2,sin(x)) % ����һ������x�ķ��ź���

%% ����ˮ�����Ĺ�������
clear all
clc
xi=0:50:600;
yi=[4.4,4.5,4.6,4.8,4.9,5.1,5.4,5.2,5.5,5.2,4.9,4.8,4.7];
% ��һ���������ʹ�û��������������֮ǰ����Ҫʹ��������ϳ������λ�ù��ڸ߶ȵĺ���
p = polyfit(xi,yi,3);
plot(xi,yi,'r*',xi,polyval(p,xi),'b');
% Ȼ������Ķ���ʽϵ��ת��Ϊ����x�ķ��ź�����ʹ��poly2sym()����
syms f x
f = poly2sym(p,x);
area = int(f,x,xi(1),xi(end));
v = area*0.6;
eval(v); % ʹ�û���һ��Ҫ��ס���evalһ�¡���Ȼ�ó����Ǳ��ʽ
yj = -yi;
p2 = polyfit(xi,yj,3);
plot(xi,yj,'r*',xi,polyval(p2,xi),'b');
syms f2 diff_f2
f2 = poly2sym(p,x);
diff_f2 = diff(f2,x,1);
x=50:60; % ��x��ֵ
k = eval(diff_f2); % Ȼ������ڸ���x�µ�diff_f2��ֵ
all(abs(k)<1/1.5) % all(i) ������i������Ԫ�ط�0�����Ϊ1,��������Ϊ0
% Ҳ���Խ�p2��x��50-60��������ж���ʽ��ֵ��Ȼ������ֵ���в��(����û������ĵ�����ȷ����Ϊ����ȡ��λΪ1)







