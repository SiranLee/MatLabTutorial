function dot2dotz(X)
% DOT2DOTZ  Connect the complex vectors from a the collection of complex X
    X_real = real(X)';
    X_imag = imag(X)';
    X = [X_real;X_imag];
    X(:,end+1) = X(:,1); % ����һ�и��Ƶ����ź�����һ�У�ʹ�û�ͼʱ������β����
    plot(X(1,:),X(2,:),'.-','markersize',18,'linewidth',2)
    axis(10*[-1 1 -1 1])
axis square
