clc;clear;

%% Setting up the variables

fs = 12000; % sampling rate
%t = 0:1/fs:2; % 2 secs at 1kHz sample rate

load('base.mat');
B=X097_DE_time;
total_sample=B';           %total data points

rpm=1797;        %rotor speed in rpm
speed=rpm/60;      %spped in Hz
data_cycle=fs/speed;         %number of data/cycle

%[cA,cD] = dwt(D,'db4');

L=length(total_sample)/floor(data_cycle);   %number of total datasets

%% Loop for DWT

k=1;
for i=1:floor(L)
    signal=total_sample(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [cA1{i,1},cD1{i,1}]=dwt(signal,'db4'); 
end

for i=1:length(cA1)
    cA1_rms_data(i,1)=rms(cA1{i,1});
    cA1_var_data(i,1)=var(cA1{i,1});
    cA1_means_data(i,1)=mean(cA1{i,1});
    cA1_std_data(i,1)=std(cA1{i,1});
    cA1_kurtosis_data(i,1)=kurtosis(cA1{i,1});
    cA1_skewness_data(i,1)=skewness(cA1{i,1});
end

for i=1:length(cD1)
    cD1_rms_data(i,1)=rms(cD1{i,1});
    cD1_var_data(i,1)=var(cD1{i,1});
    cD1_means_data(i,1)=mean(cD1{i,1});
    cD1_std_data(i,1)=std(cD1{i,1});
    cD1_kurtosis_data(i,1)=kurtosis(cD1{i,1});
    cD1_skewness_data(i,1)=skewness(cD1{i,1});
end

for i=1:floor(L)
    [cA2{i,1},cD2{i,1}]=dwt(cA1{i,1},'db4'); 
end

for i=1:length(cA2)
    cA2_rms_data(i,1)=rms(cA2{i,1});
    cA2_var_data(i,1)=var(cA2{i,1});
    cA2_means_data(i,1)=mean(cA2{i,1});
    cA2_std_data(i,1)=std(cA2{i,1});
    cA2_kurtosis_data(i,1)=kurtosis(cA2{i,1});
    cA2_skewness_data(i,1)=skewness(cA2{i,1});
end

for i=1:length(cD2)
    cD2_rms_data(i,1)=rms(cD2{i,1});
    cD2_var_data(i,1)=var(cD2{i,1});
    cD2_means_data(i,1)=mean(cD2{i,1});
    cD2_std_data(i,1)=std(cD2{i,1});
    cD2_kurtosis_data(i,1)=kurtosis(cD2{i,1});
    cD2_skewness_data(i,1)=skewness(cD2{i,1});
end

for i=1:floor(L)
    [cA3{i,1},cD3{i,1}]=dwt(cA2{i,1},'db4'); 
end

for i=1:length(cA3)
    cA3_rms_data(i,1)=rms(cA3{i,1});
    cA3_var_data(i,1)=var(cA3{i,1});
    cA3_means_data(i,1)=mean(cA3{i,1});
    cA3_std_data(i,1)=std(cA3{i,1});
    cA3_kurtosis_data(i,1)=kurtosis(cA3{i,1});
    cA3_skewness_data(i,1)=skewness(cA3{i,1});
end

for i=1:length(cD3)
    cD3_rms_data(i,1)=rms(cD3{i,1});
    cD3_var_data(i,1)=var(cD3{i,1});
    cD3_means_data(i,1)=mean(cD3{i,1});
    cD3_std_data(i,1)=std(cD3{i,1});
    cD3_kurtosis_data(i,1)=kurtosis(cD3{i,1});
    cD3_skewness_data(i,1)=skewness(cD3{i,1});
end

for i=1:floor(L)
    [cA4{i,1},cD4{i,1}]=dwt(cA3{i,1},'db4'); 
end

for i=1:length(cA4)
    cA4_rms_data(i,1)=rms(cA4{i,1});
    cA4_var_data(i,1)=var(cA4{i,1});
    cA4_means_data(i,1)=mean(cA4{i,1});
    cA4_std_data(i,1)=std(cA4{i,1});
    cA4_kurtosis_data(i,1)=kurtosis(cA4{i,1});
    cA4_skewness_data(i,1)=skewness(cA4{i,1});
end

for i=1:length(cD4)
    cD4_rms_data(i,1)=rms(cD4{i,1});
    cD4_var_data(i,1)=var(cD4{i,1});
    cD4_means_data(i,1)=mean(cD4{i,1});
    cD4_std_data(i,1)=std(cD4{i,1});
    cD4_kurtosis_data(i,1)=kurtosis(cD4{i,1});
    cD4_skewness_data(i,1)=skewness(cD4{i,1});
end

%% Labelling the data
Label1=ones(floor(L),1);
cA1_V=horzcat(cA1_kurtosis_data,cA1_means_data,cA1_rms_data,cA1_skewness_data,cA1_std_data,cA1_var_data,Label1);
cA1_T=array2table(cA1_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});

