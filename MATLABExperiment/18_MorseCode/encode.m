function code = encode(ch)
    % ����������ȱ���������
    S = {morse_tree};
    D = {''};            % D�Ǽ�¼code��Ԫ�����飬��ʾ����ǰԪ��Ϊֹ�ı��룬��S����(��ջ)��(��ջ)
    while ~isempty(S)
        Node = S{1};
        S = S(2:end);
        code = D{1};     % code��ʾ����ǰԪ��NodeΪֹ�ı���
        D = D(2:end);    % S��D��ͬ��ջ���쵱ǰԪ��
        if ~isempty(Node)
            if Node{1} == ch
                return;  % ���ƥ��˵���ҵ��˸�ch,��ʱcode�м��Ǹ�ch�ı���
            else
                S = {Node{2},Node{3},S{:}};
                D = {[code '.'] [code '-'] D{:}};    % ��ͬѹջ������ӦNode��codeѹ��ջ��
            end
        end
    end
    code = '*';          % �������˵�����������˶�û�н��� Node{1} == ch ���ж��У�˵��ch��MorseTree֮����ַ�
end