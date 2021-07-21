function wigglez(X)
% WIGGLEZ  Dynamic matrix multiplication.
%          X是复数的集合

set(gcf,'menubar','none','numbertitle','off','name','Wiggle')
if nargin < 1
   X = house;
end

thetamax = 0.1;
delta = .025;
t = 0;
stop = uicontrol('string','stop','style','toggle');
while ~get(stop,'value')
   theta = (4*abs(t-round(t))-1) * thetamax;
   G = exp(i*theta)  ;%[cos(theta) sin(theta); -sin(theta) cos(theta)];[cos(theta) sin(theta);sin(theta) -cos(theta)]
   Y = G.*X;
   dot2dotz(Y);
   drawnow
   t = t + delta;
end
set(stop,'string','close','value',0,'callback','close(gcf)')