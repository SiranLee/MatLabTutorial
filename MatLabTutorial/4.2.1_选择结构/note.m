%%
% ����һ����������Ϊ���������ƽ�������������������
clear all
clc;
x = input('������x��ֵ:');
% һ��ȡģ������rem����
if rem(x,2) == 1
    y = sqrt(x);
else
    y = x^(1/3);
end
y;
%%
clear all
clc
x = input('������һ���ַ�','s');
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
c = input('������һ������: ','s');
switch c(1) % ȡ��c�ĵ�һ����ĸ
    % ������ʹ��num2cell��ת��Ϊ��Ԫ����
    case {'A','E','I','O','U','a','e','i','o','u'} % case������Ը���Ԫ���ݣ�Ҳ���Ǵ�����������������
        disp([c,'��Ԫ����ĸ��ͷ']) % �����ַ���
    otherwise
        disp([c,'�Ը�����ĸ��ͷ'])
end
%%
% �������ӵ�����һ��д��
clear all
clc
c = input('������һ������:','s');
if findstr(c(1),'AEIOUaeiou')>0 % findstr(x,p)����x��p�еĿ�ʼλ��
    disp([c,'��Ԫ����ĸ��ͷ'])
else
    disp([c,'�Ը�����ĸ��ͷ'])
end