cD1_V=horzcat(cD1_kurtosis_data,cD1_means_data,cD1_rms_data,cD1_skewness_data,cD1_std_data,cD1_var_data,Label1);
cD1_T=array2table(cD1_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});

cA2_V=horzcat(cA2_kurtosis_data,cA2_means_data,cA2_rms_data,cA2_skewness_data,cA2_std_data,cA2_var_data,Label1);
cA2_T=array2table(cA2_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});

cD2_V=horzcat(cD2_kurtosis_data,cD2_means_data,cD2_rms_data,cD2_skewness_data,cD2_std_data,cD2_var_data,Label1);
cD2_T=array2table(cD2_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});

cA3_V=horzcat(cA3_kurtosis_data,cA3_means_data,cA3_rms_data,cA3_skewness_data,cA3_std_data,cA3_var_data,Label1);
cA3_T=array2table(cA3_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});

cD3_V=horzcat(cD3_kurtosis_data,cD3_means_data,cD3_rms_data,cD3_skewness_data,cD3_std_data,cD3_var_data,Label1);
cD3_T=array2table(cD3_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});

cA4_V=horzcat(cA4_kurtosis_data,cA4_means_data,cA4_rms_data,cA4_skewness_data,cA4_std_data,cA4_var_data,Label1);
cA4_T=array2table(cA4_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});

cD4_V=horzcat(cD4_kurtosis_data,cD4_means_data,cD4_rms_data,cD4_skewness_data,cD4_std_data,cD4_var_data,Label1);
cD4_T=array2table(cD4_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});

Table=vertcat(cA1_T,cA2_T,cA3_T,cA4_T,cD1_T,cD2_T,cD3_T,cD4_T);
%% Inner race fault
load('ir.mat');
ir=X105_DE_time;
total_sample_ir=ir'; 

L_ir=length(total_sample_ir)/floor(data_cycle);
%% DWT loop for IR
 
