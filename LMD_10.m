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
    PF_DE{i,1} = funLMD(E);
    F = X097_FE_time(k:k+floor(data_cycle)-1);
    PF_FE{i,1} = funLMD(F);
    k=k+floor(data_cycle);
end     

load('IR007_0.mat');
k=1;
for i=1:L
    E=X105_DE_time(k:k+floor(data_cycle)-1);
    PF_DE_IR_007{i,1} = funLMD(E);
    F = X105_FE_time(k:k+floor(data_cycle)-1);
    PF_FE_IR_007{i,1} = funLMD(F);
    k=k+floor(data_cycle);
end     

load('IR014_0.mat');
k=1;
for i=1:L
    E=X169_DE_time(k:k+floor(data_cycle)-1);
    PF_DE_IR_014{i,1} = funLMD(E);
    F = X169_FE_time(k:k+floor(data_cycle)-1);
    PF_FE_IR_014{i,1} = funLMD(F);
    k=k+floor(data_cycle);
end     

load('IR021_0.mat');
k=1;
for i=1:L
    E=X209_DE_time(k:k+floor(data_cycle)-1);
    PF_DE_IR_021{i,1} = funLMD(E);
    F = X209_FE_time(k:k+floor(data_cycle)-1);
    PF_FE_IR_021{i,1} = funLMD(F);
    k=k+floor(data_cycle);
end     

load('OR007@6_0.mat');
k=1;
for i=1:L
    E=X130_DE_time(k:k+floor(data_cycle)-1);
    PF_DE_OR_007{i,1} = funLMD(E);
    F = X130_FE_time(k:k+floor(data_cycle)-1);
    PF_FE_OR_007{i,1} = funLMD(F);
    k=k+floor(data_cycle);
end  

load('OR014@6_0.mat');
k=1;
for i=1:L
    E=X197_DE_time(k:k+floor(data_cycle)-1);
    PF_DE_OR_014{i,1} = funLMD(E);
    F = X197_FE_time(k:k+floor(data_cycle)-1);
    PF_FE_OR_014{i,1} = funLMD(F);
    k=k+floor(data_cycle);
end

load('OR021@6_0.mat');
k=1;
for i=1:L
    E=X234_DE_time(k:k+floor(data_cycle)-1);
    PF_DE_OR_021{i,1} = funLMD(E);
    F = X234_FE_time(k:k+floor(data_cycle)-1);
    PF_FE_OR_021{i,1} = funLMD(F);
    k=k+floor(data_cycle);
end

load('B007_0.mat');
k=1;
for i=1:L
    E=X118_DE_time(k:k+floor(data_cycle)-1);
    PF_DE_BF_007{i,1} = funLMD(E);
    F = X118_FE_time(k:k+floor(data_cycle)-1);
    PF_FE_BF_007{i,1} = funLMD(F);
    k=k+floor(data_cycle);
end

load('B014_0.mat');
k=1;
for i=1:L
    E=X185_DE_time(k:k+floor(data_cycle)-1);
    PF_DE_BF_014{i,1} = funLMD(E);
    F = X185_FE_time(k:k+floor(data_cycle)-1);
    PF_FE_BF_014{i,1} = funLMD(F);
    k=k+floor(data_cycle);
end

load('B021_0.mat');
k=1;
for i=1:L
    E=X222_DE_time(k:k+floor(data_cycle)-1);
    PF_DE_BF_021{i,1} = funLMD(E);
    F = X222_FE_time(k:k+floor(data_cycle)-1);
    PF_FE_BF_021{i,1} = funLMD(F);
    k=k+floor(data_cycle);
end
 

