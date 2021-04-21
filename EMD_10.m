clear;clc;

Fs= 12000; %Sampling frequency
rpm=1797;        %rotor speed in rpm
speed=rpm/60;      %speed in Hz
data_cycle=3*Fs/speed;         %number of data/cycle

load('base.mat');

sample_duration=length(X097_DE_time)/Fs; 
%L=length(X097_DE_time)/floor(data_cycle);
L = 90;

k=1;
for i=1:L
    E=X097_DE_time(k:k+floor(data_cycle)-1);
    IMF_DE{i,1} = emd(E);
    F = X097_FE_time(k:k+floor(data_cycle)-1);
    IMF_FE{i,1} = emd(F);
    k=k+floor(data_cycle);
end     

load('IR007_0.mat');
k=1;
for i=1:L
    E=X105_DE_time(k:k+floor(data_cycle)-1);
    IMF_DE_IR_007{i,1} = emd(E);
    F = X105_FE_time(k:k+floor(data_cycle)-1);
    IMF_FE_IR_007{i,1} = emd(F);
    k=k+floor(data_cycle);
end     

load('IR014_0.mat');
k=1;
for i=1:L
    E=X169_DE_time(k:k+floor(data_cycle)-1);
    IMF_DE_IR_014{i,1} = emd(E);
    F = X169_FE_time(k:k+floor(data_cycle)-1);
    IMF_FE_IR_014{i,1} = emd(F);
    k=k+floor(data_cycle);
end     

load('IR021_0.mat');
k=1;
for i=1:L
    E=X209_DE_time(k:k+floor(data_cycle)-1);
    IMF_DE_IR_021{i,1} = emd(E);
    F = X209_FE_time(k:k+floor(data_cycle)-1);
    IMF_FE_IR_021{i,1} = emd(F);
    k=k+floor(data_cycle);
end     

load('OR007@6_0.mat');
k=1;
for i=1:L
    E=X130_DE_time(k:k+floor(data_cycle)-1);
    IMF_DE_OR_007{i,1} = emd(E);
    F = X130_FE_time(k:k+floor(data_cycle)-1);
    IMF_FE_OR_007{i,1} = emd(F);
    k=k+floor(data_cycle);
end  

load('OR014@6_0.mat');
k=1;
for i=1:L
    E=X197_DE_time(k:k+floor(data_cycle)-1);
    IMF_DE_OR_014{i,1} = emd(E);
    F = X197_FE_time(k:k+floor(data_cycle)-1);
    IMF_FE_OR_014{i,1} = emd(F);
    k=k+floor(data_cycle);
end

load('OR021@6_0.mat');
k=1;
for i=1:L
    E=X234_DE_time(k:k+floor(data_cycle)-1);
    IMF_DE_OR_021{i,1} = emd(E);
    F = X234_FE_time(k:k+floor(data_cycle)-1);
    IMF_FE_OR_021{i,1} = emd(F);
    k=k+floor(data_cycle);
end

load('B007_0.mat');
k=1;
for i=1:L
    E=X118_DE_time(k:k+floor(data_cycle)-1);
    IMF_DE_BF_007{i,1} = emd(E);
    F = X118_FE_time(k:k+floor(data_cycle)-1);
    IMF_FE_BF_007{i,1} = emd(F);
    k=k+floor(data_cycle);
end

load('B014_0.mat');
k=1;
for i=1:L
    E=X185_DE_time(k:k+floor(data_cycle)-1);
    IMF_DE_BF_014{i,1} = emd(E);
    F = X185_FE_time(k:k+floor(data_cycle)-1);
    IMF_FE_BF_014{i,1} = emd(F);
    k=k+floor(data_cycle);
end

load('B021_0.mat');
k=1;
for i=1:L
    E=X222_DE_time(k:k+floor(data_cycle)-1);
    IMF_DE_BF_021{i,1} = emd(E);
    F = X222_FE_time(k:k+floor(data_cycle)-1);
    IMF_FE_BF_021{i,1} = emd(F);
    k=k+floor(data_cycle);
end
 

