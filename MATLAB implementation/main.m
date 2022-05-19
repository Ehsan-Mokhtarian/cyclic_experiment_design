close all
clear
clc

addpath('Algorithm/')
addpath('Auxiliary functions/')
addpath('data generating/')

%% parameters

n = 50; % number of variables
b = 25; % size of blocks
p = 0.06; % probability of a directed edge
number_of_samples = 20000; % number of samples

%% generate graph and observational data

G_true = Generate_Graph("SBM", n, p, b); 
% G_true is the adjacency matrix of the true directed graph
[Data_ob, A, N_var] = Generate_observational_data(G_true, number_of_samples); 
% Data_ob: observational data
% A: coefficient matrix of the generative model
% N_var: variance matrix of the generative model

%% learn skeleton

G_obs = LearnG_obs(Data_ob);
% G_obs: Definition 1 in the paper

%% construct a colored separating system

[crn,color] = graph_color(G_obs); % colors G_obs
I1 = colored_separating_system(crn, color); % constructs a colored separating system

%% Generate interventional data: first stage

Data_in1 = Generate_interventional_data(A, N_var, I1, number_of_samples);

%% Algorithm 1

[H, SCC] = Algorithm1(I1, Data_in1, G_obs);

%% construct a lifted separating system

I2 = lifted_separating_system(SCC);

%% generate interventional data: second stage

Data_in2 = Generate_interventional_data(A,N_var,I2,number_of_samples);

%% Algorithm 2

G_learned = Algorithm2(H,SCC,I2,Data_in2);

%% Report output

disp('Maximum SCC size:')
fprintf('%d\n\n',compute_S_max(G_true));

disp('Learned graph:')
report_accuracy(G_true, G_learned, 'DG');

disp('Number of experiments:')
fprintf('Stage 1: %d \nStage 2: %d\nTotal: %d\n\n',...
    size(I1,1),size(I2,1),size(I1,1)+size(I2,1));
