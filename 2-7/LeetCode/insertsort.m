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
% ��������
% ����һ���������е�һ��Ԫ�ؿ���һ���������У��ѵڶ���Ԫ�ص����һ��Ԫ�ص�����δ�������С�
% ��ͷ��β����ɨ��δ�������У���ɨ�赽��ÿ��Ԫ�ز����������е��ʵ�λ�á�
% ������������Ԫ�������������е�ĳ��Ԫ����ȣ��򽫴�����Ԫ�ز��뵽���Ԫ�صĺ��档��
% ���ó�����С��ģ���ݼ��������ݻ��������ʱ��