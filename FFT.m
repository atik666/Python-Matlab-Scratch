clc;clear;
Fs= 12000; %Sampling frequency
Ts= 1/Fs; % sampling Period or time step
dt= 0:Ts:1-Ts; %Signal Duration

load('base.mat');
B=X097_DE_time;
D=B';
C=D(1:1200);

nfft=length(C); %length of time domain signal
nfft2=2^nextpow2(nfft); %length of signal in power of 2
ff=fft(C,nfft2);
fff=ff(1:nfft2/2);
fff=fff/max(fff);
xfft=Fs*(0:nfft2/2-1)/nfft2;

plot(xfft,abs(fff),'r');
xlabel('Frequency [Hz]');
ylabel('Normalized Amplitude [v]');
title('Frequency domain signal');
%hold on
%Power_full_signal=(1/nfft2)*(abs(fff).^2);
%plot(xfft,Power_full_signal,'b');
%energy=fff*conj(fff);
[AV_Energy,Total_Energy]=ENERGY_FFT(C);


