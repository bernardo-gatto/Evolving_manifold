function P = initial_gen(n)

% clear all;
% close all;

    load('optimal_OD.mat');
    
    P{1} = O;
    P{2} = D;
    
    P{3} = [O D];
    P{4} = [D O];
    
    R = 70; % dropar 0 - 70 colunar
    
    
    for ii = 5:4:n % nao mudar
        
        % selecionar um dos 4
        % perform dropout
        
        R1 = randi(R+1) - 1;
        R2 = randi(R+1) - 1;
        R3 = randi(R+1) - 1; % dropout 50%
        R4 = randi(R+1) - 1; % dropout 50%
    
        aux_O = O(:,1 + R1:end - R2);
        aux_D = D(:,1 + R3:end - R4);
        
        P4 = [D(:,1 + R1:end - R2) O(:,1 + R3:end - R4) ];
        
        P{ii} = aux_O;
        P{ii + 1} = aux_D;
        P{ii + 2} = [aux_O aux_D];
        P{ii + 3} = P4;
        
    end
    
    %return P;
end


