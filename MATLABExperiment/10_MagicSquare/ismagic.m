function answer = ismagic(A)
    [row,column] = size(A);
    answer = false;
    if row ~= column
        disp('Please check if the matrix is square');
        return;
    end
    std_sum = (row^3+row)/2;
    %------ 求每一行的和 ------%
    row_sums = sum(A')== std_sum;
    %------ 求每一列的和 ------%
    column_sums = sum(A) == std_sum;
    %------ 求两条对角线的和 ------%
    diagnal_sums = [sum(diag(A)),sum(flipud(diag(A)))] == std_sum;
    %------ 求三者的逻辑与 ------%
    staging_result = row_sums'.*column_sums'*diagnal_sums;
    if isempty(find(staging_result==0,1))
        answer = true;
    end
end