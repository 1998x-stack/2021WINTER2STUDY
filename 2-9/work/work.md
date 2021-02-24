# 数据差值、函数逼近问题



![image-20210220144617462](work.assets/image-20210220144617462.png)

## interp1 and lagrange

'''

[x0,y0]=ginput(6);
x=min(x0):(max(x0)-min(x0))/8:max(x0);
y=lagrange1(x0,y0,x);
plot(x0,y0,'o')
hold on
plot(x,y,'ro')

'''













![image-20210220152308926](work.assets/image-20210220152308926.png)









## 已知样本点的定积分

* trapz;  interp1(一维数据)

* quadspln

* interp2(二维插值)

  

* 二维一般分布数据的插值问题。 interp2只能处理以网格形式给出的数据，如果已知数据不是以网格形式给出，该函数无能为力。

![image-20210222090935126](work.assets/image-20210222090935126.png)



* 高维插值问题===n维

![image-20210222091850256](work.assets/image-20210222091850256.png)





## 样条插值

### 三次样条

![image-20210222092419987](work.assets/image-20210222092419987.png)

![image-20210222092428922](work.assets/image-20210222092428922.png)



![image-20210222162823501](work.assets/image-20210222162823501.png)

![image-20210222162915243](work.assets/image-20210222162915243.png)





#### 多个自变量的网格数据三次样条插值

![image-20210222163008105](work.assets/image-20210222163008105.png)

### B样条函数

![image-20210222163433632](work.assets/image-20210222163433632.png)



### 基于样条插值的数值微积分运算

![image-20210222165348735](work.assets/image-20210222165348735.png)





积分

![image-20210222170349019](work.assets/image-20210222170349019.png)



## 已知数据拟合数学模型

### 多项式拟合

![image-20210222171020801](work.assets/image-20210222171020801.png)

![image-20210222171032372](work.assets/image-20210222171032372.png)





p3=polyfit(x0,y0,3);
vpa(poly2sym(p3),10)



![image-20210222171451653](work.assets/image-20210222171451653.png)





### 8.3.5 最小二乘曲线拟合

$$
[a,J_m]=lsqcurvefit(Fun,a_0,x,y)
$$

Fun: M-函数或者inline()

a<sub>0</sub> :最优化的初值



## 8.4 信号分析与数字信号处理基础

### 8.4.1 相关分析

![image-20210224061447513](work.assets/image-20210224061447513.png)
$$
R_{xx}(\rho)=lim_{T\rightarrow\infty}\frac{1}{T}\int_0^Tx(t)x(t+\rho)dt,\rho\ge0
$$


![image-20210224062145124](work.assets/image-20210224062145124.png)



![image-20210224062343677](work.assets/image-20210224062343677.png)

### 8.4.2 快速Fourier变换

$$
X(k)=\sum_{i=1}^Nx_ie^{-2\pi j(k-1)(i-1)/N}
$$

逆变换
$$
x(k)=\frac{1}{N}\sum_{i=1}^NX(i)e^{2\pi j(k-1)(i-1)/N}
$$




fft



### 8.4.3 滤波技术与滤波器设计

* 线性滤波器

  * FIR
  * IIR
  * ARMA

  ![image-20210224064259203](work.assets/image-20210224064259203.png)

  ![image-20210224064219163](work.assets/image-20210224064219163.png)

* 放大倍数分析

  ![image-20210224064412782](work.assets/image-20210224064412782.png)

* 滤波器设计



![image-20210224100753567](work.assets/image-20210224100753567.png)



## summary



![image-20210224100808815](work.assets/image-20210224100808815.png)

![image-20210224100819939](work.assets/image-20210224100819939.png)



![image-20210224100825939](work.assets/image-20210224100825939.png)











































































# 第九章 概率论与数理统计问题的计算机求解



## 9.1 概率分布与伪随机数生成

### 9.1.2 常见

* poisson

  * 概率密度函数：poisspdf(x,lambda)
  * 分布函数：poisscdf(x,lambda)
  * 逆概率分布：x=poissinv(F,lambda)

  $$
  p_p(x)=\frac{\lambda^x}{x!}e^{-\lambda x}
  $$

  

* norm

  * normpdf(x,miu,sigma)
  * normcdf(x,miu,sigma)
  * norminv(F,miu,sigma)

  $$
  p_n(x)=\frac{1}{\sqrt{2\pi \sigma}}e^{-\frac{(x-\mu)^2}{2\sigma^2}}
  $$

  

* gamma 分布

  * gampdf(x,a,lambda)
  * gamcdf(x,a,lambda)
  * gaminv(F,a,lambda)

  $$
  \begin{aligned}
  p(x)
  &=\frac{\lambda^ax^{a-1}}{\Gamma(a)}e^{-\lambda x}\space for \space x\ge0
  \\
  &=0 \space for \space x<0
  \end{aligned}
  $$

  

* chi 分布

  * chi2pdf(x,k)
  * chi2cdf(x,k)
  * chi2inv(F,k)

  $$
  \begin{aligned}
  p(x)_{\chi^2}
  &=\frac{1}{2^{\frac{k}{2}}\Gamma(\frac{k}{2})} x^{\frac{k}{2}-1}e^{-\frac{x}{2}} \space for \space x\ge0
  \\
  &=0 \space for \space x<0
  \end{aligned}
  $$

  

