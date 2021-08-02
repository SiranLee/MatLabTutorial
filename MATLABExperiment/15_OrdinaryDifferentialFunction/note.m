%%
x = 0;
y = 1;
h = 1/4;      % ����൱���Ա���x������dx
n = 6*pi/h;
prev_x = x;
plot(x,y,'b.');
hold on;
for k = 1:n
    prev_x = x;
    x = x+h*y;
    y = y-h*prev_x;
    plot(x,y,'b.');
    hold on;
end
axis square
box on % �����Ƿ���ʾ��ǰ������Ŀ�����
%%
syms t;
x = cos(t);
y = sin(t);
fplot(x,y); % ��ƽ��(y(t) vs x(t));
axis equal
%%
acircle = @(t,y) [y(2);-y(1)];
ode23(acircle,[0,2*pi],[0;1]); % ��ֵ������������,�����catch�����ص�ֵ�������ֱ����������״̬���������Ա����ı仯ͼ��
legend('y(1)','y(2)')
% plot(y(:,1),y(:,2),'-o'); % ���ﷵ�ص�y�ǰ��������ģ�ÿһ�б�ʾ��Ӧ��״̬������ָ��t�ķ�Χ�ڵ�ֵ
% axis equal;

%%
acircle = @(t,y) [0,1;-1,0]*[y(1);y(2)];
ode23(acircle,[0,2*pi],[0;1]);
%%
target = @(t,y) [y(2)*y(3);-y(1)*y(3);-0.51*y(1)*y(2)];
[t,y] = ode23(target,[0,12],[0;0;1]);
legend('y1','y2','y3');

%% 
target = @(t,y) [y(2)^3;-y(1)^3];
[t,y] = ode23(target,[0,8],[0;1]);
plot(y(:,1),y(:,2),'-');
axis([-1.5,1.5,-1.5,1.5]);
axis square;
%%
target = @(t,y) [y(2)^5;-y(1)^5];
ode23(target,[0,7.7688],[0;1]);

%%
target = @(t,y) [y(2)^7;-y(1)^7];
ode23(target,[0,8],[0;1]);
axis square;