for i=1:L
    IMF_DE_rms{i,1}=rms(IMF_DE{i,1}(:,1:5));
    IMF_DE_var{i,1}=var(IMF_DE{i,1}(:,1:5));
    IMF_DE_means{i,1}=mean(IMF_DE{i,1}(:,1:5));
    IMF_DE_std{i,1}=std(IMF_DE{i,1}(:,1:5));
    IMF_DE_kurtosis{i,1}=kurtosis(IMF_DE{i,1}(:,1:5));
    IMF_DE_skewness{i,1}=skewness(IMF_DE{i,1}(:,1:5));
    IMF_DE_peaks{i,1}= max(IMF_DE{i,1}(:,1:5));
    IMF_DE_crestFactor{i,1}= peak2rms(IMF_DE{i,1}(:,1:5));
    %IMF_DE_snr{i,1}= snr(IMF_DE{i,1}(:,1:5));
    IMF_DE_entropy{i,1}= EnergyFun(IMF_DE{i,1}(:,1:5));
    
    IMF_FE_rms{i,1}=rms(IMF_FE{i,1}(:,1:5));
    IMF_FE_var{i,1}=var(IMF_FE{i,1}(:,1:5));
    IMF_FE_means{i,1}=mean(IMF_FE{i,1}(:,1:5));
    IMF_FE_std{i,1}=std(IMF_FE{i,1}(:,1:5));
    IMF_FE_kurtosis{i,1}=kurtosis(IMF_FE{i,1}(:,1:5));
    IMF_FE_skewness{i,1}=skewness(IMF_FE{i,1}(:,1:5));
    IMF_FE_peaks{i,1}= max(IMF_FE{i,1}(:,1:5));
    IMF_FE_crestFactor{i,1}= peak2rms(IMF_FE{i,1}(:,1:5));
    %IMF_FE_snr{i,1}= snr(IMF_FE{i,1}(:,1:5));
    IMF_FE_entropy{i,1}= EnergyFun(IMF_FE{i,1}(:,1:5));
    
    IMF_DE_IR_007_rms{i,1}=rms(IMF_DE_IR_007{i,1}(:,1:5));
    IMF_DE_IR_007_var{i,1}=var(IMF_DE_IR_007{i,1}(:,1:5));
    IMF_DE_IR_007_means{i,1}=mean(IMF_DE_IR_007{i,1}(:,1:5));
    IMF_DE_IR_007_std{i,1}=std(IMF_DE_IR_007{i,1}(:,1:5));
    IMF_DE_IR_007_kurtosis{i,1}=kurtosis(IMF_DE_IR_007{i,1}(:,1:5));
    IMF_DE_IR_007_skewness{i,1}=skewness(IMF_DE_IR_007{i,1}(:,1:5));
    IMF_DE_IR_007_peaks{i,1}= max(IMF_DE_IR_007{i,1}(:,1:5));
    IMF_DE_IR_007_crestFactor{i,1}= peak2rms(IMF_DE_IR_007{i,1}(:,1:5));
    %IMF_DE_IR_007_snr{i,1}= snr(IMF_DE_IR_007{i,1}(:,1:5));
    IMF_DE_IR_007_entropy{i,1}= EnergyFun(IMF_DE_IR_007{i,1}(:,1:5));
    
    IMF_FE_IR_007_rms{i,1}=rms(IMF_FE_IR_007{i,1}(:,1:5));
    IMF_FE_IR_007_var{i,1}=var(IMF_FE_IR_007{i,1}(:,1:5));
    IMF_FE_IR_007_means{i,1}=mean(IMF_FE_IR_007{i,1}(:,1:5));
    IMF_FE_IR_007_std{i,1}=std(IMF_FE_IR_007{i,1}(:,1:5));
    IMF_FE_IR_007_kurtosis{i,1}=kurtosis(IMF_FE_IR_007{i,1}(:,1:5));
    IMF_FE_IR_007_skewness{i,1}=skewness(IMF_FE_IR_007{i,1}(:,1:5));
    IMF_FE_IR_007_peaks{i,1}= max(IMF_FE_IR_007{i,1}(:,1:5));
    IMF_FE_IR_007_crestFactor{i,1}= peak2rms(IMF_FE_IR_007{i,1}(:,1:5));
    %IMF_FE_IR_007_snr{i,1}= snr(IMF_FE_IR_007{i,1}(:,1:5));
    IMF_FE_IR_007_entropy{i,1}= EnergyFun(IMF_FE_IR_007{i,1}(:,1:5));
    
    IMF_DE_IR_014_rms{i,1}=rms(IMF_DE_IR_014{i,1}(:,1:5));
    IMF_DE_IR_014_var{i,1}=var(IMF_DE_IR_014{i,1}(:,1:5));
    IMF_DE_IR_014_means{i,1}=mean(IMF_DE_IR_014{i,1}(:,1:5));
    IMF_DE_IR_014_std{i,1}=std(IMF_DE_IR_014{i,1}(:,1:5));
    IMF_DE_IR_014_kurtosis{i,1}=kurtosis(IMF_DE_IR_014{i,1}(:,1:5));
    IMF_DE_IR_014_skewness{i,1}=skewness(IMF_DE_IR_014{i,1}(:,1:5));
    IMF_DE_IR_014_peaks{i,1}= max(IMF_DE_IR_014{i,1}(:,1:5));
    IMF_DE_IR_014_crestFactor{i,1}= peak2rms(IMF_DE_IR_014{i,1}(:,1:5));
    %IMF_DE_IR_014_snr{i,1}= snr(IMF_DE_IR_014{i,1}(:,1:5));
    IMF_DE_IR_014_entropy{i,1}= EnergyFun(IMF_DE_IR_014{i,1}(:,1:5));
    
    IMF_FE_IR_014_rms{i,1}=rms(IMF_FE_IR_014{i,1}(:,1:5));
    IMF_FE_IR_014_var{i,1}=var(IMF_FE_IR_014{i,1}(:,1:5));
    IMF_FE_IR_014_means{i,1}=mean(IMF_FE_IR_014{i,1}(:,1:5));
    IMF_FE_IR_014_std{i,1}=std(IMF_FE_IR_014{i,1}(:,1:5));
    IMF_FE_IR_014_kurtosis{i,1}=kurtosis(IMF_FE_IR_014{i,1}(:,1:5));
    IMF_FE_IR_014_skewness{i,1}=skewness(IMF_FE_IR_014{i,1}(:,1:5));
    IMF_FE_IR_014_peaks{i,1}= max(IMF_FE_IR_014{i,1}(:,1:5));
    IMF_FE_IR_014_crestFactor{i,1}= peak2rms(IMF_FE_IR_014{i,1}(:,1:5));
    %IMF_FE_IR_014_snr{i,1}= snr(IMF_FE_IR_014{i,1}(:,1:5));
    IMF_FE_IR_014_entropy{i,1}= EnergyFun(IMF_FE_IR_014{i,1}(:,1:5));
    
    IMF_DE_IR_021_rms{i,1}=rms(IMF_DE_IR_021{i,1}(:,1:5));
    IMF_DE_IR_021_var{i,1}=var(IMF_DE_IR_021{i,1}(:,1:5));
    IMF_DE_IR_021_means{i,1}=mean(IMF_DE_IR_021{i,1}(:,1:5));
    IMF_DE_IR_021_std{i,1}=std(IMF_DE_IR_021{i,1}(:,1:5));
    IMF_DE_IR_021_kurtosis{i,1}=kurtosis(IMF_DE_IR_021{i,1}(:,1:5));
    IMF_DE_IR_021_skewness{i,1}=skewness(IMF_DE_IR_021{i,1}(:,1:5));
    IMF_DE_IR_021_peaks{i,1}= max(IMF_DE_IR_021{i,1}(:,1:5));
    IMF_DE_IR_021_crestFactor{i,1}= peak2rms(IMF_DE_IR_021{i,1}(:,1:5));
    %IMF_DE_IR_021_snr{i,1}= snr(IMF_DE_IR_021{i,1}(:,1:5));
    IMF_DE_IR_021_entropy{i,1}= EnergyFun(IMF_DE_IR_021{i,1}(:,1:5));
    
    IMF_FE_IR_021_rms{i,1}=rms(IMF_FE_IR_021{i,1}(:,1:5));
    IMF_FE_IR_021_var{i,1}=var(IMF_FE_IR_021{i,1}(:,1:5));
    IMF_FE_IR_021_means{i,1}=mean(IMF_FE_IR_021{i,1}(:,1:5));
    IMF_FE_IR_021_std{i,1}=std(IMF_FE_IR_021{i,1}(:,1:5));
    IMF_FE_IR_021_kurtosis{i,1}=kurtosis(IMF_FE_IR_021{i,1}(:,1:5));
    IMF_FE_IR_021_skewness{i,1}=skewness(IMF_FE_IR_021{i,1}(:,1:5));
    IMF_FE_IR_021_peaks{i,1}= max(IMF_FE_IR_021{i,1}(:,1:5));
    IMF_FE_IR_021_crestFactor{i,1}= peak2rms(IMF_FE_IR_021{i,1}(:,1:5));
    %IMF_FE_IR_021_snr{i,1}= snr(IMF_FE_IR_021{i,1}(:,1:5));
    IMF_FE_IR_021_entropy{i,1}= EnergyFun(IMF_FE_IR_021{i,1}(:,1:5));
    
    IMF_DE_OR_007_rms{i,1}=rms(IMF_DE_OR_007{i,1}(:,1:5));
    IMF_DE_OR_007_var{i,1}=var(IMF_DE_OR_007{i,1}(:,1:5));
    IMF_DE_OR_007_means{i,1}=mean(IMF_DE_OR_007{i,1}(:,1:5));
    IMF_DE_OR_007_std{i,1}=std(IMF_DE_OR_007{i,1}(:,1:5));
    IMF_DE_OR_007_kurtosis{i,1}=kurtosis(IMF_DE_OR_007{i,1}(:,1:5));
    IMF_DE_OR_007_skewness{i,1}=skewness(IMF_DE_OR_007{i,1}(:,1:5));
    IMF_DE_OR_007_peaks{i,1}= max(IMF_DE_OR_007{i,1}(:,1:5));
    IMF_DE_OR_007_crestFactor{i,1}= peak2rms(IMF_DE_OR_007{i,1}(:,1:5));
    %IMF_DE_OR_007_snr{i,1}= snr(IMF_DE_OR_007{i,1}(:,1:5));
    IMF_DE_OR_007_entropy{i,1}= EnergyFun(IMF_DE_OR_007{i,1}(:,1:5));
    
    IMF_FE_OR_007_rms{i,1}=rms(IMF_FE_OR_007{i,1}(:,1:5));
    IMF_FE_OR_007_var{i,1}=var(IMF_FE_OR_007{i,1}(:,1:5));
    IMF_FE_OR_007_means{i,1}=mean(IMF_FE_OR_007{i,1}(:,1:5));
    IMF_FE_OR_007_std{i,1}=std(IMF_FE_OR_007{i,1}(:,1:5));
    IMF_FE_OR_007_kurtosis{i,1}=kurtosis(IMF_FE_OR_007{i,1}(:,1:5));
    IMF_FE_OR_007_skewness{i,1}=skewness(IMF_FE_OR_007{i,1}(:,1:5));
    IMF_FE_OR_007_peaks{i,1}= max(IMF_FE_OR_007{i,1}(:,1:5));
    IMF_FE_OR_007_crestFactor{i,1}= peak2rms(IMF_FE_OR_007{i,1}(:,1:5));
    %IMF_FE_OR_007_snr{i,1}= snr(IMF_FE_OR_007{i,1}(:,1:5));
    IMF_FE_OR_007_entropy{i,1}= EnergyFun(IMF_FE_OR_007{i,1}(:,1:5));
    
    IMF_DE_OR_014_rms{i,1}=rms(IMF_DE_OR_014{i,1}(:,1:5));
    IMF_DE_OR_014_var{i,1}=var(IMF_DE_OR_014{i,1}(:,1:5));
    IMF_DE_OR_014_means{i,1}=mean(IMF_DE_OR_014{i,1}(:,1:5));
    IMF_DE_OR_014_std{i,1}=std(IMF_DE_OR_014{i,1}(:,1:5));
    IMF_DE_OR_014_kurtosis{i,1}=kurtosis(IMF_DE_OR_014{i,1}(:,1:5));
    IMF_DE_OR_014_skewness{i,1}=skewness(IMF_DE_OR_014{i,1}(:,1:5));
    IMF_DE_OR_014_peaks{i,1}= max(IMF_DE_OR_014{i,1}(:,1:5));
    IMF_DE_OR_014_crestFactor{i,1}= peak2rms(IMF_DE_OR_014{i,1}(:,1:5));
    %IMF_DE_OR_014_snr{i,1}= snr(IMF_DE_OR_014{i,1}(:,1:5));
    IMF_DE_OR_014_entropy{i,1}= EnergyFun(IMF_DE_OR_014{i,1}(:,1:5));
    
    IMF_FE_OR_014_rms{i,1}=rms(IMF_FE_OR_014{i,1}(:,1:5));
    IMF_FE_OR_014_var{i,1}=var(IMF_FE_OR_014{i,1}(:,1:5));
    IMF_FE_OR_014_means{i,1}=mean(IMF_FE_OR_014{i,1}(:,1:5));
    IMF_FE_OR_014_std{i,1}=std(IMF_FE_OR_014{i,1}(:,1:5));
    IMF_FE_OR_014_kurtosis{i,1}=kurtosis(IMF_FE_OR_014{i,1}(:,1:5));
    IMF_FE_OR_014_skewness{i,1}=skewness(IMF_FE_OR_014{i,1}(:,1:5));
    IMF_FE_OR_014_peaks{i,1}= max(IMF_FE_OR_014{i,1}(:,1:5));
    IMF_FE_OR_014_crestFactor{i,1}= peak2rms(IMF_FE_OR_014{i,1}(:,1:5));
    %IMF_FE_OR_014_snr{i,1}= snr(IMF_FE_OR_014{i,1}(:,1:5));
    IMF_FE_OR_014_entropy{i,1}= EnergyFun(IMF_FE_OR_014{i,1}(:,1:5));
    
    IMF_DE_OR_021_rms{i,1}=rms(IMF_DE_OR_021{i,1}(:,1:5));
    IMF_DE_OR_021_var{i,1}=var(IMF_DE_OR_021{i,1}(:,1:5));
    IMF_DE_OR_021_means{i,1}=mean(IMF_DE_OR_021{i,1}(:,1:5));
    IMF_DE_OR_021_std{i,1}=std(IMF_DE_OR_021{i,1}(:,1:5));
    IMF_DE_OR_021_kurtosis{i,1}=kurtosis(IMF_DE_OR_021{i,1}(:,1:5));
    IMF_DE_OR_021_skewness{i,1}=skewness(IMF_DE_OR_021{i,1}(:,1:5));
    IMF_DE_OR_021_peaks{i,1}= max(IMF_DE_OR_021{i,1}(:,1:5));
    IMF_DE_OR_021_crestFactor{i,1}= peak2rms(IMF_DE_OR_021{i,1}(:,1:5));
    %IMF_DE_OR_021_snr{i,1}= snr(IMF_DE_OR_021{i,1}(:,1:5));
    IMF_DE_OR_021_entropy{i,1}= EnergyFun(IMF_DE_OR_021{i,1}(:,1:5));
    
    IMF_FE_OR_021_rms{i,1}=rms(IMF_FE_OR_021{i,1}(:,1:5));
    IMF_FE_OR_021_var{i,1}=var(IMF_FE_OR_021{i,1}(:,1:5));
    IMF_FE_OR_021_means{i,1}=mean(IMF_FE_OR_021{i,1}(:,1:5));
    IMF_FE_OR_021_std{i,1}=std(IMF_FE_OR_021{i,1}(:,1:5));
    IMF_FE_OR_021_kurtosis{i,1}=kurtosis(IMF_FE_OR_021{i,1}(:,1:5));
    IMF_FE_OR_021_skewness{i,1}=skewness(IMF_FE_OR_021{i,1}(:,1:5));
    IMF_FE_OR_021_peaks{i,1}= max(IMF_FE_OR_021{i,1}(:,1:5));
    IMF_FE_OR_021_crestFactor{i,1}= peak2rms(IMF_FE_OR_021{i,1}(:,1:5));
    %IMF_FE_OR_021_snr{i,1}= snr(IMF_FE_OR_021{i,1}(:,1:5));
    IMF_FE_OR_021_entropy{i,1}= EnergyFun(IMF_FE_OR_021{i,1}(:,1:5));
    
    IMF_DE_BF_007_rms{i,1}=rms(IMF_DE_BF_007{i,1}(:,1:5));
    IMF_DE_BF_007_var{i,1}=var(IMF_DE_BF_007{i,1}(:,1:5));
    IMF_DE_BF_007_means{i,1}=mean(IMF_DE_BF_007{i,1}(:,1:5));
    IMF_DE_BF_007_std{i,1}=std(IMF_DE_BF_007{i,1}(:,1:5));
    IMF_DE_BF_007_kurtosis{i,1}=kurtosis(IMF_DE_BF_007{i,1}(:,1:5));
    IMF_DE_BF_007_skewness{i,1}=skewness(IMF_DE_BF_007{i,1}(:,1:5));
    IMF_DE_BF_007_peaks{i,1}= max(IMF_DE_BF_007{i,1}(:,1:5));
    IMF_DE_BF_007_crestFactor{i,1}= peak2rms(IMF_DE_BF_007{i,1}(:,1:5));
    %IMF_DE_BF_007_snr{i,1}= snr(IMF_DE_BF_007{i,1}(:,1:5));
    IMF_DE_BF_007_entropy{i,1}= EnergyFun(IMF_DE_BF_007{i,1}(:,1:5));
    
    IMF_FE_BF_007_rms{i,1}=rms(IMF_FE_BF_007{i,1}(:,1:5));
    IMF_FE_BF_007_var{i,1}=var(IMF_FE_BF_007{i,1}(:,1:5));
    IMF_FE_BF_007_means{i,1}=mean(IMF_FE_BF_007{i,1}(:,1:5));
    IMF_FE_BF_007_std{i,1}=std(IMF_FE_BF_007{i,1}(:,1:5));
    IMF_FE_BF_007_kurtosis{i,1}=kurtosis(IMF_FE_BF_007{i,1}(:,1:5));
    IMF_FE_BF_007_skewness{i,1}=skewness(IMF_FE_BF_007{i,1}(:,1:5));
    IMF_FE_BF_007_peaks{i,1}= max(IMF_FE_BF_007{i,1}(:,1:5));
    IMF_FE_BF_007_crestFactor{i,1}= peak2rms(IMF_FE_BF_007{i,1}(:,1:5));
    %IMF_FE_BF_007_snr{i,1}= snr(IMF_FE_BF_007{i,1}(:,1:5));
    IMF_FE_BF_007_entropy{i,1}= EnergyFun(IMF_FE_BF_007{i,1}(:,1:5));
    
    IMF_DE_BF_014_rms{i,1}=rms(IMF_DE_BF_014{i,1}(:,1:5));
    IMF_DE_BF_014_var{i,1}=var(IMF_DE_BF_014{i,1}(:,1:5));
    IMF_DE_BF_014_means{i,1}=mean(IMF_DE_BF_014{i,1}(:,1:5));
    IMF_DE_BF_014_std{i,1}=std(IMF_DE_BF_014{i,1}(:,1:5));
    IMF_DE_BF_014_kurtosis{i,1}=kurtosis(IMF_DE_BF_014{i,1}(:,1:5));
    IMF_DE_BF_014_skewness{i,1}=skewness(IMF_DE_BF_014{i,1}(:,1:5));
    IMF_DE_BF_014_peaks{i,1}= max(IMF_DE_BF_014{i,1}(:,1:5));
    IMF_DE_BF_014_crestFactor{i,1}= peak2rms(IMF_DE_BF_014{i,1}(:,1:5));
    %IMF_DE_BF_014_snr{i,1}= snr(IMF_DE_BF_014{i,1}(:,1:5));
    IMF_DE_BF_014_entropy{i,1}= EnergyFun(IMF_DE_BF_014{i,1}(:,1:5));
    
    IMF_FE_BF_014_rms{i,1}=rms(IMF_FE_BF_014{i,1}(:,1:5));
    IMF_FE_BF_014_var{i,1}=var(IMF_FE_BF_014{i,1}(:,1:5));
    IMF_FE_BF_014_means{i,1}=mean(IMF_FE_BF_014{i,1}(:,1:5));
    IMF_FE_BF_014_std{i,1}=std(IMF_FE_BF_014{i,1}(:,1:5));
    IMF_FE_BF_014_kurtosis{i,1}=kurtosis(IMF_FE_BF_014{i,1}(:,1:5));
    IMF_FE_BF_014_skewness{i,1}=skewness(IMF_FE_BF_014{i,1}(:,1:5));
    IMF_FE_BF_014_peaks{i,1}= max(IMF_FE_BF_014{i,1}(:,1:5));
    IMF_FE_BF_014_crestFactor{i,1}= peak2rms(IMF_FE_BF_014{i,1}(:,1:5));
    %IMF_FE_BF_014_snr{i,1}= snr(IMF_FE_BF_014{i,1}(:,1:5));
    IMF_FE_BF_014_entropy{i,1}= EnergyFun(IMF_FE_BF_014{i,1}(:,1:5));
    
    IMF_DE_BF_021_rms{i,1}=rms(IMF_DE_BF_021{i,1}(:,1:5));
    IMF_DE_BF_021_var{i,1}=var(IMF_DE_BF_021{i,1}(:,1:5));
    IMF_DE_BF_021_means{i,1}=mean(IMF_DE_BF_021{i,1}(:,1:5));
    IMF_DE_BF_021_std{i,1}=std(IMF_DE_BF_021{i,1}(:,1:5));
    IMF_DE_BF_021_kurtosis{i,1}=kurtosis(IMF_DE_BF_021{i,1}(:,1:5));
    IMF_DE_BF_021_skewness{i,1}=skewness(IMF_DE_BF_021{i,1}(:,1:5));
    IMF_DE_BF_021_peaks{i,1}= max(IMF_DE_BF_021{i,1}(:,1:5));
    IMF_DE_BF_021_crestFactor{i,1}= peak2rms(IMF_DE_BF_021{i,1}(:,1:5));
    %IMF_DE_BF_021_snr{i,1}= snr(IMF_DE_BF_021{i,1}(:,1:5));
    IMF_DE_BF_021_entropy{i,1}= EnergyFun(IMF_DE_BF_021{i,1}(:,1:5));
    
    IMF_FE_BF_021_rms{i,1}=rms(IMF_FE_BF_021{i,1}(:,1:5));
    IMF_FE_BF_021_var{i,1}=var(IMF_FE_BF_021{i,1}(:,1:5));
    IMF_FE_BF_021_means{i,1}=mean(IMF_FE_BF_021{i,1}(:,1:5));
    IMF_FE_BF_021_std{i,1}=std(IMF_FE_BF_021{i,1}(:,1:5));
    IMF_FE_BF_021_kurtosis{i,1}=kurtosis(IMF_FE_BF_021{i,1}(:,1:5));
    IMF_FE_BF_021_skewness{i,1}=skewness(IMF_FE_BF_021{i,1}(:,1:5));
    IMF_FE_BF_021_peaks{i,1}= max(IMF_FE_BF_021{i,1}(:,1:5));
    IMF_FE_BF_021_crestFactor{i,1}= peak2rms(IMF_FE_BF_021{i,1}(:,1:5));
    %IMF_FE_BF_021_snr{i,1}= snr(IMF_FE_BF_021{i,1}(:,1:5));
    IMF_FE_BF_021_entropy{i,1}= EnergyFun(IMF_FE_BF_021{i,1}(:,1:5));

