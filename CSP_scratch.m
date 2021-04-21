clear;clc;

Fs= 12000; %Sampling frequency
rpm=1797;        %rotor speed in rpm
speed=rpm/60;      %speed in Hz
data_cycle=3*Fs/speed;         %number of data/cycle

load('base.mat');
data1 = X097_DE_time;
load('IR007_0.mat');
data2 = X105_DE_time;

[W] = bCSP(data1, data2, 90);

k = 1;
for i = 1: 90
    class1{i,i} = data1(k : k+1200 - 1);
    k = k + 1200;
end

k = 1;
for i = 1: 90
    class2{1,i} = data2(k : k+1200 - 1);
    k = k + 1200;
end

class1 = cell2mat(class1);
class2 = cell2mat(class2);

[result] = f_CSP(class1, class2);

Z1 = result*class1;
Z2 = result*class2;

for i = 1:90
    fp1{i,1} = log(var(Z1(:,i))/(var(Z1(1:50,i)) + var(Z1(end-50:end,i))));
end

fp1 = cell2mat(fp1);

for i = 1:90
    fp2{i,1} = log(var(Z2(:,i))/(var(Z2(1:50,i)) + var(Z2(end-50:end,i))));
end

fp2 = cell2mat(fp2);

feat = vertcat(fp1, fp2);

Label1 = ones(90,1);
Label2 = 2*ones(90,1);
Label = vertcat(Label1, Label2);

feat = normFun(feat);

[cm, accuracy] = HsvmFun(feat, Label, 0.3);
