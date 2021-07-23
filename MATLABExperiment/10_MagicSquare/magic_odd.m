function A = magic_odd(n)
% MAGIC_ODD: find a magic squre under an odd order n
% MAGIC_ODD applies de La Louberer's method
    A = zeros(n,n);
    i = 1; % 从第一行开始
    j = (n+1)/2; % 从中间列开始
    for k=1:n^2 % 循环n^2次填充矩阵A
        %--- 放置当前元素并缓存当前位置 ----%
        A(i,j) = k;
        is = i;
        js = j;
        %--- 计算下一待放置元素在矩阵中的理论坐标 ----%
        i = n - rem(n-i+1,n);
        j = rem(j,n)+1;
        %---- 冲突处理: 计算在冲突情况下理论坐标的实际值 ----%
        if A(i,j) ~= 0 % 如果下一元素已经被占领了
            i = rem(is,n)+1;
            j = js;
        end
    end
end
%------------ 补充说明 --------------%
% 这里在计算下一元素的坐标i,j时
%   对于i:
%       i是对行的抽象，在这个算法中，当行到达第一行或者最后一行时，下一行是最后一行或者第一行
%       所以我们就应该思考如何用i的表达式描述当前行到达了第一行或者最后一行
%       而 i =  n - rem(n-i+1,n); 这里n-i+1表示当前行距离最后一行(包括当前行)的行数
%       而这一行数正好描述了当前行的状态(到达第一行||最后一行?)
%       rem表示如果行数满了(说明到了第一行)或者行数为0(说明到了最后一行)将其再返回到0或者n
%       所以最后还需要用n来减去rem的结果
%  对于j:
%       这个不用多解释，懂自懂
%  对于i和j的算法不同，这是由于行列在该算法中的操作机制不同
%  i是从第一行开始(其实从哪里开始并不重要),然后向上走，这样对于行来说是递减的
%  j是从中间列开始(does'nt matter),然后向右走，这样对于列来说是递增的
%  对于递减的行如果以第一行为参照，相当于从一个较小的数递减到一个较大的数，这样是不自然的，
%  而如果选择递减的行的参照是最后一行，则相较而言更为自然。所以i中会用n减去rem
%  对于递增的列来说，同理可得从第一列开始增加是自然的，所以j中用1+rem
%  i,j中减去rem和加上rem是因为在行减列增的过程中，需要首先判断该行和列是否在边界上

        
        