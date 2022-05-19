function M = compute_S_max(G)

SCC = conncomp(digraph(G));
k = max(SCC);
l = zeros(1,k);
for i=1:k
    l(i) = sum(SCC==i);
end
M = max(l);
end