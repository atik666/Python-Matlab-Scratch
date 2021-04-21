clc;clear;
load('Table_Feat_Emd.mat');

Array_Feat = table2array(Table_Feat(:,1:end-1));

Table_Scale = normFun(Array_Feat);

%% Applying all data 
% Table_Scale = array2table(Table_Scale);
% 
% data = horzcat(Table_Scale, Table_Feat(:,end));

%% Applying PCA

[coeff,score,latent,tsquared,explained,mu] = pca(Table_Scale);
score_Select = array2table(score(:,1:50));
data = horzcat(score_Select, Table_Feat(:,end));

%% Classifier

classification_model=fitcecoc(data,'Array_Feat75');

cv=cvpartition(classification_model.NumObservations,'HoldOut', 0.2  );
cross_validated_model=crossval(classification_model,'cvpartition',cv);

predictions=predict(cross_validated_model.Trained{1},data(test(cv),1:end-1));

results=confusionmat(cross_validated_model.Y(test(cv)),predictions);

%% Calculating the accuracy of the confusion matrix
sum=0;
for i=1:length(results)
sum=sum+results(i,i);    % Taking the diagonal matrix
end
accuracy_Test_holdout=sum/length(predictions)*100; % Accuracy of the holdout method