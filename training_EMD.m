clear;clc;

load Emd_4.mat

X = normFun(table2array(Table_Feat(:, 1:end-1)));
Y = table2array(Table_Feat(:, end));

cv = 0.5;
Num_Nei = 2;

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

%% PCA

[coeff,score,latent,tsquared,explained,mu] = pca(X);

weight = cumsum(explained);

X_S = array2table(score(:,1:12));

[cm_S, accuracy_S] = HknnFun(X_S, Y, H_O, Num_Nei);

