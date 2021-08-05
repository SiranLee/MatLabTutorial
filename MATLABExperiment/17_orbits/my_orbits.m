function my_orbits(n)
    if nargin < 2
        gui = true;
    end
    if nargin < 1
        n = 9; % û���������ʱ��Ĭ����������Ϊ9
    end
    
    % P: n-3�ľ��󣬱�ʾn����������ά�ռ��е�λ��
    % V: n-3�ľ��󣬱�ʾn��������ʱ��t���ٶȣ���һ��ʸ��
    % M: n-1����������ʾn��������Ե�����
    [P V M] = initialize_orbits(n);
    H = initialize_graphics(P,gui);
    
    steps = 20; % ��ͼ���µ����ڣ�ÿ����20�������λ�ñ仯�ͻ�һ��ͼ
    t = 0;
    
    while get(H.stop,'value') == 0 % ֹͣ��ťû�б������һֱģ����������
        delta = get(H.speed,'value')/20*steps;
        for k = 1:steps % ÿһ������һ�������V��P
            % �����V����������������������ÿ�μ��㿪ʼʱ��Ҫ�½�һ��G����(ÿ�μ���λ�ú�ҲҪ)
            G = zeros(size(P));
            for i = 1:n
                for j = [1:i-1 i+1:n] % ����ÿ������i����������(i������j)����������
                    r = P(i,:)-P(j,:); % ��i���������j������֮��ľ�������
                    G(i,:) = G(i,:) + M(j)*r/norm(r)^3 % norm(r)�ǵڶ��������������r��ŷ����ó���
                    % ʵ����G��ʾ�ļ��ٶȣ���������������������������ֻ��Ҫֱ�ӼӾͿ����ˣ����ÿ��Ǽн�
                    % ����ʵ�����ǰ� M(j)/norm(r)^3
                    % ת��Ϊ���������ʽ���������������������Ӷ�ʹ�����������Ϊ��
                end
            end
            % ����G���Ѿ�����ÿ���������ܵ��ļ��ٶȣ����Կ�ʼ�����ٶ�V��λ��P
            V = V + delta*G;
            P = P + dleta*V;
        end
        % 20��������֮�󣬸���ͼ��
        t = t + steps*delta;
        update_plot(P,t,gui);
    end
    finalize_graphics(H,gui);
end

function [P,V,M] = initialize_orbits(n)

   switch n

%% Two bodies

   case 2

      % Initial position, velocity, and mass for two bodies.
      % Resulting orbits are ellipses.

      P = [-5  0  0
           10  0  0];
      V = [ 0  -1  0
            0   2  0];
      M = [200  100  0];

%% Three bodies

   case 3

      % Initial position, velocity, and mass for the artificial
      % planar three body problem discussed in the text.

      P = [ 0   0   0
           10   0   0
            0  10   0]; 
      V = [-1  -3   0
            0   6   0
            3  -3   0];
      M = [300  200  100]';

%% Nine bodies

   case 9

      % The solar system.
      % Obtain data from Jet Propulsion Laboratory HORIZONS.
      % http://ssd.jpl.nasa.gov/horizons.cgi  
      % Ephemeris Type: VECTORS
      % Coordinate Orgin: Sun (body center)
      % Time Span: 2008-7-24 to 2008-7-25
      
      sol.p = [0 0 0];
      sol.v = [0 0 0];
      sol.m = 1.9891e+30;
   
      ear.p = [ 5.28609710e-1 -8.67456608e-1  1.28811732e-5];
      ear.v = [ 1.44124476e-2  8.88154404e-3 -6.00575229e-7];
      ear.m = 5.9736e+24;
      
      mar.p = [-1.62489742e+0 -2.24489575e-1  3.52032835e-2];
      mar.v = [ 2.43693131e-3 -1.26669231e-2 -3.25240784e-4];
      mar.m = 6.4185e+23;
      
      mer.p = [-1.02050180e-2  3.07938393e-1  2.60947941e-2];
      mer.v = [-3.37623365e-2  9.23226497e-5  3.10568978e-3];
      mer.m = 3.302e+23;
      
      ven.p = [-6.29244070e-1  3.44860019e-1  4.10363705e-2];
      ven.v = [-9.80593982e-3 -1.78349270e-2  3.21808697e-4];
      ven.m = 4.8685e+24;
      
      jup.p = [ 1.64800250e+0 -4.90287752e+0 -1.65248109e-2];
      jup.v = [ 7.06576969e-3  2.76492888e-3 -1.69566833e-4];
      jup.m = 1.8986e+27;
      
      sat.p = [-8.77327303e+0  3.13579422e+0  2.94573194e-1];
      sat.v = [-2.17081741e-3 -5.26328586e-3  1.77789483e-4];
      sat.m = 5.6846e+26;
      
      ura.p = [ 1.97907257e+1 -3.48999512e+0 -2.69289277e-1];
      ura.v = [ 6.59740515e-4  3.69157117e-3  5.11221503e-6];
      ura.m = 8.6832e+25;
      
      nep.p = [ 2.38591173e+1 -1.82478542e+1 -1.74095745e-1];
      nep.v = [ 1.89195404e-3  2.51313400e-3 -9.54022068e-5];
      nep.m = 1.0243e+26;
   
      P = [sol.p; ear.p; mar.p; mer.p; ven.p; jup.p; sat.p; ura.p; nep.p];
      V = [sol.v; ear.v; mar.v; mer.v; ven.v; jup.v; sat.v; ura.v; nep.v];
      M = [sol.m; ear.m; mar.m; mer.m; ven.m; jup.m; sat.m; ura.m; nep.m];
   
      % Scale mass by solar mass.
      M = M/sol.m;
   
      % Scale velocity to radians per year.
      V = V*365.25/(2*pi);
   
      % Adjust sun's initial velocity so that system total momentum is zero.
      V(1,:) = -sum(diag(M)*V);

   otherwise

      error('No initial data for %d bodies',n)

   end  % switch

