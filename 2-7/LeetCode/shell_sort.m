function returnarr=shell_sort(arr)
    len=length(arr);
    gap=floor(len/2);
    
    while gap>=1
        for i=gap:len
            tmp=arr(i);
            j=i;
            
            
            
            % 插入排序
            while (j>gap) && (arr(j-gap)>tmp)
                arr(j)=arr(j-gap);
                j=j-gap;
            end
            arr(j)=tmp;
        end
        gap=floor(gap/2);
    end
    returnarr=arr;
end
% 希尔排序
% 适用于大规模无序的，因为每个小的分组上，插入排序的效率比较高，因为小规模的插入排序效率比较高，因此把大规模的变成小规模的
% 时间复杂度$O^{1.3-2}$
% 步骤
% 选择一个增量序列 t1，t2，……，tk，其中 ti > tj, tk = 1；
% 按增量序列个数 k，对序列进行 k 趟排序；
% 每趟排序，根据对应的增量 ti，将待排序列分割成若干长度为 m 的子序列，分别对各子表进行直接插入排序。
% 仅增量因子为 1 时，整个序列作为一个表来处理，表长度即为整个序列的长度。
% 不行，还是没有很懂
