# 线性代数问题的计算机求解



## 特殊矩阵

* 单位  零

![image-20210207113415810](Untitled.assets/image-20210207113415810.png)


* 随机矩阵

  ![image-20210207113453996](Untitled.assets/image-20210207113453996.png)

* 对角元素

![image-20210207113526788](Untitled.assets/image-20210207113526788.png)



注意 第k条对角线。中间向上第k条





* Hankel

![image-20210209151511857](work.assets/image-20210209151511857.png)





* Hilbert

  ![image-20210209151637733](work.assets/image-20210209151637733.png)

* Vandermonde

  ![image-20210209151716668](work.assets/image-20210209151716668.png)

* 伴随矩阵

  ![image-20210209151937696](work.assets/image-20210209151937696.png)

  

* sym(A)



## 矩阵基本分析

### 基本概念



* det

  ![image-20210209152331310](work.assets/image-20210209152331310.png)

  tic
  A=sym(hilb(10));
  disp(det(A))
  toc

* trace

* rank

  ![image-20210209152717388](work.assets/image-20210209152717388.png)

  

* norm

  ![image-20210209152827633](work.assets/image-20210209152827633.png)

  ![image-20210209152834770](work.assets/image-20210209152834770.png)

  

* poly 特征多项式

  ![image-20210209153017663](work.assets/image-20210209153017663.png)

  ![image-20210209153028299](work.assets/image-20210209153028299.png)

  

* **Fadeev-Fadeeva**

  ![image-20210209153218392](work.assets/image-20210209153218392.png)

* 矩阵多项式求解

  ![image-20210209154430735](work.assets/image-20210209154430735.png)

  ![image-20210209154439854](work.assets/image-20210209154439854.png)

  

* poly2sym 符号多项式与数值多项式的转换（记得subs)

  

* inv

  ![image-20210209155626644](work.assets/image-20210209155626644.png)

  

* 广义逆

  ![image-20210209155652605](work.assets/image-20210209155652605.png)

  ![image-20210209155703604](work.assets/image-20210209155703604.png)





## 特征值

* eig

  ![image-20210209160238219](image-20210209160238219.png)

  

* 广义特征值和特征向量

  ![image-20210209160625263](work.assets/image-20210209160625263.png)

### 基本变化

* 相似变换

  ![image-20210209160927054](work.assets/image-20210209160927054.png)

  

* LU 

  ![image-20210211004903172](work.assets/image-20210211004903172.png)

  

* cholesky

  ![image-20210211005157262](work.assets/image-20210211005157262.png)

  

* 正定与正则矩阵

  ![image-20210211005544476](work.assets/image-20210211005544476.png)

* 特征根 Jordan

  ![image-20210211005817617](work.assets/image-20210211005817617.png)

  ![image-20210211010129702](work.assets/image-20210211010129702.png)

* 奇异值

  ![image-20210211010414673](work.assets/image-20210211010414673.png)

  ![image-20210211010442849](work.assets/image-20210211010442849.png)



​	![image-20210211010523128](work.assets/image-20210211010523128.png)





* 方程组

  ![image-20210211010922161](work.assets/image-20210211010922161.png)

  ![image-20210211011036448](work.assets/image-20210211011036448.png)

  ![image-20210211011955864](work.assets/image-20210211011955864.png)

* lyapunov

  ![image-20210211012444557](work.assets/image-20210211012444557.png)

  ![image-20210211012652982](work.assets/image-20210211012652982.png)

![image-20210211012713385](work.assets/image-20210211012713385.png)

* Sylvester

  ![image-20210211013029327](work.assets/image-20210211013029327.png)

  

* Riccati

  ![image-20210211013300025](work.assets/image-20210211013300025.png)

## 非线性运算与矩阵函数求值

![image-20210211013333216](work.assets/image-20210211013333216.png)



### expm

![image-20210211013514339](work.assets/image-20210211013514339.png)

* 矩阵三角函数运算

  ![image-20210211013638405](work.assets/image-20210211013638405.png)

  ![image-20210211013655780](work.assets/image-20210211013655780.png)





## 总结

![image-20210211014202587](work.assets/image-20210211014202587.png)



![image-20210211014213675](work.assets/image-20210211014213675.png)

![image-20210211014226683](work.assets/image-20210211014226683.png)

![image-20210211014240008](work.assets/image-20210211014240008.png)

![image-20210211014355759](work.assets/image-20210211014355759.png)

![image-20210211014736337](work.assets/image-20210211014736337.png)

![image-20210211014749765](work.assets/image-20210211014749765.png)

![image-20210211014757916](work.assets/image-20210211014757916.png)





![image-20210211014819469](work.assets/image-20210211014819469.png)








































