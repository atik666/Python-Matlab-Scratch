clc;clear;
% Load signal. 
load base.mat; 
x = X097_DE_time(1:6000);
signal=x';
% Decompose x at depth 3 with db1 wavelet packets 
% using Shannon entropy. 
wpt = wpdec(signal,4,'db4');

% Plot wavelet packet tree wpt. 
plot(wpt)

% Read packet coefficients. 
cfs0 = wpcoef(wpt,[4 0]);
cfs1 = wpcoef(wpt,[4 1]);
cfs2 = wpcoef(wpt,[4 2]);
cfs3 = wpcoef(wpt,[4 3]);
cfs4 = wpcoef(wpt,[4 4]);
cfs5 = wpcoef(wpt,[4 5]);
cfs6 = wpcoef(wpt,[4 6]);
cfs7 = wpcoef(wpt,[4 7]);
cfs8 = wpcoef(wpt,[4 8]);
cfs9 = wpcoef(wpt,[4 9]);
cfs10 = wpcoef(wpt,[4 10]);
cfs11 = wpcoef(wpt,[4 11]);
cfs12 = wpcoef(wpt,[4 12]);
cfs13 = wpcoef(wpt,[4 13]);
cfs14 = wpcoef(wpt,[4 14]);
cfs15 = wpcoef(wpt,[4 15]);

figure(1); 
subplot(921); 
plot(signal); title('Original signal');

subplot(923); 
plot(cfs0); title('Packet (4,0) coefficients');
subplot(924); 
plot(cfs1); title('Packet (4,1) coefficients');
subplot(925); 
plot(cfs2); title('Packet (4,2) coefficients');
subplot(926); 
plot(cfs3); title('Packet (4,3) coefficients');
subplot(927); 
plot(cfs4); title('Packet (4,4) coefficients');
subplot(928); 
plot(cfs5); title('Packet (4,5) coefficients');
subplot(929); 
plot(cfs6); title('Packet (4,6) coefficients');
subplot(9,2,10); 
plot(cfs7); title('Packet (4,7) coefficients');
subplot(9,2,11); 
plot(cfs8); title('Packet (4,8) coefficients');
subplot(9,2,12); 
plot(cfs9); title('Packet (4,9) coefficients');
subplot(9,2,13); 
plot(cfs10); title('Packet (4,10) coefficients');
subplot(9,2,14); 
plot(cfs11); title('Packet (4,11) coefficients');
subplot(9,2,15); 
plot(cfs12); title('Packet (4,12) coefficients');
subplot(9,2,16); 
plot(cfs13); title('Packet (4,13) coefficients');
subplot(9,2,17); 
plot(cfs14); title('Packet (4,14) coefficients');
subplot(9,2,18); 
plot(cfs15); title('Packet (4,15) coefficients');


Energy = wenergy(wpt);