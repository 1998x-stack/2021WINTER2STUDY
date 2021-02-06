%题目描述 一只青蛙一次可以跳上1级台阶，也可以跳上2级。求该青蛙跳上一个n级的台阶总共有多少种跳法（先后次序不同算不同的结果）。
function f=Jump(n)
    if n==1
        f=1;
    end  
    if n==2
        f=2;
    end
    if n>2
        f=Jump(n-1)+Jump(n-2);
    end
end
