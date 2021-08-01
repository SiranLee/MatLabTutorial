function [X,step] = my_sudoku_basic(X,step)
% SUDOKU_BASIC: 对于给定的sudoku X,给出其解X和求解的步数
    if(nargin<2)
        step = 0;
    end
    % 首先获取每个未确定元素的方格的待选元素以及长度
    [C,N] = my_candidates(X);
    % 循环地确定可确定元素的方格
    % 可确定元素的标准: 有待选元素并且待选元素只有一个
    while all(N>0) & any(N==1)
        s = find(N==1,1); % 找到N中第一个待选元素是1的元素的坐标
        X(s) = C{s};
        [C,N] = my_candidates(X);
        step = step + 1;
    end
    if all(N>0) % 如果还有待选元素并且待选元素不止一个，那么就采用递归回溯的方式
        Y = X; % 首先要保存此时此刻的X的状态，以便从下一时刻返回时有据可溯
        % 这里开始，搜索空间是一个树的模式，所以代码结构是外部循环，内部递归
        % 对于外部循环，从元胞C{i,j}的长度最小的那个元胞开始循环
        k = find(N==min(N),1);
        for t = [C{k}]
            X = Y; % 每一轮都是在当前层次的，所以需要恢复X的状态，再往下递归
            X(k) = t;
            step=step+1;
            [X,step] = my_sudoku_basic(X,step);
            
            if all(X(:)>0)
                % 如果某一个层次到这里说明所有方格都确定了
                break;
            end
        end
    end
end
        
    