k=1;
for i=1:floor(L_ir)
    signal_ir=total_sample(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [ir_cA1{i,1},ir_cD1{i,1}]=dwt(signal_ir,'db4'); 
end
 
for i=1:length(ir_cA1)
    ir_cA1_rms_data(i,1)=rms(ir_cA1{i,1});
    ir_cA1_var_data(i,1)=var(ir_cA1{i,1});
    ir_cA1_means_data(i,1)=mean(ir_cA1{i,1});
    ir_cA1_std_data(i,1)=std(ir_cA1{i,1});
    ir_cA1_kurtosis_data(i,1)=kurtosis(ir_cA1{i,1});
    ir_cA1_skewness_data(i,1)=skewness(ir_cA1{i,1});
end
 
for i=1:length(ir_cD1)
    ir_cD1_rms_data(i,1)=rms(ir_cD1{i,1});
    ir_cD1_var_data(i,1)=var(ir_cD1{i,1});
    ir_cD1_means_data(i,1)=mean(ir_cD1{i,1});
    ir_cD1_std_data(i,1)=std(ir_cD1{i,1});
    ir_cD1_kurtosis_data(i,1)=kurtosis(ir_cD1{i,1});
    ir_cD1_skewness_data(i,1)=skewness(ir_cD1{i,1});
end
 
for i=1:floor(L_ir)
    [ir_cA2{i,1},ir_cD2{i,1}]=dwt(ir_cA1{i,1},'db4'); 
end
 
for i=1:length(ir_cA2)
    ir_cA2_rms_data(i,1)=rms(ir_cA2{i,1});
    ir_cA2_var_data(i,1)=var(ir_cA2{i,1});
    ir_cA2_means_data(i,1)=mean(ir_cA2{i,1});
    ir_cA2_std_data(i,1)=std(ir_cA2{i,1});
    ir_cA2_kurtosis_data(i,1)=kurtosis(ir_cA2{i,1});
    ir_cA2_skewness_data(i,1)=skewness(ir_cA2{i,1});
end
 
for i=1:length(ir_cD2)
    ir_cD2_rms_data(i,1)=rms(ir_cD2{i,1});
    ir_cD2_var_data(i,1)=var(ir_cD2{i,1});
    ir_cD2_means_data(i,1)=mean(ir_cD2{i,1});
    ir_cD2_std_data(i,1)=std(ir_cD2{i,1});
    ir_cD2_kurtosis_data(i,1)=kurtosis(ir_cD2{i,1});
    ir_cD2_skewness_data(i,1)=skewness(ir_cD2{i,1});
end
 
for i=1:floor(L_ir)
    [ir_cA3{i,1},ir_cD3{i,1}]=dwt(ir_cA2{i,1},'db4'); 
end
 
for i=1:length(ir_cA3)
    ir_cA3_rms_data(i,1)=rms(ir_cA3{i,1});
    ir_cA3_var_data(i,1)=var(ir_cA3{i,1});
    ir_cA3_means_data(i,1)=mean(ir_cA3{i,1});
    ir_cA3_std_data(i,1)=std(ir_cA3{i,1});
    ir_cA3_kurtosis_data(i,1)=kurtosis(ir_cA3{i,1});
    ir_cA3_skewness_data(i,1)=skewness(ir_cA3{i,1});
end
 
for i=1:length(ir_cD3)
    ir_cD3_rms_data(i,1)=rms(ir_cD3{i,1});
    ir_cD3_var_data(i,1)=var(ir_cD3{i,1});
    ir_cD3_means_data(i,1)=mean(ir_cD3{i,1});
    ir_cD3_std_data(i,1)=std(ir_cD3{i,1});
    ir_cD3_kurtosis_data(i,1)=kurtosis(ir_cD3{i,1});
    ir_cD3_skewness_data(i,1)=skewness(ir_cD3{i,1});
end
 
for i=1:floor(L_ir)
    [ir_cA4{i,1},ir_cD4{i,1}]=dwt(ir_cA3{i,1},'db4'); 
end
 
for i=1:length(ir_cA4)
    ir_cA4_rms_data(i,1)=rms(ir_cA4{i,1});
    ir_cA4_var_data(i,1)=var(ir_cA4{i,1});
    ir_cA4_means_data(i,1)=mean(ir_cA4{i,1});
    ir_cA4_std_data(i,1)=std(ir_cA4{i,1});
    ir_cA4_kurtosis_data(i,1)=kurtosis(ir_cA4{i,1});
    ir_cA4_skewness_data(i,1)=skewness(ir_cA4{i,1});
end
 
for i=1:length(ir_cD4)
    ir_cD4_rms_data(i,1)=rms(ir_cD4{i,1});
    ir_cD4_var_data(i,1)=var(ir_cD4{i,1});
    ir_cD4_means_data(i,1)=mean(ir_cD4{i,1});
    ir_cD4_std_data(i,1)=std(ir_cD4{i,1});
    ir_cD4_kurtosis_data(i,1)=kurtosis(ir_cD4{i,1});
    ir_cD4_skewness_data(i,1)=skewness(ir_cD4{i,1});
end

%% Labelling the data: IR
Label2=2*ones(floor(L_ir),1);
ir_cA1_V=horzcat(ir_cA1_kurtosis_data,ir_cA1_means_data,ir_cA1_rms_data,ir_cA1_skewness_data,ir_cA1_std_data,ir_cA1_var_data,Label2);
ir_cA1_T=array2table(ir_cA1_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
ir_cD1_V=horzcat(ir_cD1_kurtosis_data,ir_cD1_means_data,ir_cD1_rms_data,ir_cD1_skewness_data,ir_cD1_std_data,ir_cD1_var_data,Label2);
ir_cD1_T=array2table(ir_cD1_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
ir_cA2_V=horzcat(ir_cA2_kurtosis_data,ir_cA2_means_data,ir_cA2_rms_data,ir_cA2_skewness_data,ir_cA2_std_data,ir_cA2_var_data,Label2);
ir_cA2_T=array2table(ir_cA2_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
ir_cD2_V=horzcat(ir_cD2_kurtosis_data,ir_cD2_means_data,ir_cD2_rms_data,ir_cD2_skewness_data,ir_cD2_std_data,ir_cD2_var_data,Label2);
ir_cD2_T=array2table(ir_cD2_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
ir_cA3_V=horzcat(ir_cA3_kurtosis_data,ir_cA3_means_data,ir_cA3_rms_data,ir_cA3_skewness_data,ir_cA3_std_data,ir_cA3_var_data,Label2);
ir_cA3_T=array2table(ir_cA3_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
ir_cD3_V=horzcat(ir_cD3_kurtosis_data,ir_cD3_means_data,ir_cD3_rms_data,ir_cD3_skewness_data,ir_cD3_std_data,ir_cD3_var_data,Label2);
ir_cD3_T=array2table(ir_cD3_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
ir_cA4_V=horzcat(ir_cA4_kurtosis_data,ir_cA4_means_data,ir_cA4_rms_data,ir_cA4_skewness_data,ir_cA4_std_data,ir_cA4_var_data,Label2);
ir_cA4_T=array2table(ir_cA4_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
ir_cD4_V=horzcat(ir_cD4_kurtosis_data,ir_cD4_means_data,ir_cD4_rms_data,ir_cD4_skewness_data,ir_cD4_std_data,ir_cD4_var_data,Label2);
ir_cD4_T=array2table(ir_cD4_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
Table_ir=vertcat(ir_cA1_T,ir_cA2_T,ir_cA3_T,ir_cA4_T,ir_cD1_T,ir_cD2_T,ir_cD3_T,ir_cD4_T);

%% Outer race fault
load('or.mat');
or=X130_DE_time;
total_sample_or=or'; 

L_or=length(total_sample_or)/floor(data_cycle);
%% DWT loop for OR
 
k=1;
for i=1:floor(L_or)
    signal_or=total_sample(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [or_cA1{i,1},or_cD1{i,1}]=dwt(signal_or,'db4'); 
end
 
for i=1:length(or_cA1)
    or_cA1_rms_data(i,1)=rms(or_cA1{i,1});
    or_cA1_var_data(i,1)=var(or_cA1{i,1});
    or_cA1_means_data(i,1)=mean(or_cA1{i,1});
    or_cA1_std_data(i,1)=std(or_cA1{i,1});
    or_cA1_kurtosis_data(i,1)=kurtosis(or_cA1{i,1});
    or_cA1_skewness_data(i,1)=skewness(or_cA1{i,1});
end
 
for i=1:length(or_cD1)
    or_cD1_rms_data(i,1)=rms(or_cD1{i,1});
    or_cD1_var_data(i,1)=var(or_cD1{i,1});
    or_cD1_means_data(i,1)=mean(or_cD1{i,1});
    or_cD1_std_data(i,1)=std(or_cD1{i,1});
    or_cD1_kurtosis_data(i,1)=kurtosis(or_cD1{i,1});
    or_cD1_skewness_data(i,1)=skewness(or_cD1{i,1});
end
 
for i=1:floor(L_or)
    [or_cA2{i,1},or_cD2{i,1}]=dwt(or_cA1{i,1},'db4'); 
end
 
for i=1:length(or_cA2)
    or_cA2_rms_data(i,1)=rms(or_cA2{i,1});
    or_cA2_var_data(i,1)=var(or_cA2{i,1});
    or_cA2_means_data(i,1)=mean(or_cA2{i,1});
    or_cA2_std_data(i,1)=std(or_cA2{i,1});
    or_cA2_kurtosis_data(i,1)=kurtosis(or_cA2{i,1});
    or_cA2_skewness_data(i,1)=skewness(or_cA2{i,1});
end
 
for i=1:length(or_cD2)
    or_cD2_rms_data(i,1)=rms(or_cD2{i,1});
    or_cD2_var_data(i,1)=var(or_cD2{i,1});
    or_cD2_means_data(i,1)=mean(or_cD2{i,1});
    or_cD2_std_data(i,1)=std(or_cD2{i,1});
    or_cD2_kurtosis_data(i,1)=kurtosis(or_cD2{i,1});
    or_cD2_skewness_data(i,1)=skewness(or_cD2{i,1});
end
 
for i=1:floor(L_or)
    [or_cA3{i,1},or_cD3{i,1}]=dwt(or_cA2{i,1},'db4'); 
end
 
for i=1:length(or_cA3)
    or_cA3_rms_data(i,1)=rms(or_cA3{i,1});
    or_cA3_var_data(i,1)=var(or_cA3{i,1});
    or_cA3_means_data(i,1)=mean(or_cA3{i,1});
    or_cA3_std_data(i,1)=std(or_cA3{i,1});
    or_cA3_kurtosis_data(i,1)=kurtosis(or_cA3{i,1});
    or_cA3_skewness_data(i,1)=skewness(or_cA3{i,1});
end
 
for i=1:length(or_cD3)
    or_cD3_rms_data(i,1)=rms(or_cD3{i,1});
    or_cD3_var_data(i,1)=var(or_cD3{i,1});
    or_cD3_means_data(i,1)=mean(or_cD3{i,1});
    or_cD3_std_data(i,1)=std(or_cD3{i,1});
    or_cD3_kurtosis_data(i,1)=kurtosis(or_cD3{i,1});
    or_cD3_skewness_data(i,1)=skewness(or_cD3{i,1});
end
 
for i=1:floor(L_or)
    [or_cA4{i,1},or_cD4{i,1}]=dwt(or_cA3{i,1},'db4'); 
end
 
for i=1:length(or_cA4)
    or_cA4_rms_data(i,1)=rms(or_cA4{i,1});
    or_cA4_var_data(i,1)=var(or_cA4{i,1});
    or_cA4_means_data(i,1)=mean(or_cA4{i,1});
    or_cA4_std_data(i,1)=std(or_cA4{i,1});
    or_cA4_kurtosis_data(i,1)=kurtosis(or_cA4{i,1});
    or_cA4_skewness_data(i,1)=skewness(or_cA4{i,1});
end
 
for i=1:length(or_cD4)
    or_cD4_rms_data(i,1)=rms(or_cD4{i,1});
    or_cD4_var_data(i,1)=var(or_cD4{i,1});
    or_cD4_means_data(i,1)=mean(or_cD4{i,1});
    or_cD4_std_data(i,1)=std(or_cD4{i,1});
    or_cD4_kurtosis_data(i,1)=kurtosis(or_cD4{i,1});
    or_cD4_skewness_data(i,1)=skewness(or_cD4{i,1});
end
 
%% Labelling the data: OR
Label3=3*ones(floor(L_or),1);
or_cA1_V=horzcat(or_cA1_kurtosis_data,or_cA1_means_data,or_cA1_rms_data,or_cA1_skewness_data,or_cA1_std_data,or_cA1_var_data,Label3);
or_cA1_T=array2table(or_cA1_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
or_cD1_V=horzcat(or_cD1_kurtosis_data,or_cD1_means_data,or_cD1_rms_data,or_cD1_skewness_data,or_cD1_std_data,or_cD1_var_data,Label3);
or_cD1_T=array2table(or_cD1_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
or_cA2_V=horzcat(or_cA2_kurtosis_data,or_cA2_means_data,or_cA2_rms_data,or_cA2_skewness_data,or_cA2_std_data,or_cA2_var_data,Label3);
or_cA2_T=array2table(or_cA2_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
or_cD2_V=horzcat(or_cD2_kurtosis_data,or_cD2_means_data,or_cD2_rms_data,or_cD2_skewness_data,or_cD2_std_data,or_cD2_var_data,Label3);
or_cD2_T=array2table(or_cD2_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
or_cA3_V=horzcat(or_cA3_kurtosis_data,or_cA3_means_data,or_cA3_rms_data,or_cA3_skewness_data,or_cA3_std_data,or_cA3_var_data,Label3);
or_cA3_T=array2table(or_cA3_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
or_cD3_V=horzcat(or_cD3_kurtosis_data,or_cD3_means_data,or_cD3_rms_data,or_cD3_skewness_data,or_cD3_std_data,or_cD3_var_data,Label3);
or_cD3_T=array2table(or_cD3_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
or_cA4_V=horzcat(or_cA4_kurtosis_data,or_cA4_means_data,or_cA4_rms_data,or_cA4_skewness_data,or_cA4_std_data,or_cA4_var_data,Label3);
or_cA4_T=array2table(or_cA4_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
or_cD4_V=horzcat(or_cD4_kurtosis_data,or_cD4_means_data,or_cD4_rms_data,or_cD4_skewness_data,or_cD4_std_data,or_cD4_var_data,Label3);
or_cD4_T=array2table(or_cD4_V, 'VariableNames', {'Kurtosis','Mean','RMS','Skewness','STD','Variance','Label'});
 
Table_or=vertcat(or_cA1_T,or_cA2_T,or_cA3_T,or_cA4_T,or_cD1_T,or_cD2_T,or_cD3_T,or_cD4_T);

%% Feature Table
Table_Feat=vertcat(Table,Table_ir,Table_or);

%% Train Data
Table_Train=vertcat(cA1_T(1:400,:),cA2_T(1:400,:),cA3_T(1:400,:),cA4_T(1:400,:),cD1_T(1:400,:),cD2_T(1:400,:),cD3_T(1:400,:),cD4_T(1:400,:),ir_cA1_T(1:200,:),ir_cA2_T(1:200,:),ir_cA3_T(1:200,:),ir_cA4_T(1:200,:),ir_cD1_T(1:200,:),ir_cD2_T(1:200,:),ir_cD3_T(1:200,:),ir_cD4_T(1:200,:),or_cA1_T(1:200,:),or_cA2_T(1:200,:),or_cA3_T(1:200,:),or_cA4_T(1:200,:),or_cD1_T(1:200,:),or_cD2_T(1:200,:),or_cD3_T(1:200,:),or_cD4_T(1:200,:));
%% Test Data
Table_Test=vertcat(cA1_T(401:end,:),cA2_T(401:end,:),cA3_T(401:end,:),cA4_T(401:end,:),cD1_T(401:end,:),cD2_T(401:end,:),cD3_T(401:end,:),cD4_T(401:end,:),ir_cA1_T(201:end,:),ir_cA2_T(201:end,:),ir_cA3_T(201:end,:),ir_cA4_T(201:end,:),ir_cD1_T(201:end,:),ir_cD2_T(201:end,:),ir_cD3_T(201:end,:),ir_cD4_T(201:end,:),or_cA1_T(201:end,:),or_cA2_T(201:end,:),or_cA3_T(201:end,:),or_cA4_T(201:end,:),or_cD1_T(201:end,:),or_cD2_T(201:end,:),or_cD3_T(201:end,:),or_cD4_T(201:end,:));