function [y,ek,ek_1] = pid_self(current,expected,e_k1,e_k2,learning)
%算出本次的误差ek%
ek = expected-current;
kp =3;
ki =1.5;
kd = 3;
%根据增量式pid公式得到当前的pid输出，作为步长%
y = kp*(ek-e_k1)+ki*ek+kd*(ek-2*e_k1+e_k2)+learning;
y = abs(y);
%更新ek_1,记录上次的误差%
ek_1 = e_k1;
