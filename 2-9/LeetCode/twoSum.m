% ����֮��
% # ����һ���������� nums ��һ��Ŀ��ֵ target�������ڸ��������ҳ���ΪĿ��ֵ���� ���� ���������������ǵ������±ꡣ
% # ����Լ���ÿ������ֻ���Ӧһ���𰸡����ǣ��㲻���ظ��������������ͬ����Ԫ�ء�
% #
% # ʾ��:
% #
% # ���� nums = [2, 7, 11, 15], target = 9
% # ��Ϊ nums[0] + nums[1] = 2 + 7 = 9
% # ���Է��� [0, 1]
function returns=twoSum(nums,target)
    len=length(nums);
    d=py.dict(pyargs());
    k=1;
    returns=[];
    for i=1:len
        try 
            value=d{target-nums(i)};
            if ismember(target-nums(i),nums)
                returns(k,:)=[value,i];
                k=k+1;
            end
        catch
            d{nums(i)}=i;
        end
    end
end

