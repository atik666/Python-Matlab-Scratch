clear;clc;
tic

Fs= 12000; %Sampling frequency
rpm=1797;        %rotor speed in rpm
speed=rpm/60;      %speed in Hz
data_cycle=3*Fs/speed;         %number of data/cycle
 
%% Normal Data
load('base.mat');
B=X097_DE_time;
total_sample=B';   %total sample data
sample_duration=length(total_sample)/Fs;  %sampling duration
L=length(total_sample)/floor(data_cycle);  %number of total datasets

k=1;
for i=1:floor(L)
    E=total_sample(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [psd{i,1}]=pwelch(E);   %psd of the signal
    base_Energy{i,1} = sum(abs(E).^2);
%[~,PSD{i,1}]=AV_PSD(E); %Power spectral density of the signal
end
for i=1:length(psd)
    psd_rms_data(i,1)=rms(psd{i,1});
    psd_var_data(i,1)=var(psd{i,1});
    psd_means_data(i,1)=mean(psd{i,1});
    psd_std_data(i,1)=std(psd{i,1});
    psd_kurtosis_data(i,1)=kurtosis(psd{i,1});
    psd_skewness_data(i,1)=skewness(psd{i,1});
    psd_peaks_data(i,1)= max(psd{i,1});
    psd_crestFactor_data(i,1)= max(psd{i,1})/rms(psd{i,1});
    psd_snr_data(i,1)= snr(psd{i,1});
    psd_entropy_data(i,1)=entropy(psd{i,1});
end
base_Energy=cell2mat(base_Energy);
Label1=ones(floor(L),1);
base_psd_V=horzcat(psd_rms_data,psd_var_data,psd_means_data,psd_std_data,psd_kurtosis_data,psd_skewness_data,psd_peaks_data, psd_crestFactor_data, psd_snr_data, psd_entropy_data,base_Energy,Label1);
base_psd_T=array2table(base_psd_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Peak','CrestFactor','SNR','Entropy','Energy','Label'});

%% 0.007" Inner Race Fault
load('IR007_0.mat');
IR007=X105_DE_time;
total_sample_IR007=IR007'; 
 
L_IR007=length(total_sample_IR007)/floor(data_cycle);
k=1;
for i=1:floor(L_IR007)
    E=total_sample_IR007(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [IR007_psd{i,1}]=pwelch(E);   %psd of the signal
    IR007_Energy{i,1} = sum(abs(E).^2);
end
for i=1:length(IR007_psd)
    IR007_psd_rms_data(i,1)=rms(IR007_psd{i,1});
    IR007_psd_var_data(i,1)=var(IR007_psd{i,1});
    IR007_psd_means_data(i,1)=mean(IR007_psd{i,1});
    IR007_psd_std_data(i,1)=std(IR007_psd{i,1});
    IR007_psd_kurtosis_data(i,1)=kurtosis(IR007_psd{i,1});
    IR007_psd_skewness_data(i,1)=skewness(IR007_psd{i,1});
    IR007_psd_peaks_data(i,1)= max(psd{i,1});
    IR007_psd_crestFactor_data(i,1)= max(IR007_psd{i,1})/rms(IR007_psd{i,1});
    IR007_psd_snr_data(i,1)= snr(IR007_psd{i,1});
    IR007_psd_entropy_data(i,1)=entropy(IR007_psd{i,1});
 
end
IR007_Energy=cell2mat(IR007_Energy);
Label2=2*ones(floor(L_IR007),1);
IR007_psd_V=horzcat(IR007_psd_rms_data,IR007_psd_var_data,IR007_psd_means_data,IR007_psd_std_data,IR007_psd_kurtosis_data,IR007_psd_skewness_data, IR007_psd_peaks_data, IR007_psd_crestFactor_data, IR007_psd_snr_data, IR007_psd_entropy_data, IR007_Energy,Label2);
IR007_psd_T=array2table(IR007_psd_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Peak','CrestFactor','SNR','Entropy','Energy','Label'});
 
%% 0.014" Inner Race Fault
load('IR014_0.mat');
IR014= X169_DE_time;
total_sample_IR014=IR014'; 
 
L_IR014=length(total_sample_IR014)/floor(data_cycle);
k=1;
for i=1:floor(L_IR014)
    E=total_sample_IR014(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [IR014_psd{i,1}]=pwelch(E);   %psd of the signal
    IR014_Energy{i,1} = sum(abs(E).^2);
end
for i=1:length(IR014_psd)
    IR014_psd_rms_data(i,1)=rms(IR014_psd{i,1});
    IR014_psd_var_data(i,1)=var(IR014_psd{i,1});
    IR014_psd_means_data(i,1)=mean(IR014_psd{i,1});
    IR014_psd_std_data(i,1)=std(IR014_psd{i,1});
    IR014_psd_kurtosis_data(i,1)=kurtosis(IR014_psd{i,1});
    IR014_psd_skewness_data(i,1)=skewness(IR014_psd{i,1});
    IR014_psd_peaks_data(i,1)= max(psd{i,1});
    IR014_psd_crestFactor_data(i,1)= max(IR014_psd{i,1})/rms(IR014_psd{i,1});
    IR014_psd_snr_data(i,1)= snr(IR014_psd{i,1});
    IR014_psd_entropy_data(i,1)=entropy(IR014_psd{i,1});
end
IR014_Energy=cell2mat(IR014_Energy);
Label3=3*ones(floor(L_IR014),1);
IR014_psd_V=horzcat(IR014_psd_rms_data,IR014_psd_var_data,IR014_psd_means_data,IR014_psd_std_data,IR014_psd_kurtosis_data,IR014_psd_skewness_data, IR014_psd_peaks_data, IR014_psd_crestFactor_data, IR014_psd_snr_data, IR014_psd_entropy_data, IR014_Energy,Label3);
IR014_psd_T=array2table(IR014_psd_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Peak','CrestFactor','SNR','Entropy','Energy','Label'});
 
%% 0.021" Inner Race Fault
load('IR021_0.mat');
IR021= X209_DE_time;
total_sample_IR021=IR021'; 
 
L_IR021=length(total_sample_IR021)/floor(data_cycle);
k=1;
for i=1:floor(L_IR021)
    E=total_sample_IR021(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [IR021_psd{i,1}]=pwelch(E);   %psd of the signal
    IR021_Energy{i,1} = sum(abs(E).^2);
end
for i=1:length(IR021_psd)
    IR021_psd_rms_data(i,1)=rms(IR021_psd{i,1});
    IR021_psd_var_data(i,1)=var(IR021_psd{i,1});
    IR021_psd_means_data(i,1)=mean(IR021_psd{i,1});
    IR021_psd_std_data(i,1)=std(IR021_psd{i,1});
    IR021_psd_kurtosis_data(i,1)=kurtosis(IR021_psd{i,1});
    IR021_psd_skewness_data(i,1)=skewness(IR021_psd{i,1});
    IR021_psd_peaks_data(i,1)= max(psd{i,1});
    IR021_psd_crestFactor_data(i,1)= max(IR021_psd{i,1})/rms(IR021_psd{i,1});
    IR021_psd_snr_data(i,1)= snr(IR021_psd{i,1});
    IR021_psd_entropy_data(i,1)=entropy(IR021_psd{i,1});
end
IR021_Energy=cell2mat(IR021_Energy);
Label4=4*ones(floor(L_IR021),1);
IR021_psd_V=horzcat(IR021_psd_rms_data,IR021_psd_var_data,IR021_psd_means_data,IR021_psd_std_data,IR021_psd_kurtosis_data,IR021_psd_skewness_data, IR021_psd_peaks_data, IR021_psd_crestFactor_data, IR021_psd_snr_data, IR021_psd_entropy_data, IR021_Energy,Label4);
IR021_psd_T=array2table(IR021_psd_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Peak','CrestFactor','SNR','Entropy','Energy','Label'});
 
%% 0.007" Outer race fault
load('OR007@6_0.mat');
OR007_6_0=X130_DE_time;
total_sample_OR007_6_0=OR007_6_0'; 
 
L_OR007_6_0=length(total_sample_OR007_6_0)/floor(data_cycle);
k=1;
for i=1:floor(L_OR007_6_0)
    E=total_sample_OR007_6_0(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [OR007_6_0_psd{i,1}]=pwelch(E);   %psd of the signal
    OR007_6_0_Energy{i,1} = sum(abs(E).^2);
end
for i=1:length(OR007_6_0_psd)
    OR007_6_0_psd_rms_data(i,1)=rms(OR007_6_0_psd{i,1});
    OR007_6_0_psd_var_data(i,1)=var(OR007_6_0_psd{i,1});
    OR007_6_0_psd_means_data(i,1)=mean(OR007_6_0_psd{i,1});
    OR007_6_0_psd_std_data(i,1)=std(OR007_6_0_psd{i,1});
    OR007_6_0_psd_kurtosis_data(i,1)=kurtosis(OR007_6_0_psd{i,1});
    OR007_6_0_psd_skewness_data(i,1)=skewness(OR007_6_0_psd{i,1});
    OR007_6_0_psd_peaks_data(i,1)= max(psd{i,1});
    OR007_6_0_psd_crestFactor_data(i,1)= max(OR007_6_0_psd{i,1})/rms(OR007_6_0_psd{i,1});
    OR007_6_0_psd_snr_data(i,1)= snr(OR007_6_0_psd{i,1});
    OR007_6_0_psd_entropy_data(i,1)=entropy(OR007_6_0_psd{i,1});
end
OR007_6_0_Energy=cell2mat(OR007_6_0_Energy);
Label5=5*ones(floor(L_OR007_6_0),1);
OR007_6_0_psd_V=horzcat(OR007_6_0_psd_rms_data,OR007_6_0_psd_var_data,OR007_6_0_psd_means_data,OR007_6_0_psd_std_data,OR007_6_0_psd_kurtosis_data,OR007_6_0_psd_skewness_data, OR007_6_0_psd_peaks_data, OR007_6_0_psd_crestFactor_data, OR007_6_0_psd_snr_data, OR007_6_0_psd_entropy_data, OR007_6_0_Energy,Label5);
OR007_6_0_psd_T=array2table(OR007_6_0_psd_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Peak','CrestFactor','SNR','Entropy','Energy','Label'});
 
%% 0.014" Outer race fault
load('OR014@6_0.mat');
OR014_6_0=X197_DE_time;
total_sample_OR014_6_0=OR014_6_0'; 
 
L_OR014_6_0=length(total_sample_OR014_6_0)/floor(data_cycle);
k=1;
for i=1:floor(L_OR014_6_0)
    E=total_sample_OR014_6_0(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [OR014_6_0_psd{i,1}]=pwelch(E);   %psd of the signal
    OR014_6_0_Energy{i,1} = sum(abs(E).^2);
end
for i=1:length(OR014_6_0_psd)
    OR014_6_0_psd_rms_data(i,1)=rms(OR014_6_0_psd{i,1});
    OR014_6_0_psd_var_data(i,1)=var(OR014_6_0_psd{i,1});
    OR014_6_0_psd_means_data(i,1)=mean(OR014_6_0_psd{i,1});
    OR014_6_0_psd_std_data(i,1)=std(OR014_6_0_psd{i,1});
    OR014_6_0_psd_kurtosis_data(i,1)=kurtosis(OR014_6_0_psd{i,1});
    OR014_6_0_psd_skewness_data(i,1)=skewness(OR014_6_0_psd{i,1});
    OR014_6_0_psd_peaks_data(i,1)= max(psd{i,1});
    OR014_6_0_psd_crestFactor_data(i,1)= max(OR014_6_0_psd{i,1})/rms(OR014_6_0_psd{i,1});
    OR014_6_0_psd_snr_data(i,1)= snr(OR014_6_0_psd{i,1});
    OR014_6_0_psd_entropy_data(i,1)=entropy(OR014_6_0_psd{i,1});
end
OR014_6_0_Energy=cell2mat(OR014_6_0_Energy);
Label6=6*ones(floor(L_OR014_6_0),1);
OR014_6_0_psd_V=horzcat(OR014_6_0_psd_rms_data,OR014_6_0_psd_var_data,OR014_6_0_psd_means_data,OR014_6_0_psd_std_data,OR014_6_0_psd_kurtosis_data,OR014_6_0_psd_skewness_data,OR014_6_0_psd_peaks_data, OR014_6_0_psd_crestFactor_data, OR014_6_0_psd_snr_data, OR014_6_0_psd_entropy_data, OR014_6_0_Energy,Label6);
OR014_6_0_psd_T=array2table(OR014_6_0_psd_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Peak','CrestFactor','SNR','Entropy','Energy','Label'});
 
%% 0.021" Outer race fault
load('OR021@6_0.mat');
OR021_6_0=X234_DE_time;
total_sample_OR021_6_0=OR021_6_0'; 
 
L_OR021_6_0=length(total_sample_OR021_6_0)/floor(data_cycle);
k=1;
for i=1:floor(L_OR021_6_0)
    E=total_sample_OR021_6_0(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [OR021_6_0_psd{i,1}]=pwelch(E);   %psd of the signal
    OR021_6_0_Energy{i,1} = sum(abs(E).^2);
end
for i=1:length(OR021_6_0_psd)
    OR021_6_0_psd_rms_data(i,1)=rms(OR021_6_0_psd{i,1});
    OR021_6_0_psd_var_data(i,1)=var(OR021_6_0_psd{i,1});
    OR021_6_0_psd_means_data(i,1)=mean(OR021_6_0_psd{i,1});
    OR021_6_0_psd_std_data(i,1)=std(OR021_6_0_psd{i,1});
    OR021_6_0_psd_kurtosis_data(i,1)=kurtosis(OR021_6_0_psd{i,1});
    OR021_6_0_psd_skewness_data(i,1)=skewness(OR021_6_0_psd{i,1});
    OR021_6_0_psd_peaks_data(i,1)= max(psd{i,1});
    OR021_6_0_psd_crestFactor_data(i,1)= max(OR021_6_0_psd{i,1})/rms(OR021_6_0_psd{i,1});
    OR021_6_0_psd_snr_data(i,1)= snr(OR021_6_0_psd{i,1});
    OR021_6_0_psd_entropy_data(i,1)=entropy(OR021_6_0_psd{i,1});
end
OR021_6_0_Energy=cell2mat(OR021_6_0_Energy);
Label7=7*ones(floor(L_OR021_6_0),1);
OR021_6_0_psd_V=horzcat(OR021_6_0_psd_rms_data,OR021_6_0_psd_var_data,OR021_6_0_psd_means_data,OR021_6_0_psd_std_data,OR021_6_0_psd_kurtosis_data,OR021_6_0_psd_skewness_data, OR021_6_0_psd_peaks_data, OR021_6_0_psd_crestFactor_data, OR021_6_0_psd_snr_data, OR021_6_0_psd_entropy_data, OR021_6_0_Energy,Label7);
OR021_6_0_psd_T=array2table(OR021_6_0_psd_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Peak','CrestFactor','SNR','Entropy','Energy','Label'});
 
%% 0.007" Ball Fault
load('B007_0.mat');
B007_0=X118_DE_time;
total_sample_B007_0=B007_0'; 
 
L_B007_0=length(total_sample_B007_0)/floor(data_cycle);
k=1;
for i=1:floor(L_B007_0)
    E=total_sample_B007_0(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [B007_0_psd{i,1}]=pwelch(E);   %psd of the signal
    B007_0_Energy{i,1} = sum(abs(E).^2);
end
for i=1:length(B007_0_psd)
    B007_0_psd_rms_data(i,1)=rms(B007_0_psd{i,1});
    B007_0_psd_var_data(i,1)=var(B007_0_psd{i,1});
    B007_0_psd_means_data(i,1)=mean(B007_0_psd{i,1});
    B007_0_psd_std_data(i,1)=std(B007_0_psd{i,1});
    B007_0_psd_kurtosis_data(i,1)=kurtosis(B007_0_psd{i,1});
    B007_0_psd_skewness_data(i,1)=skewness(B007_0_psd{i,1});
    B007_0_psd_peaks_data(i,1)= max(psd{i,1});
    B007_0_psd_crestFactor_data(i,1)= max(B007_0_psd{i,1})/rms(B007_0_psd{i,1});
    B007_0_psd_snr_data(i,1)= snr(B007_0_psd{i,1});
    B007_0_psd_entropy_data(i,1)=entropy(B007_0_psd{i,1});
end
B007_0_Energy=cell2mat(B007_0_Energy);
Label8=8*ones(floor(L_B007_0),1);
B007_0_psd_V=horzcat(B007_0_psd_rms_data,B007_0_psd_var_data,B007_0_psd_means_data,B007_0_psd_std_data,B007_0_psd_kurtosis_data,B007_0_psd_skewness_data, B007_0_psd_peaks_data, B007_0_psd_crestFactor_data, B007_0_psd_snr_data, B007_0_psd_entropy_data, B007_0_Energy,Label8);
B007_0_psd_T=array2table(B007_0_psd_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Peak','CrestFactor','SNR','Entropy','Energy','Label'});
 
%% 0.014" Ball Fault
load('B014_0.mat');
B014_0= X185_DE_time;
total_sample_B014_0=B014_0'; 
 
L_B014_0=length(total_sample_B014_0)/floor(data_cycle);
k=1;
for i=1:floor(L_B014_0)
    E=total_sample_B014_0(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [B014_0_psd{i,1}]=pwelch(E);   %psd of the signal
    B014_0_Energy{i,1} = sum(abs(E).^2);
end
for i=1:length(B014_0_psd)
    B014_0_psd_rms_data(i,1)=rms(B014_0_psd{i,1});
    B014_0_psd_var_data(i,1)=var(B014_0_psd{i,1});
    B014_0_psd_means_data(i,1)=mean(B014_0_psd{i,1});
    B014_0_psd_std_data(i,1)=std(B014_0_psd{i,1});
    B014_0_psd_kurtosis_data(i,1)=kurtosis(B014_0_psd{i,1});
    B014_0_psd_skewness_data(i,1)=skewness(B014_0_psd{i,1});
    B014_0_psd_peaks_data(i,1)= max(psd{i,1});
    B014_0_psd_crestFactor_data(i,1)= max(B014_0_psd{i,1})/rms(B014_0_psd{i,1});
    B014_0_psd_snr_data(i,1)= snr(B014_0_psd{i,1});
    B014_0_psd_entropy_data(i,1)=entropy(B014_0_psd{i,1});
end
B014_0_Energy=cell2mat(B014_0_Energy);
Label9=9*ones(floor(L_B014_0),1);
B014_0_psd_V=horzcat(B014_0_psd_rms_data,B014_0_psd_var_data,B014_0_psd_means_data,B014_0_psd_std_data,B014_0_psd_kurtosis_data,B014_0_psd_skewness_data, B014_0_psd_peaks_data, B014_0_psd_crestFactor_data, B014_0_psd_snr_data, B014_0_psd_entropy_data, B014_0_Energy,Label9);
B014_0_psd_T=array2table(B014_0_psd_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Peak','CrestFactor','SNR','Entropy','Energy','Label'});
 
%% 0.021" Ball Fault
load('B021_0.mat');
B021_0= X222_DE_time;
total_sample_B021_0=B021_0'; 
 
L_B021_0=length(total_sample_B021_0)/floor(data_cycle);
k=1;
for i=1:floor(L_B021_0)
    E=total_sample_B021_0(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [B021_0_psd{i,1}]=pwelch(E);   %psd of the signal
    B021_0_Energy{i,1} = sum(abs(E).^2);
end
for i=1:length(B021_0_psd)
    B021_0_psd_rms_data(i,1)=rms(B021_0_psd{i,1});
    B021_0_psd_var_data(i,1)=var(B021_0_psd{i,1});
    B021_0_psd_means_data(i,1)=mean(B021_0_psd{i,1});
    B021_0_psd_std_data(i,1)=std(B021_0_psd{i,1});
    B021_0_psd_kurtosis_data(i,1)=kurtosis(B021_0_psd{i,1});
    B021_0_psd_skewness_data(i,1)=skewness(B021_0_psd{i,1});
    B021_0_psd_peaks_data(i,1)= max(psd{i,1});
    B021_0_psd_crestFactor_data(i,1)= max(B021_0_psd{i,1})/rms(B021_0_psd{i,1});
    B021_0_psd_snr_data(i,1)= snr(B021_0_psd{i,1});
    B021_0_psd_entropy_data(i,1)=entropy(B021_0_psd{i,1});
end
B021_0_Energy=cell2mat(B021_0_Energy);
Label10=10*ones(floor(L_B021_0),1);
B021_0_psd_V=horzcat(B021_0_psd_rms_data,B021_0_psd_var_data,B021_0_psd_means_data,B021_0_psd_std_data,B021_0_psd_kurtosis_data,B021_0_psd_skewness_data, B021_0_psd_peaks_data, B021_0_psd_crestFactor_data, B021_0_psd_snr_data, B021_0_psd_entropy_data, B021_0_Energy,Label10);
B021_0_psd_T=array2table(B021_0_psd_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Peak','CrestFactor','SNR','Entropy','Energy','Label'});
 
%% Feature Table
Table_Feat=vertcat(base_psd_T,IR007_psd_T,IR014_psd_T,IR021_psd_T,OR007_6_0_psd_T,OR014_6_0_psd_T,OR021_6_0_psd_T,B007_0_psd_T,B014_0_psd_T,B021_0_psd_T);
 
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
 
stand_var7 = (Table_Feat.Peak - mean(Table_Feat.Peak))/std(Table_Feat.Peak);
Table_Scale.Peak = stand_var7; 
 
stand_var8 = (Table_Feat.CrestFactor - mean(Table_Feat.CrestFactor))/std(Table_Feat.CrestFactor);
Table_Scale.CrestFactor = stand_var8; 
 
stand_var9 = (Table_Feat.SNR - mean(Table_Feat.SNR))/std(Table_Feat.SNR);
Table_Scale.SNR = stand_var9;
 
stand_var10 = (Table_Feat.Entropy - mean(Table_Feat.Entropy))/std(Table_Feat.Entropy);
Table_Scale.Entropy = stand_var10; 
 
stand_var11 = (Table_Feat.Energy - mean(Table_Feat.Energy))/std(Table_Feat.Energy);
Table_Scale.Energy = stand_var11; 
  
Table_Scale=struct2table(Table_Scale);

%% Dimentionality Reduction
 
class_labels=Table_Feat.Label;
 
Data = table2array(Table_Scale);
[coeff,score,latent,tsquared,explained,mu] = pca(Data);
%Take PC based on the weight of 'explained'
PC1 = score(:,1);
PC2 = score(:,2);
PC3 = score(:,3);
PC4 = score(:,4);
PC5 = score(:,5);
PC6 = score(:,6);

data=table(PC1, PC2, PC3, PC4, PC5, PC6, class_labels);

%% -------------- Building Classifier ----------------------------
 
classification_model=fitcnb(data,'class_labels');

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

toc  % for estimating the run time