for i=1:L
    PF_DE_rms{i,1}=rms(PF_DE{i,1}(:,1:5));
    PF_DE_var{i,1}=var(PF_DE{i,1}(:,1:5));
    PF_DE_means{i,1}=mean(PF_DE{i,1}(:,1:5));
    PF_DE_std{i,1}=std(PF_DE{i,1}(:,1:5));
    PF_DE_kurtosis{i,1}=kurtosis(PF_DE{i,1}(:,1:5));
    PF_DE_skewness{i,1}=skewness(PF_DE{i,1}(:,1:5));
    PF_DE_peaks{i,1}= max(PF_DE{i,1}(:,1:5));
    PF_DE_crestFactor{i,1}= peak2rms(PF_DE{i,1}(:,1:5));
    %PF_DE_snr{i,1}= snr(PF_DE{i,1}(:,1:5));
    PF_DE_entropy{i,1}= EnergyFun(PF_DE{i,1}(:,1:5));
    
    PF_FE_rms{i,1}=rms(PF_FE{i,1}(:,1:5));
    PF_FE_var{i,1}=var(PF_FE{i,1}(:,1:5));
    PF_FE_means{i,1}=mean(PF_FE{i,1}(:,1:5));
    PF_FE_std{i,1}=std(PF_FE{i,1}(:,1:5));
    PF_FE_kurtosis{i,1}=kurtosis(PF_FE{i,1}(:,1:5));
    PF_FE_skewness{i,1}=skewness(PF_FE{i,1}(:,1:5));
    PF_FE_peaks{i,1}= max(PF_FE{i,1}(:,1:5));
    PF_FE_crestFactor{i,1}= peak2rms(PF_FE{i,1}(:,1:5));
    %PF_FE_snr{i,1}= snr(PF_FE{i,1}(:,1:5));
    PF_FE_entropy{i,1}= EnergyFun(PF_FE{i,1}(:,1:5));
    
    PF_DE_IR_007_rms{i,1}=rms(PF_DE_IR_007{i,1}(:,1:5));
    PF_DE_IR_007_var{i,1}=var(PF_DE_IR_007{i,1}(:,1:5));
    PF_DE_IR_007_means{i,1}=mean(PF_DE_IR_007{i,1}(:,1:5));
    PF_DE_IR_007_std{i,1}=std(PF_DE_IR_007{i,1}(:,1:5));
    PF_DE_IR_007_kurtosis{i,1}=kurtosis(PF_DE_IR_007{i,1}(:,1:5));
    PF_DE_IR_007_skewness{i,1}=skewness(PF_DE_IR_007{i,1}(:,1:5));
    PF_DE_IR_007_peaks{i,1}= max(PF_DE_IR_007{i,1}(:,1:5));
    PF_DE_IR_007_crestFactor{i,1}= peak2rms(PF_DE_IR_007{i,1}(:,1:5));
    %PF_DE_IR_007_snr{i,1}= snr(PF_DE_IR_007{i,1}(:,1:5));
    PF_DE_IR_007_entropy{i,1}= EnergyFun(PF_DE_IR_007{i,1}(:,1:5));
    
    PF_FE_IR_007_rms{i,1}=rms(PF_FE_IR_007{i,1}(:,1:5));
    PF_FE_IR_007_var{i,1}=var(PF_FE_IR_007{i,1}(:,1:5));
    PF_FE_IR_007_means{i,1}=mean(PF_FE_IR_007{i,1}(:,1:5));
    PF_FE_IR_007_std{i,1}=std(PF_FE_IR_007{i,1}(:,1:5));
    PF_FE_IR_007_kurtosis{i,1}=kurtosis(PF_FE_IR_007{i,1}(:,1:5));
    PF_FE_IR_007_skewness{i,1}=skewness(PF_FE_IR_007{i,1}(:,1:5));
    PF_FE_IR_007_peaks{i,1}= max(PF_FE_IR_007{i,1}(:,1:5));
    PF_FE_IR_007_crestFactor{i,1}= peak2rms(PF_FE_IR_007{i,1}(:,1:5));
    %PF_FE_IR_007_snr{i,1}= snr(PF_FE_IR_007{i,1}(:,1:5));
    PF_FE_IR_007_entropy{i,1}= EnergyFun(PF_FE_IR_007{i,1}(:,1:5));
    
    PF_DE_IR_014_rms{i,1}=rms(PF_DE_IR_014{i,1}(:,1:5));
    PF_DE_IR_014_var{i,1}=var(PF_DE_IR_014{i,1}(:,1:5));
    PF_DE_IR_014_means{i,1}=mean(PF_DE_IR_014{i,1}(:,1:5));
    PF_DE_IR_014_std{i,1}=std(PF_DE_IR_014{i,1}(:,1:5));
    PF_DE_IR_014_kurtosis{i,1}=kurtosis(PF_DE_IR_014{i,1}(:,1:5));
    PF_DE_IR_014_skewness{i,1}=skewness(PF_DE_IR_014{i,1}(:,1:5));
    PF_DE_IR_014_peaks{i,1}= max(PF_DE_IR_014{i,1}(:,1:5));
    PF_DE_IR_014_crestFactor{i,1}= peak2rms(PF_DE_IR_014{i,1}(:,1:5));
    %PF_DE_IR_014_snr{i,1}= snr(PF_DE_IR_014{i,1}(:,1:5));
    PF_DE_IR_014_entropy{i,1}= EnergyFun(PF_DE_IR_014{i,1}(:,1:5));
    
    PF_FE_IR_014_rms{i,1}=rms(PF_FE_IR_014{i,1}(:,1:5));
    PF_FE_IR_014_var{i,1}=var(PF_FE_IR_014{i,1}(:,1:5));
    PF_FE_IR_014_means{i,1}=mean(PF_FE_IR_014{i,1}(:,1:5));
    PF_FE_IR_014_std{i,1}=std(PF_FE_IR_014{i,1}(:,1:5));
    PF_FE_IR_014_kurtosis{i,1}=kurtosis(PF_FE_IR_014{i,1}(:,1:5));
    PF_FE_IR_014_skewness{i,1}=skewness(PF_FE_IR_014{i,1}(:,1:5));
    PF_FE_IR_014_peaks{i,1}= max(PF_FE_IR_014{i,1}(:,1:5));
    PF_FE_IR_014_crestFactor{i,1}= peak2rms(PF_FE_IR_014{i,1}(:,1:5));
    %PF_FE_IR_014_snr{i,1}= snr(PF_FE_IR_014{i,1}(:,1:5));
    PF_FE_IR_014_entropy{i,1}= EnergyFun(PF_FE_IR_014{i,1}(:,1:5));
    
    PF_DE_IR_021_rms{i,1}=rms(PF_DE_IR_021{i,1}(:,1:5));
    PF_DE_IR_021_var{i,1}=var(PF_DE_IR_021{i,1}(:,1:5));
    PF_DE_IR_021_means{i,1}=mean(PF_DE_IR_021{i,1}(:,1:5));
    PF_DE_IR_021_std{i,1}=std(PF_DE_IR_021{i,1}(:,1:5));
    PF_DE_IR_021_kurtosis{i,1}=kurtosis(PF_DE_IR_021{i,1}(:,1:5));
    PF_DE_IR_021_skewness{i,1}=skewness(PF_DE_IR_021{i,1}(:,1:5));
    PF_DE_IR_021_peaks{i,1}= max(PF_DE_IR_021{i,1}(:,1:5));
    PF_DE_IR_021_crestFactor{i,1}= peak2rms(PF_DE_IR_021{i,1}(:,1:5));
    %PF_DE_IR_021_snr{i,1}= snr(PF_DE_IR_021{i,1}(:,1:5));
    PF_DE_IR_021_entropy{i,1}= EnergyFun(PF_DE_IR_021{i,1}(:,1:5));
    
    PF_FE_IR_021_rms{i,1}=rms(PF_FE_IR_021{i,1}(:,1:5));
    PF_FE_IR_021_var{i,1}=var(PF_FE_IR_021{i,1}(:,1:5));
    PF_FE_IR_021_means{i,1}=mean(PF_FE_IR_021{i,1}(:,1:5));
    PF_FE_IR_021_std{i,1}=std(PF_FE_IR_021{i,1}(:,1:5));
    PF_FE_IR_021_kurtosis{i,1}=kurtosis(PF_FE_IR_021{i,1}(:,1:5));
    PF_FE_IR_021_skewness{i,1}=skewness(PF_FE_IR_021{i,1}(:,1:5));
    PF_FE_IR_021_peaks{i,1}= max(PF_FE_IR_021{i,1}(:,1:5));
    PF_FE_IR_021_crestFactor{i,1}= peak2rms(PF_FE_IR_021{i,1}(:,1:5));
    %PF_FE_IR_021_snr{i,1}= snr(PF_FE_IR_021{i,1}(:,1:5));
    PF_FE_IR_021_entropy{i,1}= EnergyFun(PF_FE_IR_021{i,1}(:,1:5));
    
    PF_DE_OR_007_rms{i,1}=rms(PF_DE_OR_007{i,1}(:,1:5));
    PF_DE_OR_007_var{i,1}=var(PF_DE_OR_007{i,1}(:,1:5));
    PF_DE_OR_007_means{i,1}=mean(PF_DE_OR_007{i,1}(:,1:5));
    PF_DE_OR_007_std{i,1}=std(PF_DE_OR_007{i,1}(:,1:5));
    PF_DE_OR_007_kurtosis{i,1}=kurtosis(PF_DE_OR_007{i,1}(:,1:5));
    PF_DE_OR_007_skewness{i,1}=skewness(PF_DE_OR_007{i,1}(:,1:5));
    PF_DE_OR_007_peaks{i,1}= max(PF_DE_OR_007{i,1}(:,1:5));
    PF_DE_OR_007_crestFactor{i,1}= peak2rms(PF_DE_OR_007{i,1}(:,1:5));
    %PF_DE_OR_007_snr{i,1}= snr(PF_DE_OR_007{i,1}(:,1:5));
    PF_DE_OR_007_entropy{i,1}= EnergyFun(PF_DE_OR_007{i,1}(:,1:5));
    
    PF_FE_OR_007_rms{i,1}=rms(PF_FE_OR_007{i,1}(:,1:5));
    PF_FE_OR_007_var{i,1}=var(PF_FE_OR_007{i,1}(:,1:5));
    PF_FE_OR_007_means{i,1}=mean(PF_FE_OR_007{i,1}(:,1:5));
    PF_FE_OR_007_std{i,1}=std(PF_FE_OR_007{i,1}(:,1:5));
    PF_FE_OR_007_kurtosis{i,1}=kurtosis(PF_FE_OR_007{i,1}(:,1:5));
    PF_FE_OR_007_skewness{i,1}=skewness(PF_FE_OR_007{i,1}(:,1:5));
    PF_FE_OR_007_peaks{i,1}= max(PF_FE_OR_007{i,1}(:,1:5));
    PF_FE_OR_007_crestFactor{i,1}= peak2rms(PF_FE_OR_007{i,1}(:,1:5));
    %PF_FE_OR_007_snr{i,1}= snr(PF_FE_OR_007{i,1}(:,1:5));
    PF_FE_OR_007_entropy{i,1}= EnergyFun(PF_FE_OR_007{i,1}(:,1:5));
    
    PF_DE_OR_014_rms{i,1}=rms(PF_DE_OR_014{i,1}(:,1:5));
    PF_DE_OR_014_var{i,1}=var(PF_DE_OR_014{i,1}(:,1:5));
    PF_DE_OR_014_means{i,1}=mean(PF_DE_OR_014{i,1}(:,1:5));
    PF_DE_OR_014_std{i,1}=std(PF_DE_OR_014{i,1}(:,1:5));
    PF_DE_OR_014_kurtosis{i,1}=kurtosis(PF_DE_OR_014{i,1}(:,1:5));
    PF_DE_OR_014_skewness{i,1}=skewness(PF_DE_OR_014{i,1}(:,1:5));
    PF_DE_OR_014_peaks{i,1}= max(PF_DE_OR_014{i,1}(:,1:5));
    PF_DE_OR_014_crestFactor{i,1}= peak2rms(PF_DE_OR_014{i,1}(:,1:5));
    %PF_DE_OR_014_snr{i,1}= snr(PF_DE_OR_014{i,1}(:,1:5));
    PF_DE_OR_014_entropy{i,1}= EnergyFun(PF_DE_OR_014{i,1}(:,1:5));
    
    PF_FE_OR_014_rms{i,1}=rms(PF_FE_OR_014{i,1}(:,1:5));
    PF_FE_OR_014_var{i,1}=var(PF_FE_OR_014{i,1}(:,1:5));
    PF_FE_OR_014_means{i,1}=mean(PF_FE_OR_014{i,1}(:,1:5));
    PF_FE_OR_014_std{i,1}=std(PF_FE_OR_014{i,1}(:,1:5));
    PF_FE_OR_014_kurtosis{i,1}=kurtosis(PF_FE_OR_014{i,1}(:,1:5));
    PF_FE_OR_014_skewness{i,1}=skewness(PF_FE_OR_014{i,1}(:,1:5));
    PF_FE_OR_014_peaks{i,1}= max(PF_FE_OR_014{i,1}(:,1:5));
    PF_FE_OR_014_crestFactor{i,1}= peak2rms(PF_FE_OR_014{i,1}(:,1:5));
    %PF_FE_OR_014_snr{i,1}= snr(PF_FE_OR_014{i,1}(:,1:5));
    PF_FE_OR_014_entropy{i,1}= EnergyFun(PF_FE_OR_014{i,1}(:,1:5));
    
    PF_DE_OR_021_rms{i,1}=rms(PF_DE_OR_021{i,1}(:,1:5));
    PF_DE_OR_021_var{i,1}=var(PF_DE_OR_021{i,1}(:,1:5));
    PF_DE_OR_021_means{i,1}=mean(PF_DE_OR_021{i,1}(:,1:5));
    PF_DE_OR_021_std{i,1}=std(PF_DE_OR_021{i,1}(:,1:5));
    PF_DE_OR_021_kurtosis{i,1}=kurtosis(PF_DE_OR_021{i,1}(:,1:5));
    PF_DE_OR_021_skewness{i,1}=skewness(PF_DE_OR_021{i,1}(:,1:5));
    PF_DE_OR_021_peaks{i,1}= max(PF_DE_OR_021{i,1}(:,1:5));
    PF_DE_OR_021_crestFactor{i,1}= peak2rms(PF_DE_OR_021{i,1}(:,1:5));
    %PF_DE_OR_021_snr{i,1}= snr(PF_DE_OR_021{i,1}(:,1:5));
    PF_DE_OR_021_entropy{i,1}= EnergyFun(PF_DE_OR_021{i,1}(:,1:5));
    
    PF_FE_OR_021_rms{i,1}=rms(PF_FE_OR_021{i,1}(:,1:5));
    PF_FE_OR_021_var{i,1}=var(PF_FE_OR_021{i,1}(:,1:5));
    PF_FE_OR_021_means{i,1}=mean(PF_FE_OR_021{i,1}(:,1:5));
    PF_FE_OR_021_std{i,1}=std(PF_FE_OR_021{i,1}(:,1:5));
    PF_FE_OR_021_kurtosis{i,1}=kurtosis(PF_FE_OR_021{i,1}(:,1:5));
    PF_FE_OR_021_skewness{i,1}=skewness(PF_FE_OR_021{i,1}(:,1:5));
    PF_FE_OR_021_peaks{i,1}= max(PF_FE_OR_021{i,1}(:,1:5));
    PF_FE_OR_021_crestFactor{i,1}= peak2rms(PF_FE_OR_021{i,1}(:,1:5));
    %PF_FE_OR_021_snr{i,1}= snr(PF_FE_OR_021{i,1}(:,1:5));
    PF_FE_OR_021_entropy{i,1}= EnergyFun(PF_FE_OR_021{i,1}(:,1:5));
    
    PF_DE_BF_007_rms{i,1}=rms(PF_DE_BF_007{i,1}(:,1:5));
    PF_DE_BF_007_var{i,1}=var(PF_DE_BF_007{i,1}(:,1:5));
    PF_DE_BF_007_means{i,1}=mean(PF_DE_BF_007{i,1}(:,1:5));
    PF_DE_BF_007_std{i,1}=std(PF_DE_BF_007{i,1}(:,1:5));
    PF_DE_BF_007_kurtosis{i,1}=kurtosis(PF_DE_BF_007{i,1}(:,1:5));
    PF_DE_BF_007_skewness{i,1}=skewness(PF_DE_BF_007{i,1}(:,1:5));
    PF_DE_BF_007_peaks{i,1}= max(PF_DE_BF_007{i,1}(:,1:5));
    PF_DE_BF_007_crestFactor{i,1}= peak2rms(PF_DE_BF_007{i,1}(:,1:5));
    %PF_DE_BF_007_snr{i,1}= snr(PF_DE_BF_007{i,1}(:,1:5));
    PF_DE_BF_007_entropy{i,1}= EnergyFun(PF_DE_BF_007{i,1}(:,1:5));
    
    PF_FE_BF_007_rms{i,1}=rms(PF_FE_BF_007{i,1}(:,1:5));
    PF_FE_BF_007_var{i,1}=var(PF_FE_BF_007{i,1}(:,1:5));
    PF_FE_BF_007_means{i,1}=mean(PF_FE_BF_007{i,1}(:,1:5));
    PF_FE_BF_007_std{i,1}=std(PF_FE_BF_007{i,1}(:,1:5));
    PF_FE_BF_007_kurtosis{i,1}=kurtosis(PF_FE_BF_007{i,1}(:,1:5));
    PF_FE_BF_007_skewness{i,1}=skewness(PF_FE_BF_007{i,1}(:,1:5));
    PF_FE_BF_007_peaks{i,1}= max(PF_FE_BF_007{i,1}(:,1:5));
    PF_FE_BF_007_crestFactor{i,1}= peak2rms(PF_FE_BF_007{i,1}(:,1:5));
    %PF_FE_BF_007_snr{i,1}= snr(PF_FE_BF_007{i,1}(:,1:5));
    PF_FE_BF_007_entropy{i,1}= EnergyFun(PF_FE_BF_007{i,1}(:,1:5));
    
    PF_DE_BF_014_rms{i,1}=rms(PF_DE_BF_014{i,1}(:,1:5));
    PF_DE_BF_014_var{i,1}=var(PF_DE_BF_014{i,1}(:,1:5));
    PF_DE_BF_014_means{i,1}=mean(PF_DE_BF_014{i,1}(:,1:5));
    PF_DE_BF_014_std{i,1}=std(PF_DE_BF_014{i,1}(:,1:5));
    PF_DE_BF_014_kurtosis{i,1}=kurtosis(PF_DE_BF_014{i,1}(:,1:5));
    PF_DE_BF_014_skewness{i,1}=skewness(PF_DE_BF_014{i,1}(:,1:5));
    PF_DE_BF_014_peaks{i,1}= max(PF_DE_BF_014{i,1}(:,1:5));
    PF_DE_BF_014_crestFactor{i,1}= peak2rms(PF_DE_BF_014{i,1}(:,1:5));
    %PF_DE_BF_014_snr{i,1}= snr(PF_DE_BF_014{i,1}(:,1:5));
    PF_DE_BF_014_entropy{i,1}= EnergyFun(PF_DE_BF_014{i,1}(:,1:5));
    
    PF_FE_BF_014_rms{i,1}=rms(PF_FE_BF_014{i,1}(:,1:5));
    PF_FE_BF_014_var{i,1}=var(PF_FE_BF_014{i,1}(:,1:5));
    PF_FE_BF_014_means{i,1}=mean(PF_FE_BF_014{i,1}(:,1:5));
    PF_FE_BF_014_std{i,1}=std(PF_FE_BF_014{i,1}(:,1:5));
    PF_FE_BF_014_kurtosis{i,1}=kurtosis(PF_FE_BF_014{i,1}(:,1:5));
    PF_FE_BF_014_skewness{i,1}=skewness(PF_FE_BF_014{i,1}(:,1:5));
    PF_FE_BF_014_peaks{i,1}= max(PF_FE_BF_014{i,1}(:,1:5));
    PF_FE_BF_014_crestFactor{i,1}= peak2rms(PF_FE_BF_014{i,1}(:,1:5));
    %PF_FE_BF_014_snr{i,1}= snr(PF_FE_BF_014{i,1}(:,1:5));
    PF_FE_BF_014_entropy{i,1}= EnergyFun(PF_FE_BF_014{i,1}(:,1:5));
    
    PF_DE_BF_021_rms{i,1}=rms(PF_DE_BF_021{i,1}(:,1:5));
    PF_DE_BF_021_var{i,1}=var(PF_DE_BF_021{i,1}(:,1:5));
    PF_DE_BF_021_means{i,1}=mean(PF_DE_BF_021{i,1}(:,1:5));
    PF_DE_BF_021_std{i,1}=std(PF_DE_BF_021{i,1}(:,1:5));
    PF_DE_BF_021_kurtosis{i,1}=kurtosis(PF_DE_BF_021{i,1}(:,1:5));
    PF_DE_BF_021_skewness{i,1}=skewness(PF_DE_BF_021{i,1}(:,1:5));
    PF_DE_BF_021_peaks{i,1}= max(PF_DE_BF_021{i,1}(:,1:5));
    PF_DE_BF_021_crestFactor{i,1}= peak2rms(PF_DE_BF_021{i,1}(:,1:5));
    %PF_DE_BF_021_snr{i,1}= snr(PF_DE_BF_021{i,1}(:,1:5));
    PF_DE_BF_021_entropy{i,1}= EnergyFun(PF_DE_BF_021{i,1}(:,1:5));
    
    PF_FE_BF_021_rms{i,1}=rms(PF_FE_BF_021{i,1}(:,1:5));
    PF_FE_BF_021_var{i,1}=var(PF_FE_BF_021{i,1}(:,1:5));
    PF_FE_BF_021_means{i,1}=mean(PF_FE_BF_021{i,1}(:,1:5));
    PF_FE_BF_021_std{i,1}=std(PF_FE_BF_021{i,1}(:,1:5));
    PF_FE_BF_021_kurtosis{i,1}=kurtosis(PF_FE_BF_021{i,1}(:,1:5));
    PF_FE_BF_021_skewness{i,1}=skewness(PF_FE_BF_021{i,1}(:,1:5));
    PF_FE_BF_021_peaks{i,1}= max(PF_FE_BF_021{i,1}(:,1:5));
    PF_FE_BF_021_crestFactor{i,1}= peak2rms(PF_FE_BF_021{i,1}(:,1:5));
    %PF_FE_BF_021_snr{i,1}= snr(PF_FE_BF_021{i,1}(:,1:5));
    PF_FE_BF_021_entropy{i,1}= EnergyFun(PF_FE_BF_021{i,1}(:,1:5));

