clc;clear;
fs= 12000; %Sampling frequency

load('base.mat'); %load the data into workstation
B=X097_DE_time;
total_sample=B';   %total sample data

rpm=1797;        %rotor speed in rpm
speed=rpm/60;      %spped in Hz
data_cycle=fs/speed;         %number of data/cycle

sample_duration=length(total_sample)/fs;  %sampling duration

L=length(total_sample)/floor(data_cycle);  %number of total datasets

k=1;
for i=1:floor(L)
    E=total_sample(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [Xfft{i,1},fft{i,1}]=AV_FFT(E);   %FFT of the signal
    [~,PSD{i,1}]=AV_PSD(E); %Power spectral density of the signal
end

for i=1:length(fft)
    fft_rms_data(i,1)=rms(fft{i,1});
    fft_var_data(i,1)=var(fft{i,1});
    fft_means_data(i,1)=mean(fft{i,1});
    fft_std_data(i,1)=std(fft{i,1});
    fft_kurtosis_data(i,1)=kurtosis(fft{i,1});
    fft_skewness_data(i,1)=skewness(fft{i,1});
end

for i=1:length(PSD)
    PSD_rms_data(i,1)=rms(PSD{i,1});
    PSD_var_data(i,1)=var(PSD{i,1});
    PSD_means_data(i,1)=mean(PSD{i,1});
    PSD_std_data(i,1)=std(PSD{i,1});
    PSD_kurtosis_data(i,1)=kurtosis(PSD{i,1});
    PSD_skewness_data(i,1)=skewness(PSD{i,1});   
end
