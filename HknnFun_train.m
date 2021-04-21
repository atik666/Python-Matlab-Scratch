function [cm, accuracy] = HknnFun_train(X, Y, cv,Num_Nei)
%% Classifier

CVKNNModel = fitcknn(X,Y,'Holdout',cv,'NumNeighbors',Num_Nei);

% KNNModel = fitcecoc(X,Y); % if need to standardize
% CVKNNModel = crossval(KNNModel,'KFold',cv); % for k-fold corssvalidation
%% -------------- Test and Train sets ----------------------------

CompactKNNModel = CVKNNModel.Trained{1}; % Extract trained, compact classifier

% Partitioning the training and test set

trainInds = training(CVKNNModel.Partition);   % Extract the train indices
Xtrain = X(trainInds,:);
Ytrain = Y(trainInds,:);

%% -------------- Making Predictions for train sets ---------------

predictions = predict(CompactKNNModel,Xtrain);

%% -------------- Analyzing the predictions ---------------------
 
cm = confusionmat(Ytrain, predictions);

%% Calculating the accuracy of the confusion matrix

sum=0;
for i=1:length(cm)
sum=sum+cm(i,i);    % Taking the diagonal matrix
end
accuracy = sum/length(predictions)*100; % Accuracy of the holdout method

end