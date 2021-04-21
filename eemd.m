% y=xlsread('some.data');       % load a signal.
% num_IMF = 5;                      % numbers of IMF
% NR = 10;                      % value of ensemble
% Nstd = 0.3;                   % param to white noise
% 
% IMF1=eemd(y,num_IMF,NR,Nstd);

function [modes] = eemd(y, num_IMF, NR, Nstd)
stdy = std(y);
if stdy < 0.01
    stdy = 1;
end
y = y ./ stdy;
siz = length(y);
modes = zeros(siz,num_IMF);
for k = 1:NR
    disp(['Ensemble number #' num2str(k)]);
    wn = (randn(1,siz).*Nstd)';
    y1 = y + wn;
    modes = modes + emd(y1,'MaxNumIMF',num_IMF);
end
modes = modes .* stdy ./ (NR);
end
