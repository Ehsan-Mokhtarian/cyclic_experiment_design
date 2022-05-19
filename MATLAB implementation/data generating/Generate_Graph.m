function G = Generate_Graph(graph_type,n,p,varargin)

if strcmp(graph_type, 'Erdos-Renyi')
    G = rand(n)<p;
    for i=1:n
        G(i,i) = false;
    end
elseif strcmp(graph_type, 'SBM')
    b = varargin{1};
    G = rand(n)<p;
    for i=1:n
        j = mod(i-1,b);
        G(i,[1:(i -j-1) i])=false;
    end
else
    G = [];
    disp('Error')
end

end