end

Label1=ones(L,1);
Label1 = num2cell(Label1);

IMF_DE_emd_V=horzcat(IMF_DE_rms,IMF_DE_var,IMF_DE_means,IMF_DE_std,IMF_DE_kurtosis,...
    IMF_DE_skewness,IMF_DE_peaks, IMF_DE_crestFactor, IMF_DE_entropy);
IMF_FE_emd_V=horzcat(IMF_FE_rms,IMF_FE_var,IMF_FE_means,IMF_FE_std,IMF_FE_kurtosis,...
    IMF_FE_skewness,IMF_FE_peaks, IMF_FE_crestFactor, IMF_FE_entropy,Label1);

IMF_DE_emd_V = cell2mat(IMF_DE_emd_V);
IMF_FE_emd_V = cell2mat(IMF_FE_emd_V);

IMF_1 = [IMF_DE_emd_V, IMF_FE_emd_V];

Label2=2*ones(L,1);
Label2 = num2cell(Label2);

IMF_DE_IR_007_emd_V=horzcat(IMF_DE_IR_007_rms,IMF_DE_IR_007_var,IMF_DE_IR_007_means,IMF_DE_IR_007_std,IMF_DE_IR_007_kurtosis,...
    IMF_DE_IR_007_skewness,IMF_DE_IR_007_peaks, IMF_DE_IR_007_crestFactor, IMF_DE_IR_007_entropy);
