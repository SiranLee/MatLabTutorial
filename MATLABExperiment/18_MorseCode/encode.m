function code = encode(ch)
    % 采用深度优先遍历来编码
    S = {morse_tree};
    D = {''};            % D是记录code的元胞数组，表示到当前元素为止的编码，与S共进(入栈)退(出栈)
    while ~isempty(S)
        Node = S{1};
        S = S(2:end);
        code = D{1};     % code表示到当前元素Node为止的编码
        D = D(2:end);    % S和D共同出栈待检当前元素
        if ~isempty(Node)
            if Node{1} == ch
                return;  % 如果匹配说明找到了该ch,此时code中即是该ch的编码
            else
                S = {Node{2},Node{3},S{:}};
                D = {[code '.'] [code '-'] D{:}};    % 共同压栈，将对应Node的code压入栈中
            end
        end
    end
    code = '*';          % 到这里就说明遍历完树了都没有进入 Node{1} == ch 的判断中，说明ch是MorseTree之外的字符
end