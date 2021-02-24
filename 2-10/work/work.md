# 线性方程组

Ax=b

![image-20210212105728430](work.assets/image-20210212105728430.png)



## 反斜线符号算符

![image-20210212105946152](work.assets/image-20210212105946152.png)



![image-20210212110128956](work.assets/image-20210212110128956.png)



### LU

![image-20210212110812394](work.assets/image-20210212110812394.png)





![image-20210212110853197](work.assets/image-20210212110853197.png)





### 主元

![image-20210212111026642](work.assets/image-20210212111026642.png)





![image-20210212114913216](work.assets/image-20210212114913216.png)





![image-20210212115413706](work.assets/image-20210212115413706.png)





![image-20210212115826678](work.assets/image-20210212115826678.png)



## 2.8 舍入误差的影响



采用部分主元的高斯消去法，可以保证得到较小的计算剩余



## 2.9番薯和条件书



**nealy singular**

如果矩阵接近奇异，A和b上小的改变，导致x上很大的变换。



**范数**

![image-20210224123831014](work.assets/image-20210224123831014.png)

* norm(x,1)
* norm(x,2)
* norm(x,inf)



敏感性测量，可能变换范围

![image-20210224123939316](work.assets/image-20210224123939316.png)



在此基础上，A进行奇异值分解



矩阵范数

![image-20210224124053724](work.assets/image-20210224124053724.png)





![image-20210224124215886](work.assets/image-20210224124215886.png)





* A的逆计算量大
* l2条件书需要进行SVD和更大的计算量。
* 合理估计





## 2.10 稀疏矩阵和带状矩阵

![image-20210224125029749](work.assets/image-20210224125029749.png)



S=sparse(A)  将矩阵转换为稀疏矩阵表示

A=full(S)  相反操作



![image-20210224125217110](work.assets/image-20210224125217110.png)





* 三角矩阵

  <img src="work.assets/image-20210224125249055.png" alt="image-20210224125249055" style="zoom:33%;" />

  tridisolve(a,b,c,d)::: 基本都满足主对角元素占优的性质，没有必要选择主元



![image-20210224134242855](work.assets/image-20210224134242855.png)















# 插值

## 3.1 差值多项式



* 拉格朗日

  ![image-20210224134633315](work.assets/image-20210224134633315.png)

* 幂形式

  ![image-20210224134621255](work.assets/image-20210224134621255.png)

## 3.2 分段线性插值















