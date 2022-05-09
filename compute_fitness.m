function F = compute_fitness(R, n)

% clear all;
% close all;
% 
% load('optimal_OD.mat');
% 
% R{1} = O;
% R{2} = D;
% n = 2;

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

results = zeros(n, 1);

    for ii_eval=1:n

        W = R{ii_eval};

        % Project training subspaces
        for ii = 1 : ntrai
            U = trai(ii).U;
            P = W'*U;

            % Re-orthogonalize the subspaces
            P = P*P';
            [P,eig_val] = EVD(P);
            trai(ii).P=P;
        end

        % Project testing subspaces
        for ii = 1 : ntest
            U = test(ii).U;
            P = W'*U;

            % Re-orthogonalize the subspaces
            P = P*P';
            [P,eig_val] = EVD(P);
            test(ii).P=P;
        end

        % linear mutual subspace method
        sim=zeros(nclass,1);
        % confusion matrix
        CONF=zeros(nclass);
        tic
        for query = 1 : ntest
          U=test(query).P;%(:,1:ri);
          for jj = 1 : nclass
            V=trai(jj).P;%(:,1:rd);
            if ri<rd
              S=U'*V*V'*U;
            else
              S=V'*U*U'*V;
            end
            [eig_vec eig_val]=eig(S);
            %sim(jj) = max(diag(eig_val));
            sim(jj) = sim_avr(diag(eig_val), 3);
            confusion(query, jj) = max(diag(eig_val));
          end
          [value index]=max(sim);
          CONF(test(query).label,index)=CONF(test(query).label,index)+1;
        end
        finish=toc;
        accuracy=(sum(diag(CONF))./ntest).*100;
        %fprintf(2,'ii=%d, accuracy=%3.1f %%\n',ii_eval,accuracy);
        %fprintf(2,'classification time per test dataset [s]: %f\n',finish./ntest);

        results(ii_eval) = accuracy;

        %imagesc(confusion);%, pause(0.5);
        
        ii_eval
    end
    
   F = results;
    
end