IMF_FE_IR_007_emd_V=horzcat(IMF_FE_IR_007_rms,IMF_FE_IR_007_var,IMF_FE_IR_007_means,IMF_FE_IR_007_std,IMF_FE_IR_007_kurtosis,...
    IMF_FE_IR_007_skewness,IMF_FE_IR_007_peaks, IMF_FE_IR_007_crestFactor, IMF_FE_IR_007_entropy,Label2);

IMF_DE_IR_007_emd_V = cell2mat(IMF_DE_IR_007_emd_V);
IMF_FE_IR_007_emd_V = cell2mat(IMF_FE_IR_007_emd_V);

IMF_2 = [IMF_DE_IR_007_emd_V, IMF_FE_IR_007_emd_V];

Label3=3*ones(L,1);
Label3 = num2cell(Label3);

IMF_DE_IR_014_emd_V=horzcat(IMF_DE_IR_014_rms,IMF_DE_IR_014_var,IMF_DE_IR_014_means,IMF_DE_IR_014_std,IMF_DE_IR_014_kurtosis,...
    IMF_DE_IR_014_skewness,IMF_DE_IR_014_peaks, IMF_DE_IR_014_crestFactor, IMF_DE_IR_014_entropy);
IMF_FE_IR_014_emd_V=horzcat(IMF_FE_IR_014_rms,IMF_FE_IR_014_var,IMF_FE_IR_014_means,IMF_FE_IR_014_std,IMF_FE_IR_014_kurtosis,...
    IMF_FE_IR_014_skewness,IMF_FE_IR_014_peaks, IMF_FE_IR_014_crestFactor, IMF_FE_IR_014_entropy,Label3);

