function answer = ismagic(A)
    [row,column] = size(A);
    answer = false;
    if row ~= column
        disp('Please check if the matrix is square');
        return;
    end
    std_sum = (row^3+row)/2;
    %------ ��ÿһ�еĺ� ------%
    row_sums = sum(A')== std_sum;
    %------ ��ÿһ�еĺ� ------%
    column_sums = sum(A) == std_sum;
    %------ �������Խ��ߵĺ� ------%
    diagnal_sums = [sum(diag(A)),sum(flipud(diag(A)))] == std_sum;
    %------ �����ߵ��߼��� ------%
    staging_result = row_sums'.*column_sums'*diagnal_sums;
    if isempty(find(staging_result==0,1))
        answer = true;
    end
end