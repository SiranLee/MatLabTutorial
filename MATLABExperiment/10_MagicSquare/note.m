%%
A = magic(3); % 产生三阶幻方
% 其中rot90(A,k)表示将数组A逆时针旋转k*90度
for k = 0:3
    rot90(A,k)
    rot90(A',k)
end

%%
load durer
image(X)
colormap(map)
axis image
load detail
image(X)
colormap(map)
axis image

%%
clear all
clc
A = magic(4);
A = A(:,[1 3 2 4]); % 互换A的2,3两列 A(:,[c1 c2]): 将A的c1列和c2列按照指明的顺序返回

%%
