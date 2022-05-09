function P = apply_mutation(S, n, p)


    for ii = 1:n
        
        r = randi(100);
        
        if r >= p
        
            W = S{ii};
            
            [~, dim] = size(W);

            s = randi(dim);
            
            %s = floor()
            
            v = (W(:, s)) .* (randi(2)-0.5);
            W(:, s) = v;
            
            S{ii} = W;
        
        end
        
    end

    P = S;

end


