% ��Ծ��Ϸ
% ����һ���Ǹ��������飬�����λ������ĵ�һ��λ�á�
% 
% �����е�ÿ��Ԫ�ش������ڸ�λ�ÿ�����Ծ����󳤶ȡ�
% 
% �ж����Ƿ��ܹ��������һ��λ�á�
function b=JumpGame(arr)
% ������ֻ������0��ʱ����п��ܹ���ȥ����˿�����0
    indexs=find(arr==0);
    len=length(indexs);
    b=false;
    for i=1:len
        for k=1:indexs(i)-1
            if arr(k)>indexs(i)-k
                b=true;
        end
    end


end