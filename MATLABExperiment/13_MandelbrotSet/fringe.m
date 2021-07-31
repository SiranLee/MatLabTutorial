function cmap = fringe(m)
  % 这里的cmap为前12行为[1 1 1]为白色，中间13-255行为[0 0 0]为黑色，最后一行为[0.5 0 0]为半红色
  % 这个时候可以画出c的hist图像，会发现图像主要分为三个部分，即对应这里颜色的三个部分
   cmap = zeros(min(m,256),3);
   cmap(end,1) = .5;
   cmap(1:12,:) = 1;
end
