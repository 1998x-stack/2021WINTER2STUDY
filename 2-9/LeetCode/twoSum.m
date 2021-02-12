% 两数之和
% # 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
% # 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
% #
% # 示例:
% #
% # 给定 nums = [2, 7, 11, 15], target = 9
% # 因为 nums[0] + nums[1] = 2 + 7 = 9
% # 所以返回 [0, 1]
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

