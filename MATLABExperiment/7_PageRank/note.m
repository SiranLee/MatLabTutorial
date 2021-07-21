%%
clear all
clc
U = {'http://www.alpha.com' 
     'http://www.beta.com' 
     'http://www.gamma.com' 
     'http://www.delta.com' 
     'http://www.rho.com' 
     'http://www.sigma.com'}; % �����Ǹ�cell���飬ÿ��entry֮�䲻�Ӷ��ŵĻ���U������1��1������; ���ÿ��entry֮����˶��ž��� 1��6��cell����
% ����ͼ��ϡ�����
n = 6;
p = 0.85;
i = [2 6 3 4 4 5 6 1 1]; j = [1 1 2 2 3 3 3 4 6];
G = sparse(i,j,1,n,n); % G��ʾ��ͼ��ͨ��ϡ�����
c = full(sum(G)); % ������A�ĺͣ�����֮����һ�������� full(A) %��ϡ�����Aת��Ϊ��ȫ���� 
k = find(c~=0); % ���кͲ�Ϊ0�������
D = sparse(k,k,1./c(k),n,n);
e = ones(n,1);
I = speye(n); % ����n�׵�λ��
x = (I-p*G*D)\e;
x = x/sum(x); % ��һ�� ���Ľ��x���Ǹ�����ҳ��PageRank
bar(x);

%%
clear all
clc
load harvard500;
figure(1);
spy(G);% ����ϡ������ģʽ(�ֲ�),��G�Ĵ�СΪ������������߶ȣ���G��ÿ����0Ԫ�ص����к���Ϊ��������
figure(2);
pagerank(U,G);
%%
clear all
clc
U = {'http://www.alpha.com' 
     'http://www.beta.com' 
     'http://www.gamma.com' 
     'http://www.delta.com' 
     'http://www.rho.com' 
     'http://www.sigma.com'}; % �����Ǹ�cell���飬ÿ��entry֮�䲻�Ӷ��ŵĻ���U������1��1������; ���ÿ��entry֮����˶��ž��� 1��6��cell����
n = 6;
p = 0.99;
i = [2 3 3 4 4 5 6];
j = [1 1 2 2 3 6 5];
G = sparse(i,j,1,n,n);
spy(G);
c = sum(G);
k = find(c~=0);
D = sparse(k,k,1./c(k),n,n);
e = ones(n,1);
I = speye(n);
x = (I-p*D*G)\e;
x = x/sum(x);
bar(x)
pagerank(U,G);







