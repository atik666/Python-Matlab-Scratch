clear;clc;

Fs= 5000; %Sampling frequency
rpm=1200;        %rotor speed in rpm
speed=rpm/60;      %speed in Hz
data_cycle=3*Fs/speed;         %number of data/cycle

%% Baseline Condition
total_sample=load('Baseline_3.csv');   %total sample data
sample_duration=length(total_sample)/Fs;  %sampling duration
L=floor(length(total_sample)/(data_cycle));  %number of total datasets

k=1;
for i=1:L
    E=total_sample(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [psd{i,1}]=pwelch(E);   %psd of the signal
    base_Energy{i,1} = sum(abs(E).^2);
end

for i=1:length(psd)
    psd_rms_data(i,1)=rms(psd{i,1});
    psd_var_data(i,1)=var(psd{i,1});
    psd_means_data(i,1)=mean(psd{i,1});
    psd_std_data(i,1)=std(psd{i,1});
    psd_kurtosis_data(i,1)=kurtosis(psd{i,1});
    psd_skewness_data(i,1)=skewness(psd{i,1});
    psd_peaks_data(i,1)= max(psd{i,1});
    psd_crestFactor_data(i,1)= max(psd{i,1})/rms(psd{i,1});
    psd_snr_data(i,1)= snr(psd{i,1});
    psd_entropy_data(i,1)=entropy(psd{i,1});
end

base_Energy=cell2mat(base_Energy);
Label1=ones(floor(L),1);
base_psd_V=horzcat(psd_rms_data,psd_var_data,psd_means_data,psd_std_data,psd_kurtosis_data,psd_skewness_data,psd_peaks_data, psd_crestFactor_data, psd_snr_data, psd_entropy_data,base_Energy,Label1);
base_psd_T=array2table(base_psd_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Peak','CrestFactor','SNR','Entropy','Energy','Label'});

%% Rubbing Condition
total_sample_R=load('Rub_3.csv');   %total sample data

k = 1;
for i=1:L
    E=total_sample_R(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [R_psd{i,1}]=pwelch(E);   %psd of the signal
    R_Energy{i,1} = sum(abs(E).^2);
end
for i=1:length(R_psd)
    R_psd_rms_data(i,1)=rms(R_psd{i,1});
    R_psd_var_data(i,1)=var(R_psd{i,1});
    R_psd_means_data(i,1)=mean(R_psd{i,1});
    R_psd_std_data(i,1)=std(R_psd{i,1});
    R_psd_kurtosis_data(i,1)=kurtosis(R_psd{i,1});
    R_psd_skewness_data(i,1)=skewness(R_psd{i,1});
    R_psd_peaks_data(i,1)= max(psd{i,1});
    R_psd_crestFactor_data(i,1)= max(R_psd{i,1})/rms(R_psd{i,1});
    R_psd_snr_data(i,1)= snr(R_psd{i,1});
    R_psd_entropy_data(i,1)=entropy(R_psd{i,1});
 
end
R_Energy=cell2mat(R_Energy);
Label2=2*ones(L,1);
R_psd_V=horzcat(R_psd_rms_data,R_psd_var_data,R_psd_means_data,R_psd_std_data,R_psd_kurtosis_data,R_psd_skewness_data, R_psd_peaks_data, R_psd_crestFactor_data, R_psd_snr_data, R_psd_entropy_data, R_Energy,Label2);
R_psd_T=array2table(R_psd_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Peak','CrestFactor','SNR','Entropy','Energy','Label'});

%% 0.014" Inner Race Fault
total_sample_L = load('Loss_3.csv'); 

k=1;
for i=1:L
    E=total_sample_L(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [L_psd{i,1}]=pwelch(E);   %psd of the signal
    L_Energy{i,1} = sum(abs(E).^2);
end
for i=1:length(L_psd)
    L_psd_rms_data(i,1)=rms(L_psd{i,1});
    L_psd_var_data(i,1)=var(L_psd{i,1});
    L_psd_means_data(i,1)=mean(L_psd{i,1});
    L_psd_std_data(i,1)=std(L_psd{i,1});
    L_psd_kurtosis_data(i,1)=kurtosis(L_psd{i,1});
    L_psd_skewness_data(i,1)=skewness(L_psd{i,1});
    L_psd_peaks_data(i,1)= max(psd{i,1});
    L_psd_crestFactor_data(i,1)= max(L_psd{i,1})/rms(L_psd{i,1});
    L_psd_snr_data(i,1)= snr(L_psd{i,1});
    L_psd_entropy_data(i,1)=entropy(L_psd{i,1});
end
L_Energy=cell2mat(L_Energy);
Label3=3*ones(L,1);
L_psd_V=horzcat(L_psd_rms_data,L_psd_var_data,L_psd_means_data,L_psd_std_data,L_psd_kurtosis_data,L_psd_skewness_data, L_psd_peaks_data, L_psd_crestFactor_data, L_psd_snr_data, L_psd_entropy_data, L_Energy,Label3);
L_psd_T=array2table(L_psd_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Peak','CrestFactor','SNR','Entropy','Energy','Label'});

%% 0.021" Inner Race Fault
total_sample_T = load('Twist_3.csv');

k=1;
for i=1:L
    E=total_sample_T(k:k+floor(data_cycle)-1);
    k=k+floor(data_cycle);
    [T_psd{i,1}]=pwelch(E);   %psd of the signal
    T_Energy{i,1} = sum(abs(E).^2);
end
for i=1:length(T_psd)
    T_psd_rms_data(i,1)=rms(T_psd{i,1});
    T_psd_var_data(i,1)=var(T_psd{i,1});
    T_psd_means_data(i,1)=mean(T_psd{i,1});
    T_psd_std_data(i,1)=std(T_psd{i,1});
    T_psd_kurtosis_data(i,1)=kurtosis(T_psd{i,1});
    T_psd_skewness_data(i,1)=skewness(T_psd{i,1});
    T_psd_peaks_data(i,1)= max(psd{i,1});
    T_psd_crestFactor_data(i,1)= max(T_psd{i,1})/rms(T_psd{i,1});
    T_psd_snr_data(i,1)= snr(T_psd{i,1});
    T_psd_entropy_data(i,1)=entropy(T_psd{i,1});
end
T_Energy=cell2mat(T_Energy);
Label4=4*ones(L,1);
T_psd_V=horzcat(T_psd_rms_data,T_psd_var_data,T_psd_means_data,T_psd_std_data,T_psd_kurtosis_data,T_psd_skewness_data, T_psd_peaks_data, T_psd_crestFactor_data, T_psd_snr_data, T_psd_entropy_data, T_Energy,Label4);
T_psd_T=array2table(T_psd_V, 'VariableNames', {'RMS','Variance','Mean','STD','Kurtosis','Skewness','Peak','CrestFactor','SNR','Entropy','Energy','Label'});

%% Feature Table
Table_Feat=vertcat(base_psd_T, R_psd_T, L_psd_T, T_psd_T);

%% Feature Array
Table_Array = vertcat(base_psd_V, R_psd_V, L_psd_V, T_psd_V);