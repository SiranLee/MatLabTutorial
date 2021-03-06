%%
n = 100;
z0 = 0.99+0.99i;
complexes = size(1,n+1);
complexes(1) = z0;
for i = 2:n+1
    complexes(i) = complexes(i-1)^2;
end;
real_parts = real(complexes);
imag_parts = imag(complexes);
dot2dot([real_parts;imag_parts]);
axis([-1,1,-1,1]);
%%
clc
clear all
z0 = 0.22-0.54i;
z = 0;
for i = 1:30
    z = z^2+z0;
    disp(z)
end
%%
clc
clear all;
z0 = .22-.54i;%考察z0是否在mandelbrot集中
z = 0;
while abs(z)<2
    z = z^2+z0;
    disp(z);
end
%%
clc;
clear all;
real_z0 = 0.205:0.005:0.245;
imag_z0 = (0.520:0.005:0.560)*i;
n = length(real_z0);
m = length(imag_z0);
z0 = real_z0+imag_z0';% 以imag_z0为列
depth = 512;
z = 0;
k = 0;
depth_matrix = zeros(m,n);
for i = 1:n
    for j = 1:m
        while abs(z)<2&&k<depth
            z = z^2+z0(i,j);
            k = k+1;
        end
        depth_matrix(i,j) = k;
        z = 0;
        k = 0;% 每检验完一个数就重新置0
    end
end

%%
clear all
clc
x = -2:0.005:1;
y = -1.5:0.005:1.5; % 这里y可以是列向量也可以是行向量，只要保证它放在meshgrid的第二个参数位置就可以了
n = length(x);
[X,Y] = meshgrid(x,y); % 产生网格矩阵: X是按行拷贝x向量，Y是按列拷贝y向量
z0 = X+i*Y;
z = zeros(n,n); % 记录迭代的z
c = zeros(n,n); % 记录每个z0在半径为2的复平面"单位"圆中的最大迭代次数
depth = 512;
for k = 1:depth
    z = z.^2+z0;
    indexes = abs(z)<2; % 返回一个逻辑矩阵，指明对应位置的z是否超出了范围
    c(indexes) = k; % 将当前的depth赋给还未超出范围的对应位置的元素
end
% c中小于depth的元素表示这些元素所对应的z0在小于depth次的迭代中超出了所给范围，也就是经过不到depth次的步数中逃逸了
% 而c中等于depth的元素表示这部分所对应的z0很有可能在集合mandelbrot中
image(c);% c的每个元素指定图像的 1 个像素的颜色。生成的图像是一个 m×n 像素网格，其中 m 是列数，n 是 C 中的行数。
axis image;
colormap(flipud(jets(depth)));
% jet是一个颜色的映射(map),默认是64×3的矩阵，表示用64个三维向量(RGB)来表示这整个map，
% 而jet(32)返回一个32×3的矩阵，表示用32个三维向量来表示这个map
% 用32是因为，这里c中最大的数为32，这样可以保证范围合理
% flipud(jet(32))表示将jet中冷暖色调互换
% colormap(map)则用来设置图形窗口当前的colormap

% 迷幻特效
spinmap(10);% spingmap(t): 周期性的旋转(将每个RGB值加2偏移)颜色图，持续10*t秒


    








