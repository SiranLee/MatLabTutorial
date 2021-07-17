function Sierpinski()
   clear all
    clc
    shg; % ����һ���Ѿ����ڵ�ͼ�����ߴ���һ���µ�ͼ��
    clf reset
    set(gcf,'Color','white','menubar','none','name','Fractal Fern'); % ʹ��set��gcfҲ����ͼ���Զ���
    x = [0 0]'; % ���ó�ʼ��
    h = animatedline(x(1),x(2)); % �ѵ㻭��ȥ,����ʹ��plot,��Ϊͼ��Ḳ�ǣ�ʹ��animatedline����
    dotColor = [0 2/3 0]; % ��RGB�������õ����ɫ
    set(h,'markersize',1,'Color',dotColor,'LineStyle','none','Marker','.'); % ����LineStyleΪnone�Ϳ�ֻ����
    axis([0 1 0 1]);
    %axis([0 2 0 2]);
    %axis off;
    stop = uicontrol('style','toggle','string','stop','background','white'); 
    % toggle��ʾstopȡֵΪ0 1����������ť�͸ı���״̬������Ҫ���ⶨ����ص�����
    drawnow
    % ͳ�����еĵ���
    cnt = 0;
    % ���÷���ӳ��
    A = [1/2 0;0 1/2];
    b1 = [0 0]';
    b2 = [1/2 0]';
    b3 = [1/4 sqrt(3)/4]';
    % ����ӳ��ִ�еĸ��ʾ���
    p = [1/3 2/3 1];
    tic
    while ~get(stop,'value') % ��ȡui�ؼ�stop��value����ֵ
        r = rand; % ȡ������������жϵ���ִ����һ������ӳ��
        if r<p(1)
            x = A*x+b1;
        elseif r<p(2)
            x = A*x+b2;
        else
            x = A*x+b3;
        end
        %addpoints(h,x(2),x(1));% addpoints��animatedline����ʹ��������ӵ�
        addpoints(h,x(1),x(2));% addpoints��animatedline����ʹ��������ӵ�
        cnt = cnt + 1;
        drawnow
    end
    t = toc; % ��ȡ��ʱ���е�ʱ��
    s = sprintf('%8.0f points in %6.3f seconds',cnt,t);% �������ַ���
    text(-1.5,0.5,s);
    % ����϶���stop��ֵ�ı���ˣ�˵�������stop��ť������stop��Ϊclose,callbackָ���µ�close��ť�������ǹر�ͼ��
    set(stop,'style','pushbutton','callback','close(gcf)','string','close');
    
    
    
    