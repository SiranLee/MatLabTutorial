%% �ַ������������
test = 'Hello World!';
length(test);
% ȡ��ͷ��������ַ��Ĵ�
sub_string = test(1:5);
% ��ת�ַ��� end��ʾĩβ ���ַ����
reverse_string = test(end:-1:1);
% �ҳ��ַ����еĴ�д��ĸ��λ��
k = find(test>='A'&test<='Z');% ǰ���Ѿ�˵����ϵ����ķ��򣺾������ÿ��Ԫ�ؽ��бȽ�
% �����д�д��ĸת��ΪСд��ĸ(Сд��ĸ�ȴ�д��ĸ��32 'a'-'A')
test(k) = test(k) + ('a'-'A');

%% �ַ�����������
% eval(s) ���ַ���s��Ϊmatlab������ִ��
clc
t = pi;
m = '[t,sin(t),cos(t)]';
y = eval(m);
% ����ͨ��abs��double�����ַ�������ת��Ϊ��Ӧ��ASCII�����
s1 = 'MATLAB';
a = abs(s1);
b = double(s1);
% ����ͨ��char(A)��������Aת��Ϊ�ַ�������ͨ����Ӧ��ASCII���ַ���ת��
char(a+32)
% �ַ����ıȽ���Ҫͨ����ϵ����������ַ����ȽϺ��������бȽ�
% �ַ�����ϵ�����ͨ��ASCII��ֵ�Ĵ�С���бȽϣ������binary������
'wwE221'=='wWe211'
%% �ַ����ıȽϺ���
% strcmp(s1,s2): �����Ƚ��ַ���s1��s2�Ƿ���ȣ������ȣ����ؽ��1�����򷵻�0
clc
strcmp('hello','hello')
% strncmp(s1,s2,n): �����Ƚ������ַ�����ǰn���ַ��Ƿ����
strncmp('wwe2021','wwe2020',2)
% strcmpi,strncmpi�����ں��Դ�Сд��ǰ���½��бȽ�
ignore_upper = strcmpi('WorLd','world')

%% �ַ����Ĳ������滻
% find(s1,s2): ���ض��ַ����ڳ��ַ����еĿ�ʼλ��
clear all
clc
index1 = findstr('helloword','low')
index2 = findstr('low','helloword')
% strrep(s1,s2,s3): ���ַ���s1�������ַ���s2�滻Ϊ�ַ�����s3
rep_str = strrep('itishiscookies','is','er')












