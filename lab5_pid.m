len = 41;
trainr = csvread('E:\files\SMIE\third_up\ai\Lab5_LR\train.csv');
one = ones(length(trainr),1);
train_label = trainr(:,len:len);
train1 = trainr(:,1:len-1);
train =[one train1];
validr = csvread('E:\files\SMIE\third_up\ai\Lab5_LR\valid.csv');
one = ones(length(validr),1);
valid_label = validr(:,len:len);
valid1 = validr(:,1:len-1);
valid =[one valid1];
test = csvread('E:\files\SMIE\third_up\ai\Lab5_LR\train.csv');

%w初始化为全1,41列1行%
W = ones(len,1);
learning = zeros(len,1);
ek =zeros(len,1);
ek_1 =zeros(len,1);
expected = zeros(len,1);

for k=1:1000
    s = train*W;
    predict = 1.0 ./ (1.0+exp(-s));
    %当前的梯度大小current%
    current = (train.')*(predict-train_label);
    %PID或者简单的P算法得到动态变化的学习率%
   [learning,ek,ek_1] = pid_self(current,expected,ek,ek_1,learning);
     %learning= P_self(current,expected);%
     %如果目前与梯度的预期值的差距的模小于1，则完成%
    if(norm(current)<1)
        disp(k);
        break;
    end 
    %更新w%
    W = W - learning.*current;
end
 disp('Wend:');
    disp(W);
TP = 0;
TN = 0;
FP = 0;
FN = 0; 
result = valid*W;
P = 1.0 ./(1.0+exp(-result));
for i = 1:length(P)
   if(P(i)<=0.5)
      if(valid_label(i) == 1) 
          FN = FN+1;
       else TN=TN+1;
      end 
   else
        if(valid_label(i) == 1) 
          TP = TP+1;
        else FP=FP+1;
        end  
   end 
end
 Accuracy = (TP+TN)/(TP+TN+FP+FN);
 Recall = (TP)/(TP+FN);
 Precision = (TP)/(TP+FP);
 F1 = 2* Precision* Recall/(Recall+Precision) ;
 
zhibiao=[Accuracy Recall Precision F1];
disp(zhibiao);





