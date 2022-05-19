function [H, SCC] = Algorithm1(I1, Data_in1, G_obs)

G_obs = G_obs==1;
n = size(I1,2);
alpha = 0.005;
n_exp1 = size(I1,1);
H = false(n);
for i=1:n_exp1
    exp = I1(i,:);
    H(exp,:) =or(H(exp,:),Interventional_Descendants(Data_in1(:,:,i),exp,alpha));
end
H = and(H,G_obs);
SCC = conncomp(digraph(H));
end

function A = Interventional_Descendants(Data,exp,alpha)
n = size(Data,2);
ind = find(exp);
m = size(ind,2);
A = false(m,n);
for i=1:m
    X = ind(i);
    for Y=[1:(X-1) (X+1):n]
        if exp(Y)
            continue
        else
            A(i,Y) = ~CI_Test(1,2,[],Data(:,[X,Y]),alpha);
        end
    end
end
end