end

Label1=ones(L,1);
Label1 = num2cell(Label1);

PF_DE_LMD_V=horzcat(PF_DE_rms,PF_DE_var,PF_DE_means,PF_DE_std,PF_DE_kurtosis,...
    PF_DE_skewness,PF_DE_peaks, PF_DE_crestFactor, PF_DE_entropy);
PF_FE_LMD_V=horzcat(PF_FE_rms,PF_FE_var,PF_FE_means,PF_FE_std,PF_FE_kurtosis,...
    PF_FE_skewness,PF_FE_peaks, PF_FE_crestFactor, PF_FE_entropy,Label1);

PF_DE_LMD_V = cell2mat(PF_DE_LMD_V);
PF_FE_LMD_V = cell2mat(PF_FE_LMD_V);

PF_1 = [PF_DE_LMD_V, PF_FE_LMD_V];

Label2=2*ones(L,1);
Label2 = num2cell(Label2);

PF_DE_IR_007_LMD_V=horzcat(PF_DE_IR_007_rms,PF_DE_IR_007_var,PF_DE_IR_007_means,PF_DE_IR_007_std,PF_DE_IR_007_kurtosis,...
    PF_DE_IR_007_skewness,PF_DE_IR_007_peaks, PF_DE_IR_007_crestFactor, PF_DE_IR_007_entropy);
