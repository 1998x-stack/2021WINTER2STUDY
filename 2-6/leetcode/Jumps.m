% 一只青蛙一次可以跳上1级台阶，也可以跳上2级……它也可以跳上n级。求该青蛙跳上一个n级的台阶总共有多少种跳法。
function f=Jumps(n)
    if n==1
        f=1;
    end
    if n==2
        f=2;
    end
    if n>2
        f=Jumps(n-1)*2;
    end
end