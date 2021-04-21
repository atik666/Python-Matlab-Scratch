clear;clc;

load Emd_4.mat

X = normFun(table2array(Table_Feat(:, 1:end-1)));
Y = table2array(Table_Feat(:, end));

cv = 0.5;
Num_Nei = 2;


%%
CVKNNModel = fitcknn(X,Y,'Holdout',cv,'NumNeighbors',Nn);
% Partitioning the training and test set
cv=cvpartition(classification_model.NumObservations,'HoldOut', 0.2  );
cross_validated_model=crossval(classification_model,'cvpartition',cv);
predictions_train_holdout=predict(cross_validated_model.Trained{1},data(training(cv),1:end-1));
results_training_holdout=confusionmat(cross_validated_model.Y(training(cv)),predictions_train_holdout);

sum=0;
for i=1:length(results_training_holdout)
sum=sum+results_training_holdout(i,i);
end
accuracy_Train_holdout=sum/length(predictions_train_holdout)*100;

%%


tic
[cm, accuracy] = HknnFun(X, Y, H_O, Num_Nei);
toc


weight = cumsum(explained);

X_S = array2table(score(:,1:12));

tic
[cm_S, accuracy_S] = HknnFun(X_S, Y, H_O, Num_Nei);
toc

PCA_length = 40;

for i = 1:PCA_length
    X_S = array2table(score(:,1:i));
    [~,accuracy_S(i)] = HknnFun(X_S, Y, H_O, Num_Nei);
end

X_axis = (1:PCA_length);
plot(X_axis, accuracy_S,'r','LineWidth',2);
xlabel('Principal Components')
ylabel('Accuracy')

%plot(1:90, weight,'b','LineWidth',2);

[coeff,score,latent,tsquared,explained,mu] = pca(X);
%[coeff,score,latent,tsquared,explained,mu] = pca(sFeat);

%% LMD

Table_Feat = csvread('LMD_10.csv');

X = normFun(Table_Feat(:, 1:end-1));
Y = Table_Feat(:, end);

[coeff,score,latent,tsquared,explained,mu] = pca(X);
weight = cumsum(explained);
X_S = array2table(score(:,1:45));

cv = 0.2;
Num_Nei = 2;

[cm, accuracy] = HknnFun_train(X_S, Y, cv, Num_Nei);