IMF_DE_IR_014_emd_V = cell2mat(IMF_DE_IR_014_emd_V);
IMF_FE_IR_014_emd_V = cell2mat(IMF_FE_IR_014_emd_V);

IMF_3 = [IMF_DE_IR_014_emd_V, IMF_FE_IR_014_emd_V];

Label4=4*ones(L,1);
Label4 = num2cell(Label4);

IMF_DE_IR_021_emd_V=horzcat(IMF_DE_IR_021_rms,IMF_DE_IR_021_var,IMF_DE_IR_021_means,IMF_DE_IR_021_std,IMF_DE_IR_021_kurtosis,...
    IMF_DE_IR_021_skewness,IMF_DE_IR_021_peaks, IMF_DE_IR_021_crestFactor, IMF_DE_IR_021_entropy);
IMF_FE_IR_021_emd_V=horzcat(IMF_FE_IR_021_rms,IMF_FE_IR_021_var,IMF_FE_IR_021_means,IMF_FE_IR_021_std,IMF_FE_IR_021_kurtosis,...
    IMF_FE_IR_021_skewness,IMF_FE_IR_021_peaks, IMF_FE_IR_021_crestFactor, IMF_FE_IR_021_entropy,Label4);

IMF_DE_IR_021_emd_V = cell2mat(IMF_DE_IR_021_emd_V);
IMF_FE_IR_021_emd_V = cell2mat(IMF_FE_IR_021_emd_V);

