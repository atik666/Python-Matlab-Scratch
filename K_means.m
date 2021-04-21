clc;clear;
Fs= 12000; %Sampling frequency
load('base.mat');
B=X097_DE_time;
total_sample=B';   %total sample data

rpm=1797;        %rotor speed in rpm
speed=rpm/60;      %spped in Hz
data_cycle=Fs/speed;         %number of data/cycle

sample_duration=length(total_sample)/Fs;  %sampling duration

L=length(total_sample)/floor(data_cycle);  %number of total datasets
k=1;
for i=1:floor(L)
    E=total_sample(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [Xfft{i,1},fft{i,1}]=AV_FFT(E);   %FFT of the signal
    %[~,PSD{i,1}]=AV_PSD(E); %Power spectral density of the signal
end
for i=1:length(fft)
    fft_rms_data(i,1)=rms(fft{i,1});
    fft_var_data(i,1)=var(fft{i,1});
    fft_means_data(i,1)=mean(fft{i,1});
    fft_std_data(i,1)=std(fft{i,1});
    fft_kurtosis_data(i,1)=kurtosis(fft{i,1});
    fft_skewness_data(i,1)=skewness(fft{i,1});
end
Label1=ones(floor(L),1);
base_fft_V=horzcat(fft_rms_data,fft_var_data,fft_means_data,fft_std_data,fft_kurtosis_data,fft_skewness_data,Label1);
base_fft_T=array2table(base_fft_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Label'});
%% Inner race fault
load('ir.mat');
ir=X105_DE_time;
total_sample_ir=ir'; 

L_ir=length(total_sample_ir)/floor(data_cycle);
k=1;
for i=1:floor(L_ir)
    E=total_sample_ir(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [ir_Xfft{i,1},ir_fft{i,1}]=AV_FFT(E);   %FFT of the signal
end
for i=1:length(ir_fft)
    ir_fft_rms_data(i,1)=rms(ir_fft{i,1});
    ir_fft_var_data(i,1)=var(ir_fft{i,1});
    ir_fft_means_data(i,1)=mean(ir_fft{i,1});
    ir_fft_std_data(i,1)=std(ir_fft{i,1});
    ir_fft_kurtosis_data(i,1)=kurtosis(ir_fft{i,1});
    ir_fft_skewness_data(i,1)=skewness(ir_fft{i,1});
end
Label2=2*ones(floor(L_ir),1);
ir_fft_V=horzcat(ir_fft_rms_data,ir_fft_var_data,ir_fft_means_data,ir_fft_std_data,ir_fft_kurtosis_data,ir_fft_skewness_data,Label2);
ir_fft_T=array2table(ir_fft_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Label'});
%% Outer race fault
load('or.mat');
or=X130_DE_time;
total_sample_or=or'; 
 
L_or=length(total_sample_or)/floor(data_cycle);
k=1;
for i=1:floor(L_or)
    E=total_sample_or(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [or_Xfft{i,1},or_fft{i,1}]=AV_FFT(E);   %FFT of the signal
end
for i=1:length(or_fft)
    or_fft_rms_data(i,1)=rms(or_fft{i,1});
    or_fft_var_data(i,1)=var(or_fft{i,1});
    or_fft_means_data(i,1)=mean(or_fft{i,1});
    or_fft_std_data(i,1)=std(or_fft{i,1});
    or_fft_kurtosis_data(i,1)=kurtosis(or_fft{i,1});
    or_fft_skewness_data(i,1)=skewness(or_fft{i,1});
end
Label3=3*ones(floor(L_or),1);
or_fft_V=horzcat(or_fft_rms_data,or_fft_var_data,or_fft_means_data,or_fft_std_data,or_fft_kurtosis_data,or_fft_skewness_data,Label3);
or_fft_T=array2table(or_fft_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Label'});
%% Feature Table
Table_Feat=vertcat(base_fft_T,ir_fft_T,or_fft_T);
%% Train Data
Table_Train=vertcat(base_fft_T(1:400,:),ir_fft_T(1:200,:),or_fft_T(1:200,:));
%% Test Data
Table_Test=vertcat(base_fft_T(401:end,:),ir_fft_T(201:end,:),or_fft_T(201:end,:));
Prediction=Table_Test(:,1:end-1);
%{
yfit = trainedModel.predictFcn(Prediction);
Table_Test_array=table2array(Table_Test);
C = confusionmat(Table_Test_array(:,7),yfit);
%}

%% PCA
%{
%Generate Data
Data=table2array(Table_Feat(:,1:end-1));
%coeff = pca(Data);

%Covariance Matrix
C=cov(Data);

%Find PC1
[E,F]=eig(C);
[emax,emax_index]=max(diag(F));
u=E(:,emax_index)
 
%Transform Data
z=Data*u;

%Decode Data
y=z*u';

%Check if var(z)=emax

%Plot Results
figure;
scatter(Data(:,3),Data(:,6));  %,Data(:,3),Data(:,4),Data(:,5),Data(:,6));
hold on;
scatter(y(:,3),y(:,6));
%}

%% Data Set
%Table_Feat=vertcat(base_fft_T,ir_fft_T,or_fft_T);

%% Standardization 
stand_var1 = (Table_Feat.RMS - mean(Table_Feat.RMS))/std(Table_Feat.RMS);
Table_Scale.RMS = stand_var1; 

stand_var2 = (Table_Feat.Variance - mean(Table_Feat.Variance))/std(Table_Feat.Variance);
Table_Scale.Variance = stand_var2; 
 
stand_var3 = (Table_Feat.Mean - mean(Table_Feat.Mean))/std(Table_Feat.Mean);
Table_Scale.Mean = stand_var3; 

stand_var4 = (Table_Feat.STD - mean(Table_Feat.STD))/std(Table_Feat.STD);
Table_Scale.STD = stand_var4; 

stand_var5 = (Table_Feat.Kurtosis - mean(Table_Feat.Kurtosis))/std(Table_Feat.Kurtosis);
Table_Scale.Kurtosis = stand_var5; 
 
stand_var6 = (Table_Feat.Skewness - mean(Table_Feat.Skewness))/std(Table_Feat.Skewness);
Table_Scale.Skewness = stand_var6; 

Table_Scale=struct2table(Table_Scale);
%% Dimentionality Reduction

class_labels=Table_Feat.Label;
Table_Scale.Label=class_labels;

Data = table2array(Table_Scale);
[coeff,score,latent,tsquared,explained,mu] = pca(Data);
%Take PC based on the weight of 'explained'
PC1=score(:,1);
PC2 = score(:,2);
data=table(PC1, PC2, class_labels);
data=data(:,1:end-1);
data=table2array(data);

%% The Elbow Method

WCSS=[];
for k=1:10
    sumd=0;
    [idx,C,sumd]=kmeans(data,k);
    WCSS(k)=sum(sumd);
end

plot(1:10,WCSS);

%% K-means Clustering

[idx,c]=kmeans(data,3); % idx tells us which particular clustar the value belongs to
                        % C gives the center point of the cluster

%% Visualization

figure,

gscatter(data(:,1),data(:,2),idx);
hold on
for i=1:3
    scatter(C(i,1),C(i,2),96,'black','filled');
end
legend({'Cluster 1','Cluster 2','Cluster 3'});
xlabel('PC1');
ylabel('PC2');
hold off