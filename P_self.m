function y= P_self(current,expected)
%假设当前梯度值误差大都在0-200之间%
max = 200;
ek = expected-current;
%用一次函数正比例函数，误差大，用大步长，误差小，用小步长%
y = abs(ek/max);
%一般不会有需要太大的步长，现在在0-10之间%
for i = 1:length(y)
    if(y(i)>10) 
        y(i) = 10;
    end
end