IMF_4 = [IMF_DE_IR_021_emd_V, IMF_FE_IR_021_emd_V];

Label5=5*ones(L,1);
Label5 = num2cell(Label5);
IMF_DE_OR_007_emd_V=horzcat(IMF_DE_OR_007_rms,IMF_DE_OR_007_var,IMF_DE_OR_007_means,IMF_DE_OR_007_std,IMF_DE_OR_007_kurtosis,IMF_DE_OR_007_skewness,IMF_DE_OR_007_peaks, IMF_DE_OR_007_crestFactor, IMF_DE_OR_007_entropy);
IMF_FE_OR_007_emd_V=horzcat(IMF_FE_OR_007_rms,IMF_FE_OR_007_var,IMF_FE_OR_007_means,IMF_FE_OR_007_std,IMF_FE_OR_007_kurtosis,IMF_FE_OR_007_skewness,IMF_FE_OR_007_peaks, IMF_FE_OR_007_crestFactor, IMF_FE_OR_007_entropy,Label5);

IMF_DE_OR_007_emd_V = cell2mat(IMF_DE_OR_007_emd_V);
IMF_FE_OR_007_emd_V = cell2mat(IMF_FE_OR_007_emd_V);

IMF_5 = [IMF_DE_OR_007_emd_V, IMF_FE_OR_007_emd_V];

