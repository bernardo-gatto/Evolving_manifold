function [S, m] = select_population_2(P, F, n)

    [sorted_F, ii_sorted] = sort(F);
    
    % [B,I] = sort(_) also returns a collection of index vectors for any of 
    % the previous syntaxes. I is the same size as A and describes the arrangement 
    % of the elements of A into B along the sorted dimension. For example, if A is a 
    % vector, then B = A(I).
    
    % [sorted_F, ii_sorted] = sort(F);
    
    cross_theshold = sorted_F(floor(n/2));

    for ii=1:100 % we just need 100 of them
       
        S{ii} = P{ii_sorted(200 - (ii - 1))};

    end
    
    m = 100;
    
    cross_theshold

end


