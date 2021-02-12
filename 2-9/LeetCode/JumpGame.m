% 跳跃游戏
% 给定一个非负整数数组，你最初位于数组的第一个位置。
% 
% 数组中的每个元素代表你在该位置可以跳跃的最大长度。
% 
% 判断你是否能够到达最后一个位置。
function b=JumpGame(arr)
% 分析：只有碰到0的时候才有可能过不去，因此考虑找0
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