Label6=6*ones(L,1);
Label6 = num2cell(Label6);

IMF_DE_OR_014_emd_V=horzcat(IMF_DE_OR_014_rms,IMF_DE_OR_014_var,IMF_DE_OR_014_means,IMF_DE_OR_014_std,IMF_DE_OR_014_kurtosis,...
    IMF_DE_OR_014_skewness,IMF_DE_OR_014_peaks, IMF_DE_OR_014_crestFactor, IMF_DE_OR_014_entropy);
IMF_FE_OR_014_emd_V=horzcat(IMF_FE_OR_014_rms,IMF_FE_OR_014_var,IMF_FE_OR_014_means,IMF_FE_OR_014_std,IMF_FE_OR_014_kurtosis,...
    IMF_FE_OR_014_skewness,IMF_FE_OR_014_peaks, IMF_FE_OR_014_crestFactor, IMF_FE_OR_014_entropy,Label6);

IMF_DE_OR_014_emd_V = cell2mat(IMF_DE_OR_014_emd_V);
IMF_FE_OR_014_emd_V = cell2mat(IMF_FE_OR_014_emd_V);

IMF_6 = [IMF_DE_OR_014_emd_V, IMF_FE_OR_014_emd_V];

Label7=7*ones(L,1);
Label7 = num2cell(Label7);
IMF_DE_OR_021_emd_V=horzcat(IMF_DE_OR_021_rms,IMF_DE_OR_021_var,IMF_DE_OR_021_means,IMF_DE_OR_021_std,IMF_DE_OR_021_kurtosis,IMF_DE_OR_021_skewness,IMF_DE_OR_021_peaks, IMF_DE_OR_021_crestFactor, IMF_DE_OR_021_entropy);
IMF_FE_OR_021_emd_V=horzcat(IMF_FE_OR_021_rms,IMF_FE_OR_021_var,IMF_FE_OR_021_means,IMF_FE_OR_021_std,IMF_FE_OR_021_kurtosis,IMF_FE_OR_021_skewness,IMF_FE_OR_021_peaks, IMF_FE_OR_021_crestFactor, IMF_FE_OR_021_entropy,Label7);

