clear;clc;
fs = 12000; % sampling rate
x = 0:0.1/1200:0.1;
x(:,69) = [];
% pxx = pwelch(y);
% r = snr(y);
% 
% se = entropy(y);
% 
% Energy_T = sum(abs(y).^2)
% 
% Xf = AV_FFT(y); 
% Energy = sum(abs(Xf).^2) / length(Xf)
% 
% F=findpeaks(y);
% G=max(Xf)
%[imf,residue] = emd(y);

% figure,
% for i=1:length(imf(:,1))
%     subplot(length(imf(:,1)),1,i);
%     plot(imf(i,:));
% end

% for i=1:5
%     subplot(5,1,i);
%     plot(imf(i+13,:));
% end
% figure(1)
% 
% [~,Power_full_signal] = AV_PSD(y);
% plot(Power_full_signal);
% figure(2)
% [~,Av_Abs_fft] = AV_FFT(y);
% plot(Av_Abs_fft);
load('base.mat');
B=X097_DE_time;
total_sample=B(1:1200)'; 

[freq, xdft, psdx, phase] = Mide_FFT_PSD(total_sample,fs);

[xfft,Power_full_signal] = AV_PSD(total_sample);

%% Normal Data
load('base.mat');
B=X097_DE_time;
total_sample=B(1:1200)'; 

[base_psd]=pwelch(total_sample);

%% 0.007" Inner Race Fault
load('IR007_0.mat');
IR007=X105_DE_time;
total_sample_IR007=IR007(1:1200)'; 

[IR007_psd]=pwelch(total_sample_IR007);

%% 0.014" Inner Race Fault
load('IR014_0.mat');
IR014= X169_DE_time;
total_sample_IR014=IR014(1:1200)'; 

[IR014_psd]=pwelch(total_sample_IR014);

%% 0.021" Inner Race Fault
load('IR021_0.mat');
IR021= X209_DE_time;
total_sample_IR021=IR021(1:1200)'; 

[IR021_psd]=pwelch(total_sample_IR021);

%% 0.007" Outer race fault
load('OR007@6_0.mat');
OR007_6_0=X130_DE_time;
total_sample_OR007_6_0=OR007_6_0(1:1200)'; 

[OR007_6_0_psd]=pwelch(total_sample_OR007_6_0);

%% 0.014" Outer race fault
load('OR014@6_0.mat');
OR014_6_0=X197_DE_time;
total_sample_OR014_6_0=OR014_6_0(1:1200)'; 

[OR014_6_0_psd]=pwelch(total_sample_OR014_6_0);

%% 0.021" Outer race fault
load('OR021@6_0.mat');
OR021_6_0=X234_DE_time;
total_sample_OR021_6_0=OR021_6_0(1:1200)'; 

[OR021_6_0_psd]=pwelch(total_sample_OR021_6_0);

%% 0.007" Ball Fault
load('B007_0.mat');
B007_0=X118_DE_time;
total_sample_B007_0=B007_0(1:1200)'; 

[B007_0_psd]=pwelch(total_sample_B007_0);

%% 0.014" Ball Fault
load('B014_0.mat');
B014_0= X185_DE_time;
total_sample_B014_0=B014_0(1:1200)'; 

[B014_0_psd]=pwelch(total_sample_B014_0);

%% 0.021" Ball Fault
load('B021_0.mat');
B021_0= X222_DE_time;
total_sample_B021_0=B021_0(1:1200)'; 

[B021_0_psd]=pwelch(total_sample_B021_0);

%% Ploting
figure(1)
subplot(5,2,1)
plot(x,total_sample)
title('Baseline Condition')
xlabel('Time')
ylabel('Amplitude')

subplot(5,2,2)
plot(x,total_sample_IR007)
title('0.007" Inner Race Fault')
xlabel('Time')
ylabel('Amplitude')

subplot(5,2,3)
plot(x,total_sample_IR014)
title('0.014" Inner Race Fault')
xlabel('Time')
ylabel('Amplitude')

subplot(5,2,4)
plot(x,total_sample_IR021)
title('0.021" Inner Race Fault')
xlabel('Time')
ylabel('Amplitude')

subplot(5,2,5)
plot(x,total_sample_OR007_6_0)
title('0.007" Outer race fault')
xlabel('Time')
ylabel('Amplitude')