end

function  H = initialize_graphics(P,gui,erasemode)
% Initialize graphics and user interface controls
% H = initialize_graphics(P,gui)
% H = handles, P = positions, gui = true or false for gui or static plot.

   dotsize = [36 18 16 12 18 30 24 20 18]';
   color = [4 3 0     % gold
            0 0 3     % blue
            4 0 0     % red
            2 0 2     % magenta
            1 1 1     % gray
            3 0 0     % dark red
            4 2 0     % orange
            0 3 3     % cyan
            0 2 0]/4; % dark green

   clf
   shg
   set(gcf,'menubar','none','numbertitle','off','name','Orbits') 
   n = size(P,1);
   s = max(sqrt(diag(P*P')));
   if n <= 3, s = 2*s; end
   axis([-s s -s s -s/4 s/4])
   axis square
   if n <= 3, view(2), end
   box on
   for i = 1:n
      H.bodies(i) = line(P(i,1),P(i,2),P(i,3),'color',color(i,:), ...
         'marker','.','markersize',dotsize(i),'userdata',dotsize(i));
   end
   if ~erasemode
      set(gca,'clipping','off')
   end

   H.clock = title('0 years','fontweight','normal');
   H.stop = uicontrol('string','stop','style','toggle', ...
     'units','normal','position',[.90 .02 .08 .04]);
   if n < 9
      maxsp = 1;
   else
      maxsp = 10;
   end
   if gui
      H.speed = uicontrol('style','slider','min',0,'value',maxsp/4, ...
         'max',maxsp,'units','normal','position',[.02 .02 .30 .04], ...
         'sliderstep',[1/20 1/20]);
      uicontrol('string','trace','style','toggle','units','normal', ...
         'position',[.34 .02 .06 .04],'callback',@tracer,'value',0);
      uicontrol('string','in','style','pushbutton','units','normal', ...
         'position',[.42 .02 .06 .04],'callback','zoomer(1/sqrt(2))')
      uicontrol('string','out','style','pushbutton','units','normal', ...
         'position',[.50 .02 .06 .04],'callback','zoomer(sqrt(2))')
      uicontrol('string','x','style','pushbutton','units','normal', ...
         'position',[.58 .02 .06 .04],'callback','view(0,0)')
      uicontrol('string','y','style','pushbutton','units','normal', ...
         'position',[.66 .02 .06 .04],'callback','view(90,0)')
      uicontrol('string','z','style','pushbutton','units','normal', ...
         'position',[.74 .02 .06 .04],'callback','view(0,90)')
      uicontrol('string','3d','style','pushbutton','units','normal', ...
         'position',[.82 .02 .06 .04],'callback','view(-37.5,30)')
   else
      H.traj = P;
      H.speed = uicontrol('value',maxsp,'vis','off');
   end
   set(gcf,'userdata',H)
   drawnow
end

function H = update_plot(P,t,gui,erasemode)
   H = get(gcf,'userdata');
   set(H.clock,'string',sprintf('%10.2f years',t/(2*pi)))
   if erasemode
      for i = 1:size(P,1)
         set(H.bodies(i),'xdata',P(i,1),'ydata',P(i,2),'zdata',P(i,3))
      end
   else
      trace = isequal(get(H.bodies(1),'type'),'animatedline');
      for i = 1:size(P,1)
         if trace
            addpoints(H.bodies(i),P(i,1),P(i,2),P(i,3))
         else
            set(H.bodies(i),'xdata',P(i,1),'ydata',P(i,2),'zdata',P(i,3))
         end
      end
   end
   if ~gui
      H.traj(:,:,end+1) = P;
      n = size(H.traj,1);
      switch n
         case 2, set(H.stop,'value',t > 11)
         case 3, set(H.stop,'value',t > 22.5)
         case 9, set(H.stop,'value',t > 200)
      end
   end
   drawnow
end

function finalize_graphics(H,gui)
   delete(findobj('type','uicontrol'))
   uicontrol('string','close','style','pushbutton', ...
     'units','normal','position',[.90 .02 .08 .04],'callback','close');
   if ~gui
      n = size(H.traj,1);
      for i = 1:n
         line(squeeze(H.traj(i,1,:)),squeeze(H.traj(i,2,:)), ...
            squeeze(H.traj(i,3,:)),'color',get(H.bodies(i),'color'), ...
            'linewidth',2)
      end
   end
end
