function ch = decode(code)
    M = morse_tree;
    for k = 1:length(code)
        code_ch = code(k);
        if code_ch == '.'
            M = M{2};     % 向左子树走
        elseif code_ch == '-'
            M = M{3};     % 向右子树走
        end
        % 完成一次检查之后，需要看一下当前是不是到void了
        if isempty(M)     % 如果M为空，说明走到了叶子节点之后了
            ch = '*';
            return;
        end
    end
    ch = M{1};
end
            