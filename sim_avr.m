function result = sim_avr(M, k)

result = sum(M(1:k))/k;

w = [1, 0.8, 0.6, 0.4, 0.2];

%result = sum(w'.*M(1:k))/k;

end