% ��������
% ��������ĺ������ڽ����������ֵת��Ϊ���洢�ڶ��⿪�ٵ�����ռ��С�
% ��Ϊһ������ʱ�临�Ӷȵ����򣬼�������Ҫ����������ݱ�������ȷ����Χ��������
% �ҳ�ԭ������Ԫ��ֵ���ģ���Ϊmax��
% ����һ��������count���䳤����max��1����Ԫ��Ĭ��ֵ��Ϊ0��
% ����ԭ�����е�Ԫ�أ���ԭ�����е�Ԫ����Ϊcount�������������ԭ�����е�Ԫ�س��ִ�����Ϊcount�����Ԫ��ֵ��
% �����������result����ʼ����index��
% ����count���飬�ҳ�����Ԫ��ֵ����0��Ԫ�أ������Ӧ��������ΪԪ��ֵ��䵽result������ȥ��ÿ����һ�Σ�count�еĸ�Ԫ��ֵ��1��ֱ����Ԫ��ֵ������0�����δ���count��ʣ�µ�Ԫ�ء�
% ���ؽ������result��
function returnarr=CountingSort(arr)
    minValue=min(arr(:));
    arr=arr-minValue+1;
    maxValue=max(arr(:));
    bucketLen=maxValue+1;
    bucket=zeros(1,bucketLen);
    sortedIndex=1;
    arrLen=length(arr);
    for i =1:arrLen
        if ~bucket(arr(i))
            bucket(arr(i))=0;
        end
        bucket(arr(i))=bucket(arr(i))+1;
    end
    
    for j=1:bucketLen
        while bucket(j)>0
            arr(sortedIndex)=j;
            sortedIndex=sortedIndex+1;
            bucket(j)=bucket(j)-1;
        end
    end
    returnarr=arr-1+minValue;



end