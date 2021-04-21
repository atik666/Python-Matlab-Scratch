Fs=200e3;
Ts=1/Fs;
dt=0:Ts:5e-3-Ts;

A = csvread('data.csv');                              % Data in ‘d’
B= A(:,2);

%plot(dt,y)
nfft=length(B);
nfft2=2.^nextpow2(nfft);
fy=fft(B,nfft2);
fy=fy(1:nfft2/2);

xfft=Fs*(0:nfft2/2-1)/nfft2;

plot(xfft,abs(fy/max(fy)));
cut_off=1.5e3/Fs/2;
order=64;
h= fir1(order,cut_off);
con=conv(B,h);
%plot(con);