clc;clear;
Fs= 12000; %Sampling frequency
Ts= 1/Fs; % sampling Period or time step
dt= 0:Ts:1-Ts; %Signal Duration

load('base.mat');
B=X097_DE_time;
D=B';
C=D(1:6000);

%{
wt = cwt(C,1:50,'morl');
[wt,f] = cwt(C,seconds(30),'amor');
plot(wt,f);
%}

cw1 = cwt(C,1:50,'sym2','plot');