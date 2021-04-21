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
Data=table2array(Table_Feat(:,1:end));
X=Data(:,1:end-1);
y=Data(:,end);

%% To know how many PCA should be used
C=cov(X); %Covariance of Data
e=eig(C); %eigen value
e=sort(eig(C),'descend'); %sorting eigen value in descending order
sum(e); %Sum of eigen value
cumsum(e); %Cumulative Sum of eigen value
cumsum(e)/sum(e); %Normalization
plot(cumsum(e)/sum(e)); %Plot to see the percentage of data by PCA

%% PCA Function
m=3;
[Trans,Score]=pca(X, 'NumComponents',m);
figure;
scatter(Score(:,1),Score(:,2),25,y,'filled');
colormap(jet);
colorbar;
