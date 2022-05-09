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
  trai(ii).U=U;
end

% Aqui voce cria os subespacos de teste
% eigenvalue decomposition for each test dataset
for ii = 1 : ntest
  [U,eig_val]=EVD(test(ii).X);
  test(ii).U=U;
end

% linear mutual subspace method
sim=zeros(nclass,1);
% confusion matrix
CONF=zeros(nclass);
tic
for query = 1 : ntest
  U=test(query).U(:,1:ri);
  for jj = 1 : nclass
    V=trai(jj).U(:,1:rd);
    if ri<rd
      S=U'*V*V'*U;
    else
      S=V'*U*U'*V;
    end
    [eig_vec eig_val]=eig(S);
    %sim(jj) = max(diag(eig_val));
    sim(jj) = sim_avr(diag(eig_val), 5);
    confusion(query, jj) = max(diag(eig_val));
  end
  [value index]=max(sim);
  CONF(test(query).label,index)=CONF(test(query).label,index)+1;
end
finish=toc;
accuracy=(sum(diag(CONF))./ntest).*100;
fprintf(2,'ri=%d rd=%d accuracy=%3.1f %%\n',ri,rd,accuracy);
fprintf(2,'classification time per test dataset [s]: %f\n',finish./ntest);

imagesc(confusion)