PF_FE_IR_007_LMD_V=horzcat(PF_FE_IR_007_rms,PF_FE_IR_007_var,PF_FE_IR_007_means,PF_FE_IR_007_std,PF_FE_IR_007_kurtosis,...
    PF_FE_IR_007_skewness,PF_FE_IR_007_peaks, PF_FE_IR_007_crestFactor, PF_FE_IR_007_entropy,Label2);

PF_DE_IR_007_LMD_V = cell2mat(PF_DE_IR_007_LMD_V);
PF_FE_IR_007_LMD_V = cell2mat(PF_FE_IR_007_LMD_V);

PF_2 = [PF_DE_IR_007_LMD_V, PF_FE_IR_007_LMD_V];

Label3=3*ones(L,1);
Label3 = num2cell(Label3);

PF_DE_IR_014_LMD_V=horzcat(PF_DE_IR_014_rms,PF_DE_IR_014_var,PF_DE_IR_014_means,PF_DE_IR_014_std,PF_DE_IR_014_kurtosis,...
    PF_DE_IR_014_skewness,PF_DE_IR_014_peaks, PF_DE_IR_014_crestFactor, PF_DE_IR_014_entropy);
PF_FE_IR_014_LMD_V=horzcat(PF_FE_IR_014_rms,PF_FE_IR_014_var,PF_FE_IR_014_means,PF_FE_IR_014_std,PF_FE_IR_014_kurtosis,...
    PF_FE_IR_014_skewness,PF_FE_IR_014_peaks, PF_FE_IR_014_crestFactor, PF_FE_IR_014_entropy,Label3);

