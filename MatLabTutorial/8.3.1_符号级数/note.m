%% �������
% ʹ��symsum(s,v,n,m)�����м������: s��ʾ������ͨ���һ�����ű��ʽ; v����͵ı���; n��m����ͱ���v�ĳ�ֵ��ĩֵ
% ����ĳ�ֵ��ĩֵһ��ָ������ͱ����ĳ�ֵ��ĩֵ
clear all
clc
syms n;
s1 = symsum(n^2,n,1,100)
s2 = symsum((-1)^(n+1)*1/n,n,1,inf)
s3 = symsum((-1)^(n+1)*1/(2*n-1),n,1,inf)
%% ������������
clear all
clc
syms k r;
x = 2:40
pi = [];
p2 = symsum(50000*(1+0.045/k)^k,k,2,2) % ��ĳһ���ֵ��n��m����Ϊ���
limit((1+r/k)^k,k,inf)

%% ̩�ռ���
% ̩�ռ����ƺ��Ƿ�����->����
% taylor()����������չ��Ϊ�ݼ���
% taylor(f,v,a,name,value): ������f������v��a��չ��Ϊ̩�ռ�����name��value��ѡ��ļ�ֵ��
% name��ȡ�����ֶ�: 'Expansionpoint'-> ָ��չ���㣬value�����Ǳ�������������Ĭ��Ϊ0
%                  'Order'-> ָ��չ�������ݼ����Ĵ���+1��Ĭ��Ϊ6������ߴ���Ϊ5
%                  'OrderMode'-> ָ��չ��ʽ���þ��Խ�(Absolute)������Խ�(Relative).Ĭ��Ϊ���Խ�
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
plot(x,cos(x),'r',x,eval(f),'b'); % ֻ����չ���㸽���Ż���ϵúܺã�����һ����Χ���ʹ���
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






