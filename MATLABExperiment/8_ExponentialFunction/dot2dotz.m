function dot2dotz(X)
% DOT2DOTZ  Connect the complex vectors from a the collection of complex X
    X_real = real(X)';
    X_imag = imag(X)';
    X = [X_real;X_imag];
    X(:,end+1) = X(:,1); % 将第一列复制到扩张后的最后一列，使得画图时可以首尾相连
    plot(X(1,:),X(2,:),'.-','markersize',18,'linewidth',2)
    axis(10*[-1 1 -1 1])
axis square
