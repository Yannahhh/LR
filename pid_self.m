function [y,ek,ek_1] = pid_self(current,expected,e_k1,e_k2,learning)
%������ε����ek%
ek = expected-current;
kp =3;
ki =1.5;
kd = 3;
%��������ʽpid��ʽ�õ���ǰ��pid�������Ϊ����%
y = kp*(ek-e_k1)+ki*ek+kd*(ek-2*e_k1+e_k2)+learning;
y = abs(y);
%����ek_1,��¼�ϴε����%
ek_1 = e_k1;
