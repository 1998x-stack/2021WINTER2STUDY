function sorted_arr=bubblesort(arr)
    len=length(arr);
    flag=1;
    while flag==1
        for i=1:len-1
            for j=1:(len-i)
                flag=0;
                if arr(j)>arr(j+1)
                    tmp=arr(j);
                    arr(j)=arr(j+1);
                    arr(j+1)=tmp;
                    flag=1;
                end
            end
        end
    end
    sorted_arr=arr;
end


% % function bubblesort(arr)
% %     len=length(arr);
% %     for i=1:len-1
% %         for j=1:len-i
% %             if arr(j)>arr(j+1)
% %                 tmp=arr(j+1);
% %                 arr(j+1)=arr(j);
% %                 arr(j)=tmp;
% %             end
% %         end
% %     end
% % end