%%
clear all
clc
theta = (1/2:4/5:9/2)'*pi
z = exp(i*theta);
p = plot(z);
set(p,'LineWidth',4,'color','red');
set(gcf,'color','white');
axis equal;
%%
clear all
clc
theta = 4*pi/5;
trans = [cos(theta) -sin(theta);sin(theta) cos(theta)];
z0 = [0,-1]';
z = zeros(1,6);
z(1) = z0(1)+i*z0(2);
for n = 2:6
    new_point = trans*z0;
    z(n) = new_point(1)+i*new_point(2);
    z0 = new_point;
end
plot(z');
axis equal
%%
clear all
clc
a = exp(3);
b = 20;
absolute_subtraction = abs(a-b); % a,b的绝对误差
relative_subtraction = absolute_subtraction / a; % 相对于精确值的误差
relative_subtraction*100; % 百分比误差

%%
clear all
clc
t = -10:-1:-20;
standards = exp(t);
fprintf('%5s %10.15s %25.15s %15.15s\n', '迭代总次数','实际值','估算值','相对误差');
for i = 1:10
    [s,n] = expex(t(i));
    relative_error = abs(standards(i)-s)/standards(i);
    fprintf('%5d %25.15g %25.15g %15g\n', n,standards(i),s,relative_error);
end



