function [Energy,Power] = con_wav_trn(data)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
coefs = cwt(data,1:50,'morl');
Energy = norm(coefs,'fro')^2;
Power = norm(coefs.*conj(coefs));
end

