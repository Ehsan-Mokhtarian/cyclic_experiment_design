function H = Algorithm2(H, SCC, I2, Data_in2)

alpha = 0.01;
n_exp2 = size(I2,1);
k = max(SCC);
for i=1:n_exp2
    exp = I2(i,:);
    for j=1:k
        S_j = SCC ==j;
        l_j = sum(S_j);
        exp_j = and(S_j,exp);
        if l_j>1 && sum(exp_j)==(l_j-1)
            X = find(and(S_j,~exp_j));
            for Y= find(exp_j)
                if CI_Test(1,2,[],Data_in2(:,[X,Y],i),alpha)
                    H(Y,X)=false;
                end
            end
        end
        X_vec = find(and(S_j,~exp_j));
        for X=X_vec
            SS = and(H(:,X)', ~S_j); % search space: Anc_X \ S_j
            for Y = find(SS)
                S = SS;
                S(Y)=false;
                if CI_Test(X,Y,find(S),Data_in2(:,:,i),alpha)
                    H(Y,X)=false;
                end
            end
        end
    end
end
end
