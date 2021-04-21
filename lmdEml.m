clc;clear;
a = xlsread('LMD_4.xlsx');
a = a(2:end, :);
b = normalize(a(:,1:end-1));
a = horzcat(b,a(:,end));
% Cross varidation (train: 70%, test: 30%)
cv = cvpartition(size(a,1),'HoldOut',0.3);
idx = cv.test;

% Separate to training and test data
dataTrain = a(~idx,:);
dataTest  = a(idx,:);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy, T,P,TY,label_index_expected,label_index_actual,Y,x] = elm(dataTrain, dataTest, 1, 1000, 'sig');

pred = TY'; % Predicted Label from activation fucntion
actual = dataTest(:, end); % Actual Label

%% Converting to predicted label
for i = 1:length(pred)
    [~,mxi(i)] = max(pred(i,:));
end

pred = mxi';

%% Confusion Matrix
cm = confusionmat(actual, pred);

%% Calculating the accuracy of the confusion matrix

sum=0;
for i=1:length(cm)
    sum=sum+cm(i,i);    % Taking the diagonal matrix
end
accuracy = sum/length(pred)*100; % Accuracy of the holdout method
