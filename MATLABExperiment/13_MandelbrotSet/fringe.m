function cmap = fringe(m)
  % �����cmapΪǰ12��Ϊ[1 1 1]Ϊ��ɫ���м�13-255��Ϊ[0 0 0]Ϊ��ɫ�����һ��Ϊ[0.5 0 0]Ϊ���ɫ
  % ���ʱ����Ի���c��histͼ�񣬻ᷢ��ͼ����Ҫ��Ϊ�������֣�����Ӧ������ɫ����������
   cmap = zeros(min(m,256),3);
   cmap(end,1) = .5;
   cmap(1:12,:) = 1;
end