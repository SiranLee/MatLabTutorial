function my_fern()
    shg; % 激活一个已经存在的图窗或者创建一个新的图窗
    clf reset
    set(gcf,'Color','white','menubar','none','name','Fractal Fern'); % 使用set对gcf也就是图窗自定义
    x = [.5,.5]'; % 设置初始点
    h = animatedline(x(1),x(2)); % 把点画上去,不能使用plot,因为图像会覆盖，使用animatedline来画
    dotColor = [0 2/3 0]; % 用RGB向量设置点的颜色
    set(h,'markersize',1,'Color',dotColor,'LineStyle','none','Marker','.'); % 设置LineStyle为none就可只画点
    axis([-3 3 0 10]);
    axis off;
    stop = uicontrol('style','toggle','string','stop','background','white'); 
    % toggle表示stop取值为0 1，点击这个按钮就改变其状态，不需要额外定义其回调函数
    drawnow
    % 统计所有的点数
    cnt = 0;
    % 设置仿射映射
    A1 = [.85 .04;-.04,.85]; b1 = [0 1.6]';
    A2 = [.20 -.26;.23 .22]; b2 = [0,1.6]';
    A3 = [-.15 .28;.26,.24]; b3 = [0,.44]';
    A4 = [0 0;0 .16];
    % 仿射映射执行的概率矩阵
    p = [.85 .92 .99 1];
    tic
    while ~get(stop,'value') % 获取ui控件stop的value属性值
        r = rand; % 取随机数，用来判断到底执行哪一个仿射映射
        if r<p(1)
            x = A1*x+b1;
        elseif r<p(2)
            x = A2*x+b2;
        elseif r<p(3)
            x = A3*x+b3;
        else
            x = A4*x;
        end
        % A1有85%的概率被选到(几何概型)，使用随机数+if判断的方式来模拟按概率发生发的方式
        addpoints(h,x(1),x(2));% addpoints和animatedline搭配使用用于添加点
        cnt = cnt + 1;
        drawnow
    end
    t = toc; % 读取计时器中的时间
    s = sprintf('%8.0f points in %6.3f seconds',cnt,t);% 构造自字符串
    text(-1.5,0.5,s);
    % 这里肯定是stop的值改变过了，说明点击了stop按钮，设置stop变为close,callback指明新的close按钮的作用是关闭图窗
    set(stop,'style','pushbutton','callback','close(gcf)','string','close');
    
    
    
    