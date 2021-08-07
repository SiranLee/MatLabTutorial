function DFS_recur(tree)
    if nargin < 1
        tree = {morse_tree};
    end
    tree = {tree};
    Node = tree{1};
    if ~isempty(Node)
        fprintf(' %s',Node{1});
        DFS_recur(Node{2});
        DFS_recur(Node{3});
    end
end