function [extra_edges,missing_edges,SHD,precision,recall,F1_score] ...
    = learning_errors(A,B,opt)
% A: the true graph
% B: the learned graph
% opt: skeleton or DG
if strcmp(opt, 'skeleton')
    A = (A+A')>0;
    B = (B+B')>0;
    diff = B-A;
    extra_edges = nnz(diff>0)/2;
    missing_edges = nnz(diff<0)/2;
elseif strcmp(opt, 'DG')
    A = A>0;
    B = B>0;
    diff = B-A;
    extra_edges = nnz(diff>0);
    missing_edges = nnz(diff<0);
else
    disp('error')
end
SHD = extra_edges + missing_edges;
precision = nnz(A.*B)/nnz(B);
recall = nnz(A.*B)/nnz(A);
F1_score = 2*precision*recall/(precision+recall);
end


