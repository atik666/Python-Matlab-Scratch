Fs= 12000; %Sampling frequency
%Ts= 1/Fs; % sampling Period or time step
%dt= 0:Ts:1-Ts; %Signal Duration

load('97.mat');
B=X097_DE_time;
C=B';
D=C(1:400);
level=6;
wpt = wpdec(D,level,'sym8');
[Spec,Time,Freq] = wpspectrum(wpt,Fs,'plot');

%{
nfft=length(D); %length of time domain signal
nfft2=2^nextpow2(nfft); %length of signal in power of 2
ff=fft(D,nfft2);
fff=ff(1:nfft2/2);
fff=fff/max(fff);
xfft=Fs*(0:nfft2/2-1)/nfft2;

plot(xfft,abs(fff),'r');
xlabel('Frequency [Hz]');
ylabel('Normalized Amplitude [v]');
title('Frequency domain signal');
hold on
%Power_full_signal=(1/nfft2)*(abs(fff).^2);
%plot(xfft,Power_full_signal,'b');
%}
figure;
windowsize = 128;
window = hanning(windowsize);
nfft = windowsize;
noverlap = windowsize-1;
[S,F,T] = spectrogram(D,window,noverlap,nfft,Fs);
imagesc(T,F,log10(abs(S)))
set(gca,'YDir','Normal')
xlabel('Time (secs)')
ylabel('Freq (Hz)')
title('Short-time Fourier Transform spectrum')