function [c,h] = funny(x)
    c = []; % 定义非线性不等式
    h = x(2)-x(1)^2; % 定义非线性等式 y = x^2
end