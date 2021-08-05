m = 50; % total steps of random walk;
x = cumsum(randn(m,1));
y = cumsum(randn(m,1));
% cumsum: cumulative sum,�ۼ���ͣ�
% ��xΪ��: ��randn(m,1)������: r1,r2,r3,...,rm��m�����������ôcumsum(randn(m,1))
% �Ľ������һ������Ϊm������x,x1 = r1;x2 = r1+r2;x3 = r1+r2+r3;...��������
plot(x,y,'.-');
s = 2*sqrt(m); % sqrt(m)��������ߵı߽�
axis([-s s -s s]);
