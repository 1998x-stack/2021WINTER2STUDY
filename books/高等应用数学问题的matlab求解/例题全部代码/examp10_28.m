S=[0,0; 0,0; 0,0; 0,1; 1,1; 1,1; 1,1; 1,2; 2,2; 2,2];
X=[1,2,3,4,5]; a=[1,2]; S1=rslower(X,a,S)  % 下近似集

S2=rsupper(X,a,S)   % 上近似集

Sd=setdiff(S2,S1)   % 边界集