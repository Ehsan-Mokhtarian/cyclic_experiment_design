function H = LearnG_obs(D)

n = size(D,2);
alpha = 0.01;
alpha_Mb = 2/(n^2);
H = zeros(n);
V = ones(1,n);
Mb_init = ComputeMb_TC(V,D,alpha_Mb);
Mb = Mb_init;
for i=1:n
    if sum(diag(H))>0
        disp('error')
    end
    X = FindRemovable(V,Mb,D,alpha);
    N_X = FindNeighborhood(X,Mb(X,:),D,alpha);
    V(X) = 0;
    H(X,N_X==1) = 1;
    H(N_X==1,X) = 1;
    Mb = ComputeMb_TC(V,D,alpha_Mb).*Mb_init;
end
end

%**************************************************************************
%************************* Main Functions *********************************
%**************************************************************************

function X = FindRemovable(V,Mb,D,alpha)
Mbs = sum(Mb);
[~,ind] = sort(Mbs);
ind = ind(V(ind)>0);
for XX=ind
    Mb_XX = find(Mb(XX,:));
    isR = isRemovable(XX,Mb_XX,D,alpha);
    if isR
        X = XX;
        return
    end
end
X = ind(1);
end

function isR = isRemovable(X,Mb_X,D,alpha)

isR = true;
mbs = length(Mb_X);
for j =1:(mbs-1)
    Y = Mb_X(j);
    for k = (j+1):mbs
        Z = Mb_X(k);
        S = [X, Mb_X([1:(j-1), (j+1):(k-1), (k+1:mbs)])];
        CI = CI_Test(Y,Z,S,D,alpha);
        if CI
            isR = false;
            return
        end
    end
end
end

function N_X = FindNeighborhood(X,Mb_X,D,alpha)
N_X = Mb_X;
Mbx = find(Mb_X);
Mbs = length(Mbx);
for i=1:(Mbs)
    Y = Mbx(i);
    for  j= [1:(i-1),(i+1):Mbs]
        Z=Mbx(j);
        S=mysetdiff(Mbx,[Y;Z]);
        if CI_Test(X,Y,S,D,alpha)
            N_X(Y)=0;
            break
        end
    end
end

end

function Mb = ComputeMb_TC(V,D,alpha)
ind_V = find(V);
n = size(D,2);
Mb = zeros(n);
num_of_samples = size(D,1);
DD = D(:,V==1);
nn = sum(V);

c = norminv(1-alpha/2);
R =  corrcoef(DD);
P = inv(R);
thresh = c/sqrt(num_of_samples-nn-1);
for i=1:nn
    for j=[1:(i-1) (i+1):nn]
        Mb(ind_V(i),ind_V(j)) = abs(P(i,j)/sqrt(P(i,i)*P(j,j)))>thresh;
    end
end

end


%**************************************************************************
%************************* Minor Functions ********************************
%**************************************************************************

function C = mysetdiff(A,B)
if isempty(A)
    C = [];
    return;
elseif isempty(B)
    C = A;
    return;
else
    bits = zeros(1, max(max(A), max(B)));
    bits(A) = 1;
    bits(B) = 0;
    C = A(logical(bits(A)));
end
end
