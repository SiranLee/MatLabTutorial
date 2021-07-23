function M = magic_db_odd(n)
%MAGIC_DB_ODD ��˫ż��n��n��ħ����
    M = reshape(1:n^2,n,n)'; % ��1��n^2��������ع�Ϊn��n�е�����(������)
    [I,J] = ndgrid(1:n);
    K = fix(mod(I,4)/2) == fix(mod(J,4)/2); % fix(a)��a����0�ķ�����������
    M(k) = n^2+1-M(k); % M(k)����������k�з�0λ����M�ж�Ӧ��Ԫ��
end

