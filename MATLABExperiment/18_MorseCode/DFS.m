function DFS(tree)
    S = {tree};
    while ~isempty(S)
        % ����ջ��Ԫ��
        Node = S{1};
        S = S(2:end);
        % ����Ԫ�ز���ʱ���ʸ�Ԫ��
        if ~isempty(Node)
            fprintf(' %s',Node{1});
            S = {Node{2},Node{3},S{:}};
        end
    end
end