figure('position',get(0,'screensize'));
axes('position',[0 0 1 1]);
axis(10*[-1 1 -1 1]);
[x,y] = ginput;

H=[x y]';
dot2dot(H);