PF_DE_IR_014_LMD_V = cell2mat(PF_DE_IR_014_LMD_V);
PF_FE_IR_014_LMD_V = cell2mat(PF_FE_IR_014_LMD_V);

PF_3 = [PF_DE_IR_014_LMD_V, PF_FE_IR_014_LMD_V];

Label4=4*ones(L,1);
Label4 = num2cell(Label4);

PF_DE_IR_021_LMD_V=horzcat(PF_DE_IR_021_rms,PF_DE_IR_021_var,PF_DE_IR_021_means,PF_DE_IR_021_std,PF_DE_IR_021_kurtosis,...
    PF_DE_IR_021_skewness,PF_DE_IR_021_peaks, PF_DE_IR_021_crestFactor, PF_DE_IR_021_entropy);
PF_FE_IR_021_LMD_V=horzcat(PF_FE_IR_021_rms,PF_FE_IR_021_var,PF_FE_IR_021_means,PF_FE_IR_021_std,PF_FE_IR_021_kurtosis,...
    PF_FE_IR_021_skewness,PF_FE_IR_021_peaks, PF_FE_IR_021_crestFactor, PF_FE_IR_021_entropy,Label4);

PF_DE_IR_021_LMD_V = cell2mat(PF_DE_IR_021_LMD_V);
PF_FE_IR_021_LMD_V = cell2mat(PF_FE_IR_021_LMD_V);

