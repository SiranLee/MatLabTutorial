function ch = decode(code)
    M = morse_tree;
    for k = 1:length(code)
        code_ch = code(k);
        if code_ch == '.'
            M = M{2};     % ����������
        elseif code_ch == '-'
            M = M{3};     % ����������
        end
        % ���һ�μ��֮����Ҫ��һ�µ�ǰ�ǲ��ǵ�void��
        if isempty(M)     % ���MΪ�գ�˵���ߵ���Ҷ�ӽڵ�֮����
            ch = '*';
            return;
        end
    end
    ch = M{1};
end
            