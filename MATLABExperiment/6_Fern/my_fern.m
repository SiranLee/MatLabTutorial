function my_fern()
    shg; % ����һ���Ѿ����ڵ�ͼ�����ߴ���һ���µ�ͼ��
    clf reset
    set(gcf,'Color','white','menubar','none','name','Fractal Fern'); % ʹ��set��gcfҲ����ͼ���Զ���
    x = [.5,.5]'; % ���ó�ʼ��
    h = animatedline(x(1),x(2)); % �ѵ㻭��ȥ,����ʹ��plot,��Ϊͼ��Ḳ�ǣ�ʹ��animatedline����
    dotColor = [0 2/3 0]; % ��RGB�������õ����ɫ
    set(h,'markersize',1,'Color',dotColor,'LineStyle','none','Marker','.'); % ����LineStyleΪnone�Ϳ�ֻ����
    axis([-3 3 0 10]);
    axis off;
    stop = uicontrol('style','toggle','string','stop','background','white'); 
    % toggle��ʾstopȡֵΪ0 1����������ť�͸ı���״̬������Ҫ���ⶨ����ص�����
    drawnow
    % ͳ�����еĵ���
    cnt = 0;
    % ���÷���ӳ��
    A1 = [.85 .04;-.04,.85]; b1 = [0 1.6]';
    A2 = [.20 -.26;.23 .22]; b2 = [0,1.6]';
    A3 = [-.15 .28;.26,.24]; b3 = [0,.44]';
    A4 = [0 0;0 .16];
    % ����ӳ��ִ�еĸ��ʾ���
    p = [.85 .92 .99 1];
    tic
    while ~get(stop,'value') % ��ȡui�ؼ�stop��value����ֵ
        r = rand; % ȡ������������жϵ���ִ����һ������ӳ��
        if r<p(1)
            x = A1*x+b1;
        elseif r<p(2)
            x = A2*x+b2;
        elseif r<p(3)
            x = A3*x+b3;
        else
            x = A4*x;
        end
        % A1��85%�ĸ��ʱ�ѡ��(���θ���)��ʹ�������+if�жϵķ�ʽ��ģ�ⰴ���ʷ������ķ�ʽ
        addpoints(h,x(1),x(2));% addpoints��animatedline����ʹ��������ӵ�
        cnt = cnt + 1;
        drawnow
    end
    t = toc; % ��ȡ��ʱ���е�ʱ��
    s = sprintf('%8.0f points in %6.3f seconds',cnt,t);% �������ַ���
    text(-1.5,0.5,s);
    % ����϶���stop��ֵ�ı���ˣ�˵�������stop��ť������stop��Ϊclose,callbackָ���µ�close��ť�������ǹر�ͼ��
    set(stop,'style','pushbutton','callback','close(gcf)','string','close');
    
    
    
    