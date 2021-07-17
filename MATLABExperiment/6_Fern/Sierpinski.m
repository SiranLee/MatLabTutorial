function Sierpinski()
   clear all
    clc
    shg; % 激活一个已经存在的图窗或者创建一个新的图窗
    clf reset
    set(gcf,'Color','white','menubar','none','name','Fractal Fern'); % 使用set对gcf也就是图窗自定义
    x = [0 0]'; % 设置初始点
    h = animatedline(x(1),x(2)); % 把点画上去,不能使用plot,因为图像会覆盖，使用animatedline来画
    dotColor = [0 2/3 0]; % 用RGB向量设置点的颜色
    set(h,'markersize',1,'Color',dotColor,'LineStyle','none','Marker','.'); % 设置LineStyle为none就可只画点
    axis([0 1 0 1]);
    %axis([0 2 0 2]);
    %axis off;
    stop = uicontrol('style','toggle','string','stop','background','white'); 
    % toggle表示stop取值为0 1，点击这个按钮就改变其状态，不需要额外定义其回调函数
    drawnow
    % 统计所有的点数
    cnt = 0;
    % 设置仿射映射
    A = [1/2 0;0 1/2];
    b1 = [0 0]';
    b2 = [1/2 0]';
    b3 = [1/4 sqrt(3)/4]';
    % 仿射映射执行的概率矩阵
    p = [1/3 2/3 1];
    tic
    while ~get(stop,'value') % 获取ui控件stop的value属性值
        r = rand; % 取随机数，用来判断到底执行哪一个仿射映射
        if r<p(1)
            x = A*x+b1;
        elseif r<p(2)
            x = A*x+b2;
        else
            x = A*x+b3;
        end
        %addpoints(h,x(2),x(1));% addpoints和animatedline搭配使用用于添加点
        addpoints(h,x(1),x(2));% addpoints和animatedline搭配使用用于添加点
        cnt = cnt + 1;
        drawnow
    end
    t = toc; % 读取计时器中的时间
    s = sprintf('%8.0f points in %6.3f seconds',cnt,t);% 构造自字符串
    text(-1.5,0.5,s);
    % 这里肯定是stop的值改变过了，说明点击了stop按钮，设置stop变为close,callback指明新的close按钮的作用是关闭图窗
    set(stop,'style','pushbutton','callback','close(gcf)','string','close');
    
    
    
    