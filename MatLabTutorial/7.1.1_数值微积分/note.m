%% ��ֵ΢��
% ����ʹ����ֵ����˼�ǣ���������ı��ʽδ֪(�����֪������ʹ�÷��ź����������)��ֻ����ɢ�ĺ�����ֵ������ͨ��
% ��ֵ����ķ�ʽ�����㺯���ĵ���
% ΢�����������ʹ�ò�ִ���΢�֣���������������ʹ�ò��̴��浼��
% ��ǰ���: ��delta_f = f(x+h)-f(x);
% �����: ��delta_f = f(x)-f(x+h);
% matlab�ṩ������ǰ��ֵĺ��� diff,����ø�ʽ������:
% dx = diff(X): ��������X�Ĳ�֣�dx��һ��������ά�ȱ�X��1, dx(i) = X(i+1)-X(i) i=1,2,3,...,n-1
% dx = diff(x,n): ����������X��n�ײ�֣����� diff(x,2)=diff(diff(x))
% dx = diff(A,n,dim): �������A��n�ײ�֣�dim=1ʱ(Ĭ��״̬)���м��㣬dim=2ʱ���м��㣬dx��һ��������������������A��1
clear all
clc
x = [0,sort(rand(1,1000)*2*pi),2*pi];
y = sin(x);
dx = diff(x);
dy = diff(y);
cal_y = dy./dx; % ����ֵ ����ԼΪ����
std_cal_y = cos(x(1:end-1)); % ʵ��ֵ
plot(x(1:end-1),cal_y,'r',x(1:end-1),std_cal_y,'b');
d = norm(cal_y-std_cal_y); % ����cal_y-std_cal_y������Ԫ�ص�ƽ���͵�ƽ����(�������ĵڶ�����),��������֪��ֵԽСԽ��

%% ��ֵ����
% matlab����ֵ���ַ��������¼���:
% ��������Ӧ����ɭ����: [I,n] = quad(filename,a,b,tol,trace)
% ��������ӦGauss-Lobatto����: [I,n] = quadl(filename,a,b,tol,trace)
% ����filename�Ǳ���������(��������������);a,b�ǻ��ֵ������ޣ�����Ϊ�����;tol�������ƻ��־���Ĭ��Ϊ10^-6
% trace�����Ƿ�չ�ֻ��ֹ��̣�Ĭ�ϲ�չ�֣�ȡ0���ǲ�չ�� I��Ϊ�����ֵ�ֵ��nΪ���������ĵ��ô���
format long
clear all
clc
f = @(x) 4./(1+x.^2);
[I1,n1] = quad(f,0,1,1e-8);
[I2,n2] = quadl(f,0,1,1e-8);
%% ����ȫ������Ӧ�Ļ��ַ���: I = integral(filename,a,b),��������޿��������
clear all
clc
format short
f = @(x) 1./(x.*sqrt(1-(log(x)).^2));
I = integral(f,1,exp(1));
I


%% ��������Ӧ��˹-����÷���: [I,err] = quadgk(filename,a,b)
% err������Χ�����ֵ������޿����������
clear all
clc
f = @(x) sin(1./x).*(1./x.^2);
I = quadgk(f,2/pi,+Inf);
I


%% ���ض����ֵ���ֵ���
% ����
%    integral2(filename,a,b,c,d);
%    quad2d(filename,a,b,c,d);
%    dbquad(filename,a,b,c,d,tol)
%    �Ȼ��ı�����������д��ǰ�棬����ı�����������д�ں���
% ����
%    integral3(filename,a,b,c,d,e,f)
%    triplequad(filename,a,b,c,d,e,f)
clear all
clc
f = @(x,y) exp(-power(x,2)./2).*sin(x.^2+y);
I1 = quad2d(f,-2,2,-1,1);
I1_c = quad2d(f,-1,1,-2,2);
I1
I1_c
f2 = @(x,y,z) 4*x.*z.*exp(-power(z,2).*y-x.^2)
I2 = integral3(f2,0,pi,0,pi,0,1);
I2





