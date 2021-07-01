%% 
clear all
clc
A=[1,2,3;4,5,6];
B=[1,2,3;4,5,6]';
C = A*B
%% 
clear all
clc
% 这个例子求的线段ab之间的黄金分割点，
% 非常妙的一点是使用复数来同构了二维平面，这样使得向量得以使用 miao
a = input('a=');
b = input('b=');
% 这里abs()除了求实数的绝对值之外，还可以用来求复数的模长
distance = abs(b-a)
c = a+0.618*(b-a)