IMF_DE_OR_021_emd_V = cell2mat(IMF_DE_OR_021_emd_V);
IMF_FE_OR_021_emd_V = cell2mat(IMF_FE_OR_021_emd_V);

IMF_7 = [IMF_DE_OR_021_emd_V, IMF_FE_OR_021_emd_V];

Label8=8*ones(L,1);
Label8 = num2cell(Label8);

IMF_DE_BF_007_emd_V=horzcat(IMF_DE_BF_007_rms,IMF_DE_BF_007_var,IMF_DE_BF_007_means,IMF_DE_BF_007_std,IMF_DE_BF_007_kurtosis,...
    IMF_DE_BF_007_skewness,IMF_DE_BF_007_peaks, IMF_DE_BF_007_crestFactor, IMF_DE_BF_007_entropy);
IMF_FE_BF_007_emd_V=horzcat(IMF_FE_BF_007_rms,IMF_FE_BF_007_var,IMF_FE_BF_007_means,IMF_FE_BF_007_std,IMF_FE_BF_007_kurtosis,...
    IMF_FE_BF_007_skewness,IMF_FE_BF_007_peaks, IMF_FE_BF_007_crestFactor, IMF_FE_BF_007_entropy,Label8);

IMF_DE_BF_007_emd_V = cell2mat(IMF_DE_BF_007_emd_V);
IMF_FE_BF_007_emd_V = cell2mat(IMF_FE_BF_007_emd_V);

IMF_8 = [IMF_DE_BF_007_emd_V, IMF_FE_BF_007_emd_V];

Label9=9*ones(L,1);
Label9 = num2cell(Label9);

IMF_DE_BF_014_emd_V=horzcat(IMF_DE_BF_014_rms,IMF_DE_BF_014_var,IMF_DE_BF_014_means,IMF_DE_BF_014_std,IMF_DE_BF_014_kurtosis,...
    IMF_DE_BF_014_skewness,IMF_DE_BF_014_peaks, IMF_DE_BF_014_crestFactor, IMF_DE_BF_014_entropy);
IMF_FE_BF_014_emd_V=horzcat(IMF_FE_BF_014_rms,IMF_FE_BF_014_var,IMF_FE_BF_014_means,IMF_FE_BF_014_std,IMF_FE_BF_014_kurtosis,...
    IMF_FE_BF_014_skewness,IMF_FE_BF_014_peaks, IMF_FE_BF_014_crestFactor, IMF_FE_BF_014_entropy,Label9);

IMF_DE_BF_014_emd_V = cell2mat(IMF_DE_BF_014_emd_V);
IMF_FE_BF_014_emd_V = cell2mat(IMF_FE_BF_014_emd_V);

IMF_9 = [IMF_DE_BF_014_emd_V, IMF_FE_BF_014_emd_V];

Label10=10*ones(L,1);
Label10 = num2cell(Label10);

IMF_DE_BF_021_emd_V=horzcat(IMF_DE_BF_021_rms,IMF_DE_BF_021_var,IMF_DE_BF_021_means,IMF_DE_BF_021_std,IMF_DE_BF_021_kurtosis,...
    IMF_DE_BF_021_skewness,IMF_DE_BF_021_peaks, IMF_DE_BF_021_crestFactor, IMF_DE_BF_021_entropy);
IMF_FE_BF_021_emd_V=horzcat(IMF_FE_BF_021_rms,IMF_FE_BF_021_var,IMF_FE_BF_021_means,IMF_FE_BF_021_std,IMF_FE_BF_021_kurtosis,...
    IMF_FE_BF_021_skewness,IMF_FE_BF_021_peaks, IMF_FE_BF_021_crestFactor, IMF_FE_BF_021_entropy,Label10);

IMF_DE_BF_021_emd_V = cell2mat(IMF_DE_BF_021_emd_V);
IMF_FE_BF_021_emd_V = cell2mat(IMF_FE_BF_021_emd_V);

IMF_10 = [IMF_DE_BF_021_emd_V, IMF_FE_BF_021_emd_V];

Array_Feat = vertcat(IMF_1,IMF_2,IMF_3,IMF_4,IMF_5,IMF_6,IMF_7,IMF_8,IMF_9,IMF_10);
Table_Feat = array2table(Array_Feat); %, 'VariableNames', {'RMS_DE','Variance_DE','Mean_DE','STD_DE','Kurtosis_DE','Skewness_DE','Peak_DE','CrestFactor_DE','Entropy_DE',
   % 'RMS_FE','Variance_FE','Mean_FE','STD_FE','Kurtosis_FE','Skewness_FE','Peak_FE','CrestFactor_FE','Entropy_FE','Label'});

csvwrite('EMD_10.csv',Array_Feat);