function [D0,A,N_var] = Generate_observational_data(G,number_of_samples)

n=size(G,1);
N_var = diag(0.7 + 0.52*rand(1,n));
N = randn(number_of_samples,n)*N_var;
A = (1+0.5*rand(n)) .* ((-1).^(rand(n)>0.5));
A = G.*A;
D0 = N/(eye(n)-A);
end
