function returnarr=shell_sort(arr)
    len=length(arr);
    gap=floor(len/2);
    
    while gap>=1
        for i=gap:len
            tmp=arr(i);
            j=i;
            
            
            
            % ��������
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
% ϣ������
% �����ڴ��ģ����ģ���Ϊÿ��С�ķ����ϣ����������Ч�ʱȽϸߣ���ΪС��ģ�Ĳ�������Ч�ʱȽϸߣ���˰Ѵ��ģ�ı��С��ģ��
% ʱ�临�Ӷ�$O^{1.3-2}$
% ����
% ѡ��һ���������� t1��t2��������tk������ ti > tj, tk = 1��
% ���������и��� k�������н��� k ������
% ÿ�����򣬸��ݶ�Ӧ������ ti�����������зָ�����ɳ���Ϊ m �������У��ֱ�Ը��ӱ����ֱ�Ӳ�������
% ����������Ϊ 1 ʱ������������Ϊһ�������������ȼ�Ϊ�������еĳ��ȡ�
% ���У�����û�кܶ�
