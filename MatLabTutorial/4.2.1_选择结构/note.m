%%
% 输入一个整数，若为奇数则输出平方根，否则输出立方根
clear all
clc;
x = input('请输入x的值:');
% 一般取模数都用rem函数
if rem(x,2) == 1
    y = sqrt(x);
else
    y = x^(1/3);
end
y;
%%
clear all
clc
x = input('请输入一个字符','s');
if x>='A' && x<='Z'
    disp(lower(x))
elseif x>='a' && x<='z'
    disp(upper(x))
elseif x>='0' && x<='9'
    disp(str2double(x)^2)
else
    disp(x)
end
%%
clear all
clc
c = input('请输入一个单词: ','s');
switch c(1) % 取得c的第一个字母
    % 常常会使用num2cell来转化为单元数据
    case {'A','E','I','O','U','a','e','i','o','u'} % case后面可以跟单元数据，也就是大括号括起来的数据
        disp([c,'以元音字母开头']) % 连接字符串
    otherwise
        disp([c,'以辅音字母开头'])
end
%%
% 上面例子的另外一种写法
clear all
clc
c = input('请输入一个单词:','s');
if findstr(c(1),'AEIOUaeiou')>0 % findstr(x,p)返回x在p中的开始位置
    disp([c,'以元音字母开头'])
else
    disp([c,'以辅音字母开头'])
end