subplot(5,2,6)
plot(x,total_sample_OR014_6_0)
title('0.014" Outer Race Fault')
xlabel('Time')
ylabel('Amplitude')

subplot(5,2,7)
plot(x,total_sample_OR021_6_0)
title('0.021" Outer Race Fault')
xlabel('Time')
ylabel('Amplitude')

subplot(5,2,8)
plot(x,total_sample_B007_0)
title('0.007" Ball Fault')
xlabel('Time')
ylabel('Amplitude')

subplot(5,2,9)
plot(x,total_sample_B014_0)
title('0.014" Ball Fault')
xlabel('Time')
ylabel('Amplitude')

subplot(5,2,10)
plot(x,total_sample_B021_0)
title('0.021" Ball Fault')
xlabel('Time')
ylabel('Amplitude')

%% PSD Plot
figure(2)

subplot(5,2,1)
plot(base_psd,'m')
title('Baseline Condition')
xlabel('Number of samples')
ylabel('Amplitude')

subplot(5,2,2)
plot(IR007_psd,'r')
title('0.007" Inner Race Fault')
xlabel('Number of samples')
ylabel('Amplitude')

subplot(5,2,3)
plot(IR014_psd,'r')
title('0.014" Inner Race Fault')
xlabel('Number of samples')
ylabel('Amplitude')

subplot(5,2,4)
plot(IR021_psd,'r')
title('0.021" Inner Race Fault')
xlabel('Number of samples')
ylabel('Amplitude')

subplot(5,2,5)
plot(OR007_6_0_psd,'b')
title('0.007" Outer race fault')
xlabel('Number of samples')
ylabel('Amplitude')

subplot(5,2,6)
plot(OR014_6_0_psd,'b')
title('0.014" Outer Race Fault')
xlabel('Number of samples')
ylabel('Amplitude')

subplot(5,2,7)
plot(OR021_6_0_psd,'b')
title('0.021" Outer Race Fault')
xlabel('Number of samples')
ylabel('Amplitude')

subplot(5,2,8)
plot(B007_0_psd,'g')
title('0.007" Ball Fault')
xlabel('Number of samples')
ylabel('Amplitude')

subplot(5,2,9)
plot(B014_0_psd,'g')
title('0.014" Ball Fault')
xlabel('Number of samples')
ylabel('Amplitude')

subplot(5,2,10)
plot(B021_0_psd,'g')
title('0.021" Ball Fault')
xlabel('Number of samples')
ylabel('Amplitude')

%% PSD Plot
figure(3)

subplot(5,2,1)
area(base_psd)
title('Baseline Condition')
xlabel('Frequency(Hz)')
ylabel('Amplitude')

subplot(5,2,2)
area(IR007_psd)
title('0.007" Inner Race Fault')
xlabel('Frequency(Hz)')
ylabel('Amplitude')

subplot(5,2,3)
area(IR014_psd)
title('0.014" Inner Race Fault')
xlabel('Frequency(Hz)')
ylabel('Amplitude')

subplot(5,2,4)
area(IR021_psd)
title('0.021" Inner Race Fault')
xlabel('Frequency(Hz)')
ylabel('Amplitude')

subplot(5,2,5)
area(OR007_6_0_psd)
title('0.007" Outer race fault')
xlabel('Frequency(Hz)')
ylabel('Amplitude')

subplot(5,2,6)
area(OR014_6_0_psd)
title('0.014" Outer Race Fault')
xlabel('Frequency(Hz)')
ylabel('Amplitude')

subplot(5,2,7)
area(OR021_6_0_psd)
title('0.021" Outer Race Fault')
xlabel('Frequency(Hz)')
ylabel('Amplitude')

subplot(5,2,8)
area(B007_0_psd)
title('0.007" Ball Fault')
xlabel('Frequency(Hz)')
ylabel('Amplitude')

subplot(5,2,9)
area(B014_0_psd)
title('0.014" Ball Fault')
xlabel('Frequency(Hz)')
ylabel('Amplitude')

subplot(5,2,10)
area(B021_0_psd)
title('0.021" Ball Fault')
xlabel('Frequency(Hz)')
ylabel('Amplitude')
