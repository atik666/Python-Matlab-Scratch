clear;clc;
load('Table_Scale_DE.mat');
load('Table_Scale_FE.mat');
Table_Scale = [Table_Scale_DE, Table_Scale_FE];
load('class_labels.mat');

Data=[Table_Scale,class_labels];

%% Applying PCA

[coeff,score,latent,tsquared,explained,mu] = pca(table2array(Data(:,1:end-1)));

PC1 = score(:,1);
PC2 = score(:,2);
PC3 = score(:,3);
PC4 = score(:,4);
PC5 = score(:,5);
PC6 = score(:,6);
PC7 = score(:,7);

class_labels = table2array(class_labels);
data=table(PC1, PC2, PC3, PC4, PC5, PC6, class_labels);
%% -------------- Building Classifier ----------------------------
 
classification_model=fitcecoc(data,'class_labels');

%% -------------- Test and Train sets ----------------------------

% Partitioning the training and test set
cv=cvpartition(classification_model.NumObservations,'HoldOut', 0.2  );
cross_validated_model=crossval(classification_model,'cvpartition',cv);

%% -------------- Making Predictions for Test sets ---------------
 
predictions=predict(cross_validated_model.Trained{1},data(test(cv),1:end-1));

%% -------------- Analyzing the predictions ---------------------
 
results=confusionmat(cross_validated_model.Y(test(cv)),predictions);

%% Calculating the accuracy of the confusion matrix
sum=0;
for i=1:length(results)
sum=sum+results(i,i);    % Taking the diagonal matrix
end
accuracy_Test_holdout=sum/length(predictions)*100; % Accuracy of the holdout method

%% For training accuracy
predictions_train_holdout=predict(cross_validated_model.Trained{1},data(training(cv),1:end-1));
results_training_holdout=confusionmat(cross_validated_model.Y(training(cv)),predictions_train_holdout);

sum=0;
for i=1:length(results_training_holdout)
sum=sum+results_training_holdout(i,i);
end
accuracy_Train_holdout=sum/length(predictions_train_holdout)*100;

Holdout_accuracy=[accuracy_Train_holdout, accuracy_Test_holdout] % Test and Train accuracy of holdout method
%% Measuring the training accuracy for K-Fold
K_Fold = 5;
% setting the cross validation
cv_Train=cvpartition(classification_model.NumObservations,'KFold', K_Fold);
cross_validated_model_Train=crossval(classification_model,'cvpartition',cv_Train);

% Making the prediction
predict_Train = {};
for i=1:(cv_Train.NumTestSets)
   predict_Train{i,1}=predict(cross_validated_model_Train.Trained{i},data(training(cv_Train,i),1:end-1));
end

% Analyzing the prediction
results_Train={};
for i=1:(cv_Train.NumTestSets)
    results_Train{i,1}=confusionmat(cross_validated_model_Train.Y(training(cv_Train,i)),predict_Train{i,1});
end
    
%% Calculating the accuracy of the confusion matrix

% Calculating the true samples
sum_Train={};
sum=0;
for j=1:length(results_Train)     % j represents the cell dimension of the cell size
    while j <= length(results_Train) % when j is within the limit
    for i=1:length(results_Train{1,1})  % only i updates first
    sum = sum+results_Train{j,1}(i,i); % calculating the true samples in an array
    end
    sum_Train{j,1}=sum;  % true samples are stored in this function when i exceeds the condition
    j=j+1;    % j is incremented
    sum=0;   % sum is initialized
    end
end

% Predicting the Training accuracy of each K-Fold
for i=1:length(results_Train)
    accuracy_Train{i,1}=sum_Train{i,1}/length(predict_Train{i,1})*100;
end

%% Measuring the testing accuracy for K-Fold

% setting the cross validation
cv_Test=cvpartition(classification_model.NumObservations,'KFold', K_Fold);
cross_validated_model_Test=crossval(classification_model,'cvpartition',cv_Test);

% Making the prediction
predict_Test = {};
for i=1:(cv_Test.NumTestSets)
   predict_Test{i,1}=predict(cross_validated_model_Test.Trained{i},data(test(cv_Test,i),1:end-1));
end

% Analyzing the prediction
results_Test={};
for i=1:(cv_Test.NumTestSets)
    results_Test{i,1}=confusionmat(cross_validated_model_Test.Y(test(cv_Test,i)),predict_Test{i,1});
end

%% Calculating the accuracy of the confusion matrix

% Calculating the true samples
sum_Test={};
sum=0;
for j=1:length(results_Test)
    while j <= length(results_Test)
    for i=1:length(results_Test{1,1}) 
    sum = sum+results_Test{j,1}(i,i);
    end
    sum_Test{j,1}=sum;
    j=j+1;
    sum=0;
    end
end

% Predicting the Test accuracy of each K-Fold
for i=1:length(results_Test)
    accuracy_Test{i,1}=sum_Test{i,1}/length(predict_Test{i,1})*100;
end

% Calculating the Train and Test accuracy averaging all the K-Fold
Accuracy_KFold = [mean(cell2mat(accuracy_Train)), mean(cell2mat(accuracy_Test))]
