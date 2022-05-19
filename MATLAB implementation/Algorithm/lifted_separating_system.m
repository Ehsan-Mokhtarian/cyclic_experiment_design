function I2 = lifted_separating_system(SCC)
n = size(SCC,2);
k = max(SCC);
SCC_matrix = false(k,n);
for i=1:k
    SCC_matrix(i,:) = SCC==i;
end
l = sum(SCC_matrix,2);
M = max(l);
I2 = false(M,n);
for i=1:M
    for j=1:k
        if l(j)==1 || i>l(j)
            continue
        else
            I2(i, SCC_matrix(j,:)) = true;
            ind = find(SCC_matrix(j,:));
            I2(i,ind(i))=false;
        end
    end
end
end