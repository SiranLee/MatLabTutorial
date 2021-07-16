%%
clear all
clc
A = [0.85 0.04;-0.04 0.85];
b = [0 1.6]';
x = [2 2]';
trans_x = A*x+b;
quiver(0,0,x(1),x(2));
hold on;
quiver(0,0,trans_x(1),trans_x(2));
axis([0 4 0 4]);
text(trans_x(1),trans_x(2),'Trans\_X');

%%
