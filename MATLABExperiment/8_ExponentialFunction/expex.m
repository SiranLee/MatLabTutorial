function expex(t)
    s = 1; % �ݼ����ĺ�
    r = 0; % �ж�����
    term = 1; % �ݼ����е�ÿһ��
    n = 0; % ָ�������˵ڼ���
    tic
    while r~= s % ���ǰһ��ͺ�һ�������ȣ������������˳�ѭ��
        r = s;
        n = n+1;
        term = (t/n)*term;
        s = s+term;
    end
    toc
    s
end