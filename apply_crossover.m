function P = apply_crossover(S, n)

% clear all;
% close all;

    for ii = 1:2:n
        
        s1 = randi(n);
        s2 = randi(n);
        
        A = S(s1);
        B = S(s2);

        [~, dim] = size(A);

        r = randi(dim) - 1;

        P1 = [A(:, 1:r) B(:, r+1:end)];
        P2 = [B(:, 1:r) A(:, r+1:end)];
        
        P(ii) = P1;
        P(ii + 1) = P2;
        
    end


% max = n/2;
% 
% for ii = 1 : max
%     
%     r1 = randi(n);
%     r2 = randi(n);
%     
%     A = S(r1);
%     B = S(r2);
%     
%     [~, dim] = size(A);
%     
%     r = randi(dim);
%     
%     P1 = [A(:, 1:r) B(:, r+1:end)];
%     P2 = [B(:, 1:r) A(:, r+1:end)];
%     
% end

    

end


