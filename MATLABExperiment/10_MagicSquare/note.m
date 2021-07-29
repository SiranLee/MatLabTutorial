%%
A = magic(3); % �������׻÷�
% ����rot90(A,k)��ʾ������A��ʱ����תk*90��
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
A = A(:,[1 3 2 4]); % ����A��2,3���� A(:,[c1 c2]): ��A��c1�к�c2�а���ָ����˳�򷵻�

%%
figure
for n = 3:20
    r(n) = rank(magic(n));
end
bar(r);
axis([2 21 0 20]);
%%
figure
for n = 9:12
    subplot(2,2,n-8);
    surf(rot90(magic(n)));
    axis tight off;
    text(0,0,20,num2str(n));
end
set(gcf,'color','white');

%%
ismagic(magic(3));

%%
clear
load detail
whos
image(X); % X�ǽ�ͼ�񻮷ֳɵĵ����ص�ľ���Ĭ�ϵ�map��gray
colormap(map);
%%
for p = 0:.001:1
    colormap(p*hot+(1-p)*pink)
    drawnow
end

%% Knight's Tour
K = knightstour;
dotMatrix = zeros(2,64);
for i = 1:64
    [row,col] = find(K==i,1);
    dotMatrix(1,i) = col;
    dotMatrix(2,i) = row;
end
image(K);
hold on;
dot2dot(dotMatrix);
axis image;
