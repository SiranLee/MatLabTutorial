function [y,n] = gauseidel(A,b,x0,ep)
    D = diag(diag(A));
    U = -triu(A,1);% ��ȡ����A�����Խ������ϵ�Ԫ��
    L = -tril(A,-1); % ��ȡ����A�����Խ������µ�Ԫ��
    B = (D-L)\U;
    f = (D-L)\b;
    y = B*x0+f;
    n=1;
    while norm(y-x0)>=ep
        x0 = y;
        y = B*x0+f;
        n = n+1;
    end
end