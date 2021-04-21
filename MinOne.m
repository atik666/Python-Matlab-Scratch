clear; clc; 
load('Table_Feat_Emd.mat');

Feat_array = table2array(Table_Feat);

csvwrite('Table_Feat_Emd.csv',Feat_array);