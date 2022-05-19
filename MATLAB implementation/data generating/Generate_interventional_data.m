function D1 = Generate_interventional_data(A,N_var,I,number_of_samples)
[n_exp, n] = size(I);
D1 = zeros(number_of_samples,n,n_exp);
for i=1:n_exp
    N = randn(number_of_samples,n)*N_var;
    AA = A; % intervened coefficient matrix
    AA(:,I(i,:))=0;
    D1(:,:,i) = N/(eye(n)-AA);
end
end