%-------------------------------------------------------------------------%
%  Binary Particle Swarm Optimization (BPSO) source codes demo version    %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%

clc, clear, close 
% Benchmark data set contains 351 instances and 34 features (binary class)
load Emd_4.mat; % Matlab also provides this dataset (load Ionosphere.mat)
% Call features & labels
feat=normFun(table2array(Table_Feat(:, 1:end-1))); label=table2array(Table_Feat(:, end)); 
%---Input------------------------------------------------------------------
% feat:  feature vector (instances x features)
% label: labelling
% N:     Number of particles
% T:     Maximum number of iterations
% c1:    Cognitive factor
% c2:    Social factor
% Vmax:  Maximum velocity
% Wmax:  Maximum bound on inertia weight
% Wmin:  Minimum bound on inertia weight
% *Note: k-value of KNN & k-fold setting can be modified in jFitnessFunction.m
%---Output-----------------------------------------------------------------
% sFeat: Selected features (instances x features)
% Sf:    Selected feature index
% Nf:    Number of selected features
% curve: Convergence curve
%--------------------------------------------------------------------------

%% (Method 1) BPSO
N=90; T=200; c1=2; c2=2; Vmax=6; Wmax=0.9; Wmin=0.4; 
[sFeat,Sf,Nf,curve]=jBPSO(feat,label,N,T,c1,c2,Wmax,Wmin,Vmax); 

% Plot convergence curve
figure(); plot(1:T,curve); xlabel('Number of Iterations');
ylabel('Fitness Value'); title('BPSO'); grid on;






