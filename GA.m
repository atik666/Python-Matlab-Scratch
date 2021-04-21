clear;clc; close all;

%% Problem Defination 

%CostFunction = @MinOne; 
problem.CostFunction = @(x) MinOne(x);

problem.nVar = 10;


%% GA Parameters

params.MaxIt = 100;
params.nPop = 20;

params.pC = 1;
params.mu = 0.1;   
%% Run GA

out = RunGA(problem, params);

%% Results



