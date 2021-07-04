%% Lotka-Volterra ģ��
clear all
clc
rabbitFox = @(t,x) [x(1)*(2-0.01*x(2));x(2)*(-1+0.01*x(1))];
[t,x] = ode45(rabbitFox,[0,30],[100,200]);
subplot(1,2,1); plot(t,x(:,1),'-',t,x(:,2),'-*'); legend('x(1)-��������','x(2)-��������');
subplot(1,2,2); plot(x(:,1),x(:,2));