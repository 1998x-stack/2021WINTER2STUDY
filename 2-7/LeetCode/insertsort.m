function returnarr=insertsort(arr)
    len=length(arr);
    for i=2:len
        pre=i-1;
        cur=arr(i);
        while pre>=1
            if arr(pre)>cur
                arr(pre+1)=arr(pre);
                arr(pre)=cur;
            end
            pre=pre-1;
        end
    end
    returnarr=arr;
end
% 插入排序
% 将第一待排序序列第一个元素看做一个有序序列，把第二个元素到最后一个元素当成是未排序序列。
% 从头到尾依次扫描未排序序列，将扫描到的每个元素插入有序序列的适当位置。
% （如果待插入的元素与有序序列中的某个元素相等，则将待插入元素插入到相等元素的后面。）
% 适用场景，小规模数据集或者数据基本有序的时候