function y= P_self(current,expected)
%���赱ǰ�ݶ�ֵ������0-200֮��%
max = 200;
ek = expected-current;
%��һ�κ��������������������ô󲽳������С����С����%
y = abs(ek/max);
%һ�㲻������Ҫ̫��Ĳ�����������0-10֮��%
for i = 1:length(y)
    if(y(i)>10) 
        y(i) = 10;
    end
end




