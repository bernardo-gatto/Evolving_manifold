% linear mutual subspace method (MSM.m) 
clear all;
close all;

ri=10; % dimensionality of input subspace
rd=10; % dimensionality of dictionaly subspace

nclass=30; % total number of classes
load('doubutsu.mat'); % load training and test data

ntrai=size(trai,2);
ntest=size(test,2);

% Aqui voce cria os subespacos de treino
% eigenvalue decomposition for each training dataset
for ii = 1 : ntrai
  [U,eig_val]=EVD(trai(ii).X);
  U=U(:,1:rd);
  trai(ii).U=U;
end

% Aqui voce cria os subespacos de teste
% eigenvalue decomposition for each test dataset
for ii = 1 : ntest
  [U,eig_val]=EVD(test(ii).X);
  U=U(:,1:ri);
  test(ii).U=U;
end

Gen = initial_gen(200);

max_iterations = 100; %100, 1000?
p = 5; % mutation probability

new_reports = [];

for ii_gen = 1:max_iterations
    
    [~, n] = size(Gen);
    
    F = compute_fitness(Gen, n);

    [S, m] = select_population_2(Gen, F, n);
    
    P = apply_crossover(S, m);
    
    %mutation
    P = apply_mutation(P, m, p);
    
    Gen = [S P];
    
    new_reports = [new_reports F];

end