PF_4 = [PF_DE_IR_021_LMD_V, PF_FE_IR_021_LMD_V];

Label5=5*ones(L,1);
Label5 = num2cell(Label5);
PF_DE_OR_007_LMD_V=horzcat(PF_DE_OR_007_rms,PF_DE_OR_007_var,PF_DE_OR_007_means,PF_DE_OR_007_std,PF_DE_OR_007_kurtosis,PF_DE_OR_007_skewness,PF_DE_OR_007_peaks, PF_DE_OR_007_crestFactor, PF_DE_OR_007_entropy);
PF_FE_OR_007_LMD_V=horzcat(PF_FE_OR_007_rms,PF_FE_OR_007_var,PF_FE_OR_007_means,PF_FE_OR_007_std,PF_FE_OR_007_kurtosis,PF_FE_OR_007_skewness,PF_FE_OR_007_peaks, PF_FE_OR_007_crestFactor, PF_FE_OR_007_entropy,Label5);

PF_DE_OR_007_LMD_V = cell2mat(PF_DE_OR_007_LMD_V);
PF_FE_OR_007_LMD_V = cell2mat(PF_FE_OR_007_LMD_V);

PF_5 = [PF_DE_OR_007_LMD_V, PF_FE_OR_007_LMD_V];

Label6=6*ones(L,1);
Label6 = num2cell(Label6);

