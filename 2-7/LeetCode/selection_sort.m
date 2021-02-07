function returnarr=selection_sort(arr)
    len=length(arr);
    
    for i=1:len-1
        min_idx=i;
        for j=i+1:len
            if arr(j)<arr(min_idx)
                min_idx=j;
            end
        end
        if i~=min_idx
            tmp=arr(i);
            arr(i)=arr(min_idx);
            arr(min_idx)=tmp;
        end
    end
    returnarr=arr;
end