* T分布

  * tpdf(x,k)
  * tcdf(x,k)
  * tinv(F,k)

  $$
  p_T(x)=\frac{\Gamma(\frac{k+1}{2})}{\sqrt{k\pi}\Gamma(\frac{k}{2})}(1+\frac{x^2}{k})^{-\frac{k+1}{2}}
  $$

  

* rauleigh

  * raylpdf
  * raylcdf
  * raylinv

  $$
  \begin{aligned}
  p(x)_{r}
  &=\frac{x}{b^2}e^{-\frac{x^2}{2b^2}}
  \space for \space x\ge0
  \\
  &=0 \space for \space x<0
  \end{aligned}
  $$

  

* F

  * fpdf(x,p,q)
  * fcdf(x,p,q)
  * finv(F,p,q)

  $$
  \begin{aligned}
  p(x)_{F}
  &=\frac{\Gamma(\frac{p+q}{2})}{\Gamma(\frac{p}{2})\Gamma({\frac{q}{2}})}p^{\frac{p}{2}}q^{\frac{q}{2}}x^{\frac{p}{2}-1}(p+qx)^{-\frac{p+q}{2}}
  \space for \space x\ge0
  \\
  &=0 \space for \space x<0
  \end{aligned}
  $$

  

### 9.1.3 概率问题的求解

![image-20210224103818760](work.assets/image-20210224103818760.png)





### 9.1.4 随机数与伪随机数

![image-20210224103938758](work.assets/image-20210224103938758.png)



## 9.2 统计量分析

### 9.2.1 随机变量的均值与方差

* 对于给出概率分布

$$
E[x]=\int_{-\infty}^{\infty}xp(x)dx
\\
D[x]=\int_{-\infty}^{\infty}(x-E[x])^2p(x)dx
$$



* 对于给出样本数据

![image-20210224105413495](work.assets/image-20210224105413495.png)

* 对于给定概率分布的参数

![image-20210224105506913](work.assets/image-20210224105506913.png)



### 9.2.2 随机变量的矩

![image-20210224105540667](work.assets/image-20210224105540667.png)



![image-20210224105607044](work.assets/image-20210224105607044.png)





### 9.2.3 多变量随机数协方差分析

![image-20210224105646014](work.assets/image-20210224105646014.png)



### 9.2.4 多变量正太分布

![image-20210224105851897](work.assets/image-20210224105851897.png)





## 9.3 数理统计分析方法与计算机实现

### 9.3.1 参数估计与区间估计

![image-20210224110818232](work.assets/image-20210224110818232.png)

![image-20210224110828739](work.assets/image-20210224110828739.png)





### 9.3.2  多元线性回归与区间估计

![image-20210224111207720](work.assets/image-20210224111207720.png)



![image-20210224111220675](work.assets/image-20210224111220675.png)





### 9.3.3 非线性函数的最小二乘法参数估计与区间估计

![image-20210224112035845](work.assets/image-20210224112035845.png)



J: Jacobi 

lsqcurvefit

##  9.4 统计假设检验

### 9.4.1

*  引入两个命题
* 选取统计量
* 显著性水平
* 逆分布求出相应

![image-20210224112930710](work.assets/image-20210224112930710.png)



### 9.4.2 假设检验问题求解



**正态分布均值假设检验**

![image-20210224113254671](work.assets/image-20210224113254671.png)





* ttest
* ztest

![image-20210224113400327](work.assets/image-20210224113400327.png)





**正态分布假设检验**

![image-20210224113537221](work.assets/image-20210224113537221.png)



![image-20210224113610599](work.assets/image-20210224113610599.png)

![image-20210224113653008](work.assets/image-20210224113653008.png)





## 9.5 方差分析

### 9.5.1 单因子方差分析

![image-20210224114030103](work.assets/image-20210224114030103.png)

![image-20210224114341659](work.assets/image-20210224114341659.png)



<img src="work.assets/image-20210224114540945.png" alt="image-20210224114540945" style="zoom:37%;" />





![image-20210224115050656](work.assets/image-20210224115050656.png)



anova2

manova1



## 9.6 summary

![image-20210224120156376](work.assets/image-20210224120156376.png)



![image-20210224120210993](work.assets/image-20210224120210993.png)



![image-20210224120221922](work.assets/image-20210224120221922.png)



![image-20210224120229253](work.assets/image-20210224120229253.png)













<img src="https://img-blog.csdn.net/20170927152433319?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbGlhbmd6dW9qaWF5aQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast">

<img src="https://img-blog.csdn.net/20170927152637550?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbGlhbmd6dW9qaWF5aQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast">

<img src="https://img-blog.csdn.net/20170927152753776?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbGlhbmd6dW9qaWF5aQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast">

<img src="https://img-blog.csdn.net/20170927152857697?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbGlhbmd6dW9qaWF5aQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast">

<img src="https://img-blog.csdn.net/20170927153008433?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbGlhbmd6dW9qaWF5aQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast">

<img src="https://img-blog.csdn.net/20170927153104597?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbGlhbmd6dW9qaWF5aQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast">

# 第十章 数学问题的非传统解法

## 10.1 模糊逻辑和模糊推理



![image-20210224120352440](work.assets/image-20210224120352440.png)



![image-20210224120425251](work.assets/image-20210224120425251.png)

























































































