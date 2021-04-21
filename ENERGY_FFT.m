function [AV_Energy,Total_Energy] = ENERGY_FFT(Data)
fs=12000;
nfft=length(Data);
nfft2=2^nextpow2(nfft);
ff=fft(Data,nfft2);
fff=ff(1:nfft2/2);
xfft=fs*(0:nfft2/2-1)/nfft2;
Av_Abs_fft = abs(fff); %max=81.1%
Energy=fff.*conj(fff);
Total_Energy=sum(Energy);
AV_Energy=mean(Energy);
end
