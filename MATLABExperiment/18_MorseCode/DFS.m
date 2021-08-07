function DFS(tree)
    S = {tree};
    while ~isempty(S)
        % 弹出栈顶元素
        Node = S{1};
        S = S(2:end);
        % 当该元素不空时访问该元素
        if ~isempty(Node)
            fprintf(' %s',Node{1});
            S = {Node{2},Node{3},S{:}};
        end
    end
end