clear;clc;

% load Feat_S3.csv;
% 
% X = stdFun(Feat_S3(:, 1:end-1)); % Features
% Y = Feat_S3(:, end); % Class label
% 
% H_O = 0.3; % CV partition
% 
% tic
% [cm, accuracy] = HsvmFun(X, Y, H_O);
% toc

%%_____________________________________________%%

load Feat_S1.csv;
load Feat_S2.csv;
load Feat_S3.csv;

X = horzcat(Feat_S1(:, 1:end-1), Feat_S2(:, 1:end-1), Feat_S3(:, 1:end-1));  % Features
X = stdFun(X);
Y = Feat_S1(:, end); % Class label

H_O = 0.3; % CV partition

tic
[cm, accuracy] = HsvmFun(X, Y, H_O);
toc

%%____________________________________________%%
clc;clear;

load Feat_S1.csv;
load Feat_S3.csv;

X = Feat_S1(:, 1:end-1);  % Features
X = stdFun(X);
Y = Feat_S1(:, end); % Class label

cv = 0.3;

CVSVMModel = fitcecoc(X,Y,'Holdout',cv);

X_Test = stdFun(Feat_S3(:, 1:end-1));
Y_Test = Feat_S3(:, end);

CompactSVMModel = CVSVMModel.Trained{1}; % Extract trained, compact classifier

%% -------------- Making Predictions for Test sets ---------------

predictions = predict(CompactSVMModel,X_Test);

%% -------------- Analyzing the predictions ---------------------
 
cm = confusionmat(Y_Test, predictions);

%% Calculating the accuracy of the confusion matrix

sum=0;
for i=1:length(cm)
sum=sum+cm(i,i);    % Taking the diagonal matrix
end
accuracy = sum/length(predictions)*100; % Accuracy of the holdout method
