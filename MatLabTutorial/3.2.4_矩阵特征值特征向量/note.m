%% ʹ��eig(A)�������A��ȫ������ֵ
A = magic(3)
E = eig(A)
[X, D] = eig(A) % �����A��ȫ������ֵ�����ɶԽ���D,����������X, X��������Ӧ��D����������
% һ����֤
A*X(:,1)
D(1)*X(:,1)
%%
clear all
clc
R = magic(3);
S= magic(2);
A = [R,zeros(3,2);zeros(2,3),S]
[tzxl_R, tzz_R] = eig(R)
[tzxl_S, tzz_S] = eig(S)
[tzxl_A, tzz_A] = eig(A)
%% eigshow �ڵ�λԲ����ʾ����x��Ax֮��Ĺ�ϵ
clear all
clc
eigshow()
%% 
clear all
clc
coordinates = [0,0.5,0.5,3,5.5,5.5,6,6,3,0;0,0,6,0,6,0,0,8,1,8];
A = [1,0.5;0,1];
y = A*coordinates;
subplot(2,2,1);
fill(coordinates(1,:),coordinates(2,:),'b');
subplot(2,2,2);
fill(y(1,:),y(2,:),'b');