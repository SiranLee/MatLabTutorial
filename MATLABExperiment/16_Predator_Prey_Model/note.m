%%
k = 1;
eta = 1;
mu = 20;
t = 0:1/32:8;
y = mu*eta*exp(k*t)./(eta*exp(k*t)+mu-eta);
plot(t,[y;exp(t)]); % 与 plot(t,y,t,exp(t)) 同理 
axis([0 8 0 22]);

%%
clc
clear all
k = 1;
eta = 1;
mu = 20;
target = @(t,y) k*(1-y/mu)*y;
ode45(target,[0,8],eta);

%%
clc
clear all
mu = [300;200]; % 环境的最大承载量
eta = [320;180]; % 初始值
predator_prey = @(t,y) [1;-1].*flipud(1-y./mu).*y;
period = 6.5357;
[t,y] = ode45(predator_prey,[0 3*period],eta);
plot(t,y(:,1),'bo-',t,y(:,2),'ro-');

%%
clear all
clc
mu = [300 200]';     % Equilibrium.
eta = [400 100]';    % Initial conditions.
pred_prey = @(t,y) [1;-1].*[1-y(1)/(2*eta(1));1].*flipud(1-y./mu).*y;
ode45(pred_prey,[0 20],eta);





