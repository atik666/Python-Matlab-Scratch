clear;clc;
A=csvread('Dr_Ngui3.csv');
B=A';
data=B(1:1:end,:);
data=array2table(data);

%% Standardization

stand_data1 = (data.data1 - mean(data.data1))/std(data.data1);
data.data1 = stand_data1; 
 
stand_data2 = (data.data2 - mean(data.data2))/std(data.data2);
data.data2 = stand_data2; 

stand_data3 = (data.data3 - mean(data.data3))/std(data.data3);
data.data3 = stand_data3; 

stand_data4 = (data.data4 - mean(data.data4))/std(data.data4);
data.data4 = stand_data4; 
 
stand_data5 = (data.data5 - mean(data.data5))/std(data.data5);
data.data5 = stand_data5; 
 
stand_data6 = (data.data6 - mean(data.data6))/std(data.data6);
data.data6 = stand_data6; 
 
stand_data7 = (data.data7 - mean(data.data7))/std(data.data7);
data.data7 = stand_data7; 
 
stand_data8 = (data.data8 - mean(data.data8))/std(data.data8);
data.data8 = stand_data8; 
 
stand_data9 = (data.data9 - mean(data.data9))/std(data.data9);
data.data9 = stand_data9; 

data=table2array(data);

%% Applying PCA

[coeff,score,latent,tsquared,explained,mu] = pca(data);
%Take PC based on the weight of 'explained'
PC1=score(:,1);
PC2=score(:,2);
data=[PC1, PC2];

%% The Elbow Method

WCSS=[];
est=8; % Estimating the initial number of clusters
for k=1:est
    sumd=0;
    [idx,C,sumd]=kmeans(data,k);
    WCSS(k)=sum(sumd);
end

plot(1:est,WCSS);
 
%% K-means Clustering

k_num=3; % Number of clusters
[idx,c]=kmeans(data,k_num); % idx tells us which particular clustar the value belongs to
                        % C gives the center point of the cluster

%% Visualization

figure,

gscatter(data(:,1),data(:,2),idx);
hold on
for i=1:k_num
    scatter(C(i,1),C(i,2),96,'black','filled');
end
legend({'Cluster 1','Cluster 2','Cluster 3'});
title('K-means Clustering with X , Y & Z  axis'); 
xlabel('PC1');
ylabel('PC2');
hold off