PF_DE_OR_014_LMD_V=horzcat(PF_DE_OR_014_rms,PF_DE_OR_014_var,PF_DE_OR_014_means,PF_DE_OR_014_std,PF_DE_OR_014_kurtosis,...
    PF_DE_OR_014_skewness,PF_DE_OR_014_peaks, PF_DE_OR_014_crestFactor, PF_DE_OR_014_entropy);
PF_FE_OR_014_LMD_V=horzcat(PF_FE_OR_014_rms,PF_FE_OR_014_var,PF_FE_OR_014_means,PF_FE_OR_014_std,PF_FE_OR_014_kurtosis,...
    PF_FE_OR_014_skewness,PF_FE_OR_014_peaks, PF_FE_OR_014_crestFactor, PF_FE_OR_014_entropy,Label6);

PF_DE_OR_014_LMD_V = cell2mat(PF_DE_OR_014_LMD_V);
PF_FE_OR_014_LMD_V = cell2mat(PF_FE_OR_014_LMD_V);

PF_6 = [PF_DE_OR_014_LMD_V, PF_FE_OR_014_LMD_V];

Label7=7*ones(L,1);
Label7 = num2cell(Label7);
PF_DE_OR_021_LMD_V=horzcat(PF_DE_OR_021_rms,PF_DE_OR_021_var,PF_DE_OR_021_means,PF_DE_OR_021_std,PF_DE_OR_021_kurtosis,PF_DE_OR_021_skewness,PF_DE_OR_021_peaks, PF_DE_OR_021_crestFactor, PF_DE_OR_021_entropy);
PF_FE_OR_021_LMD_V=horzcat(PF_FE_OR_021_rms,PF_FE_OR_021_var,PF_FE_OR_021_means,PF_FE_OR_021_std,PF_FE_OR_021_kurtosis,PF_FE_OR_021_skewness,PF_FE_OR_021_peaks, PF_FE_OR_021_crestFactor, PF_FE_OR_021_entropy,Label7);

