%% ͼ�α�ע
%% title():
%     �÷�1: ֱ�Ӹ�һ���ַ���
%     �÷�2: �ô������������ַ��� title({'����1','����2'}) ��ʾ���еı���
%     �÷�3: ʹ��LeTax��ʽ�Ŀ��Ʒ������⣬ʹ��latex�Ĳ�����Ҫ�ô�����������: title('y = cos{\omega}t')
%     �÷�4: ���������õı���: title('����'��������������ֵ)
%            Color ����: title('����','Color','r') ��ɫ����ֵͬplot��
%            FontSize ����: title('����','FontSize',24)

%% xlabel() & ylabel()
%     �÷�: ֱ�Ӹ��ַ��������Գ���latex�Ŀ����ַ�

%% text���� ���ڸ�ͼ��ӱ�ע
% text(x,y,˵��), ˵���п��Գ���latex�����ַ�
x = linspace(0,2*pi,100);
plot(x, sin(x))
text(0,0,'start')
text(5/6*pi,0.6,'\leftarrow sin(x)')

%% legend() ���� ��ͼ��



%% �������
%% axis���� ���ڿ���x���y��ķ�Χ: axis([xmin,xmax,ymin,ymax])
%          axis equal: �ݣ���������õȳ��̶� ��λԪ��һ��������
%          axis off: ȡ��������
%          axis on: ��ʾ������
x = 0:0.05:2*pi;
plot(sin(x),cos(x),'b')
axis([-2,2,-2,2]);
grid on % ��������grid off �ر����� axis��grid��plot����ã����Ϊ����ͼ����������
box off % �رձ߿�box on �����߿�
axis equal

%% ͼ�α���
%% ����matlab��ͼʱ���Զ�����ǰһ�λ���ͼ��������Ҫ��һ��ͼ�񴰿��л����ͼ��ʱ����ʹ��
% hold on ��������matlab���⸲��֮ǰһ�λ���ͼ��
clear all
clc
x = 0:0.05:2*pi;
e = ones(1,length(x));
plot(x,sin(x),'r-.');
hold on % ���ڻ���һ��֮��
plot(x,cos(x),'b:');
hold on
plot(x,e,'g');
axis([0,2*pi,-2,2]);


%% ͼ�δ��ڵķָ�
%% subplot(m,n,p) ���У���һ��ͼ�񴰿ڷָ��m��n�е�ͼ�ξ���pָ���ǵ�ǰ���
subplot(1,2,1);
x = 0:0.05:2*pi;
plot(x,sin(x),'r-.');
axis([0,2*pi,-2,2]);
subplot(1,2,2);
plot(x,cos(x),'b-');
axis([0,2*pi,-2,2]);

%% ���ͼ�δ��� figure(n) ����
%%
figure(1)
x = 0:0.05:2*pi;
plot(x,sin(x),'r-.');
axis([0,2*pi,-2,2]);
figure(2)
x = 0:0.05:2*pi;
plot(x,cos(x),'r-.');
axis([0,2*pi,-2,2]);



