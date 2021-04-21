function Filtered_data = simple_filter(data)

Fs = 128;  % Sampling Frequency

fcutlow=6;   %low cut frequency in Hz
fcuthigh=7;   %high cut frequency in Hz
order=5;
[b,a]=butter(order,[fcutlow,fcuthigh]/(Fs/2),'bandpass');
for i=1:1375
    gosh{i}=filter(b,a,data{i, 1});
end
Filtered_data=gosh';


