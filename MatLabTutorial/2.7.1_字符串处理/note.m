%% 字符串处理的例子
test = 'Hello World!';
length(test);
% 取开头到第五个字符的串
sub_string = test(1:5);
% 逆转字符串 end表示末尾 这种方法妙啊
reverse_string = test(end:-1:1);
% 找出字符串中的大写字母的位置
k = find(test>='A'&test<='Z');% 前面已经说过关系运算的法则：矩阵会让每个元素进行比较
% 将所有大写字母转化为小写字母(小写字母比大写字母大32 'a'-'A')
test(k) = test(k) + ('a'-'A');

%% 字符串操作函数
% eval(s) 将字符串s作为matlab的命令执行
clc
t = pi;
m = '[t,sin(t),cos(t)]';
y = eval(m);
% 可以通过abs和double来将字符串矩阵转换为对应的ASCII码矩阵
s1 = 'MATLAB';
a = abs(s1);
b = double(s1);
% 可以通过char(A)来将矩阵A转化为字符串矩阵通过对应的ASCII码字符来转化
char(a+32)
% 字符串的比较主要通过关系运算符或者字符串比较函数来进行比较
% 字符串关系运算符通过ASCII码值的大小进行比较，结果是binary的向量
'wwE221'=='wWe211'
%% 字符串的比较函数
% strcmp(s1,s2): 用来比较字符串s1和s2是否相等，如果相等，返回结果1，否则返回0
clc
strcmp('hello','hello')
% strncmp(s1,s2,n): 用来比较两个字符串的前n个字符是否相等
strncmp('wwe2021','wwe2020',2)
% strcmpi,strncmpi都是在忽略大小写的前提下进行比较
ignore_upper = strcmpi('WorLd','world')

%% 字符串的查找与替换
% find(s1,s2): 返回短字符串在长字符串中的开始位置
clear all
clc
index1 = findstr('helloword','low')
index2 = findstr('low','helloword')
% strrep(s1,s2,s3): 将字符串s1中所有字符串s2替换为字符串上s3
rep_str = strrep('itishiscookies','is','er')












