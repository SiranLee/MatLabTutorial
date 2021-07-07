%% �������̷������
% ʹ�� solve()���������ű��ʽ��ʾ�Ĵ������̣����������¼��ַ�ʽ:
% solve(s): �����ű��ʽs����ʾ�ķ��̣�������Ĭ��
% solve(s,v): ����������Ϊv
% solve(s1,s2,....,sn,v1,v2,...,vn): ���s1,s2,...,sn�ķ����飬v1,v2,...vnΪ������
% ��� ax^2+bx+c = 0
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
% Ҫע��ʹ��solve������ⷽ��ʱ���õ��Ľ����һ����ȷ�����Խⷽ��ʱû�еõ����һ��Ҫ�����ַ�ʽ�����
% ���߱任���������

%% ��΢�ַ��̷������
% matlab�У���Dy����ʾy',D2y��ʾy'',Dy(0)=c��ʾy'(0)=c
% ʹ�� dsolve() �����������ų�΢�ַ���: dsolve(e,c,v)������eʹ���ַ�������ʾ,cҲ�÷��Ŵ�����ʾ
% ����e(equation)��ʾ��Ҫ���ĳ�΢�ַ��̣�c��ʾ�����ĳ�ֵ��v��ʾ�����е��Ա�������cδ����������ͨ��
% ʹ�� dsolve(e1,e2,...,en,c1,c2,...,cn,v)����� e1��e2��...,en�����΢�ַ�����Ľ�
clear all
clc
syms x y t
gen_root = dsolve('2*x^2*Dy-(x^2+y^2)',x);% δ������ֵ����ͨ��
[x,y] = dsolve('4*x-2*y-Dx','2*x-y-Dy', t);% ���ﳣ΢�ַ������еı���Ϊt

%% 
clear all
clc
syms a b c y t; % a��lamda,c��mu
f = dsolve('Dy-a*y*(1-y)+c*y','y(0)=b',t);
% �� a = c�����ٴνⳣ΢�ַ���
f2 = dsolve('Dy=a*y*(1-y)-a*y','y(0)=b',t);








