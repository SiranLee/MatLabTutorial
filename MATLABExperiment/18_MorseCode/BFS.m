function BFS(tree)
    Q = {tree};
    while ~isempty(Q)
        % 出队一个元素
        Node = Q{1};
        Q = Q(2:end);
        if ~isempty(Node)
            fprintf(' %s',Node{1});
            Q = {Q{:},Node{2},Node{3}};
        end
    end
end