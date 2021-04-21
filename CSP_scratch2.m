clc; clear; 

% Binary CSP implementation
% Load the dataset
load 'D:\AAA\Udemy - Deep Learning A-Ztrade;_ Hands-On Artificial Neural Networks [Desire Course]\29. Data Preprocessing Template\base.mat';
load 'D:\AAA\Udemy - Deep Learning A-Ztrade;_ Hands-On Artificial Neural Networks [Desire Course]\29. Data Preprocessing Template\ir.mat';

L = 90;
k = 1;
for i = 1:L
    X1{i,1} = vertcat(X097_DE_time(k:k+1200-1)', X097_FE_time(k:k+1200-1)'); % class 1
    X2{i,1} = vertcat(X105_DE_time(k:k+1200-1)', X105_FE_time(k:k+1200-1)'); % class 2
    k = k+1200;
end

for i = 1:L
    W{i,1} = csp(X1{i,1},X2{i,1}); %  spatial filters matrix
end

for i = 1:L
    X1_CSP{i,1} = W{i,1}'*X1{i,1}; % spatial patterns
    X2_CSP{i,1} = W{i,1}'*X2{i,1};
end

% Feature extraction from CSP
for j = 1:L
    for i = 1:2
        rms1{j,i} = rms(X1_CSP{j, 1}(i,:))';
        var1{j,i} = var(X1_CSP{j, 1}(i,:))';
        mean1{j,i} = mean(X1_CSP{j, 1}(i,:))';
        kurt1{j,i} = kurtosis(X1_CSP{j, 1}(i,:))';
        skew1{j,i} = skewness(X1_CSP{j, 1}(i,:))';
        std1{j,i} = std(X1_CSP{j, 1}(i,:))';
        
        rms2{j,i} = rms(X2_CSP{j, 1}(i,:))';
        var2{j,i} = var(X2_CSP{j, 1}(i,:))';
        mean2{j,i} = mean(X2_CSP{j, 1}(i,:))';
        kurt2{j,i} = kurtosis(X2_CSP{j, 1}(i,:))';
        skew2{j,i} = skewness(X2_CSP{j, 1}(i,:))';
        std2{j,i} = std(X2_CSP{j, 1}(i,:))';
    end
end

class1 = horzcat(rms1,var1,mean1,kurt1,skew2,std2);
class1 = cell2mat(class1);
class2 = horzcat(rms2,var2,mean2,kurt2,skew2,std2);
class2 = cell2mat(class2);

Label1 = ones(L,1);
Label2 = 2*ones(L,1);
Label = vertcat(Label1, Label2);

class = vertcat(class1, class2);
dataCSP = horzcat(class, Label);
dataCSP = vertcat(1:13, dataCSP); % Feature table
csvwrite('D:\AAA\Udemy - Deep Learning A-Ztrade;_ Hands-On Artificial Neural Networks [Desire Course]\29. Data Preprocessing Template\dataCSP.csv', dataCSP);