PF_DE_OR_021_LMD_V = cell2mat(PF_DE_OR_021_LMD_V);
PF_FE_OR_021_LMD_V = cell2mat(PF_FE_OR_021_LMD_V);

PF_7 = [PF_DE_OR_021_LMD_V, PF_FE_OR_021_LMD_V];

Label8=8*ones(L,1);
Label8 = num2cell(Label8);

PF_DE_BF_007_LMD_V=horzcat(PF_DE_BF_007_rms,PF_DE_BF_007_var,PF_DE_BF_007_means,PF_DE_BF_007_std,PF_DE_BF_007_kurtosis,...
    PF_DE_BF_007_skewness,PF_DE_BF_007_peaks, PF_DE_BF_007_crestFactor, PF_DE_BF_007_entropy);
PF_FE_BF_007_LMD_V=horzcat(PF_FE_BF_007_rms,PF_FE_BF_007_var,PF_FE_BF_007_means,PF_FE_BF_007_std,PF_FE_BF_007_kurtosis,...
    PF_FE_BF_007_skewness,PF_FE_BF_007_peaks, PF_FE_BF_007_crestFactor, PF_FE_BF_007_entropy,Label8);

PF_DE_BF_007_LMD_V = cell2mat(PF_DE_BF_007_LMD_V);
PF_FE_BF_007_LMD_V = cell2mat(PF_FE_BF_007_LMD_V);

PF_8 = [PF_DE_BF_007_LMD_V, PF_FE_BF_007_LMD_V];

Label9=9*ones(L,1);
Label9 = num2cell(Label9);

PF_DE_BF_014_LMD_V=horzcat(PF_DE_BF_014_rms,PF_DE_BF_014_var,PF_DE_BF_014_means,PF_DE_BF_014_std,PF_DE_BF_014_kurtosis,...
    PF_DE_BF_014_skewness,PF_DE_BF_014_peaks, PF_DE_BF_014_crestFactor, PF_DE_BF_014_entropy);
PF_FE_BF_014_LMD_V=horzcat(PF_FE_BF_014_rms,PF_FE_BF_014_var,PF_FE_BF_014_means,PF_FE_BF_014_std,PF_FE_BF_014_kurtosis,...
    PF_FE_BF_014_skewness,PF_FE_BF_014_peaks, PF_FE_BF_014_crestFactor, PF_FE_BF_014_entropy,Label9);

PF_DE_BF_014_LMD_V = cell2mat(PF_DE_BF_014_LMD_V);
PF_FE_BF_014_LMD_V = cell2mat(PF_FE_BF_014_LMD_V);

PF_9 = [PF_DE_BF_014_LMD_V, PF_FE_BF_014_LMD_V];

Label10=10*ones(L,1);
Label10 = num2cell(Label10);

PF_DE_BF_021_LMD_V=horzcat(PF_DE_BF_021_rms,PF_DE_BF_021_var,PF_DE_BF_021_means,PF_DE_BF_021_std,PF_DE_BF_021_kurtosis,...
    PF_DE_BF_021_skewness,PF_DE_BF_021_peaks, PF_DE_BF_021_crestFactor, PF_DE_BF_021_entropy);
PF_FE_BF_021_LMD_V=horzcat(PF_FE_BF_021_rms,PF_FE_BF_021_var,PF_FE_BF_021_means,PF_FE_BF_021_std,PF_FE_BF_021_kurtosis,...
    PF_FE_BF_021_skewness,PF_FE_BF_021_peaks, PF_FE_BF_021_crestFactor, PF_FE_BF_021_entropy,Label10);

PF_DE_BF_021_LMD_V = cell2mat(PF_DE_BF_021_LMD_V);
PF_FE_BF_021_LMD_V = cell2mat(PF_FE_BF_021_LMD_V);

PF_10 = [PF_DE_BF_021_LMD_V, PF_FE_BF_021_LMD_V];

Array_Feat = vertcat(PF_1,PF_2,PF_3,PF_4,PF_5,PF_6,PF_7,PF_8,PF_9,PF_10);
Table_Feat = array2table(Array_Feat); %, 'VariableNames', {'RMS_DE','Variance_DE','Mean_DE','STD_DE','Kurtosis_DE','Skewness_DE','Peak_DE','CrestFactor_DE','Entropy_DE',
   % 'RMS_FE','Variance_FE','Mean_FE','STD_FE','Kurtosis_FE','Skewness_FE','Peak_FE','CrestFactor_FE','Entropy_FE','Label'});

Array_Feat = vertcat(1:91, Array_Feat);
csvwrite('LMD_10.csv',Array_Feat);