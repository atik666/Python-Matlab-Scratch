function [cm, accuracy] = HknnFun(X, Y, cv,Nn)

%% -------------- Building Classifier ----------------------------

CVKNNModel = fitcknn(X,Y,'Holdout',cv,'NumNeighbors',Nn);

% KNNModel = fitcecoc(X,Y); % if need to standardize
% CVKNNModel = crossval(KNNModel,'KFold',cv); % for k-fold corssvalidation
%% -------------- Test and Train sets ----------------------------

CompactKNNModel = CVKNNModel.Trained{1}; % Extract trained, compact classifier

% Partitioning the training and test set

testInds = test(CVKNNModel.Partition);   % Extract the test indices
XTest = X(testInds,:);
YTest = Y(testInds,:);

%% -------------- Making Predictions for Test sets ---------------

predictions = predict(CompactKNNModel,XTest);

%% -------------- Analyzing the predictions ---------------------
 
cm = confusionmat(YTest, predictions);

%% Calculating the accuracy of the confusion matrix

sum=0;
for i=1:length(cm)
sum=sum+cm(i,i);    % Taking the diagonal matrix
end
accuracy = sum/length(predictions)*100; % Accuracy of the holdout method

end