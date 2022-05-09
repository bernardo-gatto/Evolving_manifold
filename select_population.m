function [S, m] = select_population(P, F, n)

    jj = 0;
    
    sorted_F = sort(F);
    
    % [B,I] = sort(_) also returns a collection of index vectors for any of 
    % the previous syntaxes. I is the same size as A and describes the arrangement 
    % of the elements of A into B along the sorted dimension. For example, if A is a 
    % vector, then B = A(I).
    
    % [sorted_F, ii_sorted] = sort(F);
    
    cross_theshold = sorted_F(floor(n/2));

    for ii=1:n
       
        if F(ii) >= cross_theshold
            
            jj = jj + 1;           
            S{jj} = P{ii};
            
            %F(ii)

        end
    end
    
    m = jj;
    
    cross_theshold

end


