%%
clear all
clc
U = {'http://www.alpha.com' 
     'http://www.beta.com' 
     'http://www.gamma.com' 
     'http://www.delta.com' 
     'http://www.rho.com' 
     'http://www.sigma.com'}; % 这里是个cell数组，每个entry之间不加逗号的话，U最后就是1×1的数组; 如果每个entry之间加了逗号就是 1×6的cell数组
% 建立图的稀疏矩阵
n = 6;
p = 0.85;
i = [2 6 3 4 4 5 6 1 1]; j = [1 1 2 2 3 3 3 4 6];
G = sparse(i,j,1,n,n); % G表示该图联通的稀疏矩阵
c = full(sum(G)); % 按列求A的和，求完之后是一个行向量 full(A) %将稀疏矩阵A转化为完全矩阵 
k = find(c~=0); % 求列和不为0的列序号
D = sparse(k,k,1./c(k),n,n);
e = ones(n,1);
I = speye(n); % 构造n阶单位阵
x = (I-p*G*D)\e;
x = x/sum(x); % 归一化 最后的结果x就是各个网页的PageRank
bar(x);

%%
clear all
clc
load harvard500;
figure(1);
spy(G);% 画出稀疏矩阵的模式(分布),以G的大小为横纵坐标的最大尺度，以G中每个非0元素的行列号作为横纵坐标
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
     'http://www.sigma.com'}; % 这里是个cell数组，每个entry之间不加逗号的话，U最后就是1×1的数组; 如果每个entry之间加了逗号就是 1×6的cell数组
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







