function [cm, accuracy] = HsvmFun(X, Y, cv)

%% -------------- Building Classifier ----------------------------

CVSVMModel = fitcecoc(X,Y,'Holdout',cv);

% SVMModel = fitcecoc(X,Y); % if need to standardize
% CVSVMModel = crossval(SVMModel,'KFold',cv); % for k-fold corssvalidation
%% -------------- Test and Train sets ----------------------------

CompactSVMModel = CVSVMModel.Trained{1}; % Extract trained, compact classifier

% Partitioning the training and test set

testInds = test(CVSVMModel.Partition);   % Extract the test indices
XTest = X(testInds,:);
YTest = Y(testInds,:);

%% -------------- Making Predictions for Test sets ---------------

predictions = predict(CompactSVMModel,XTest);

%% -------------- Analyzing the predictions ---------------------
 
cm = confusionmat(YTest, predictions);

%% Calculating the accuracy of the confusion matrix

sum=0;
for i=1:length(cm)
sum=sum+cm(i,i);    % Taking the diagonal matrix
end
accuracy = sum/length(predictions)*100; % Accuracy of the holdout method

end