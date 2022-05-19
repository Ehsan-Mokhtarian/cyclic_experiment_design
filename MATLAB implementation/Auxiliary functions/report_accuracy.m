function [] = report_accuracy(A,B,opt)

[~,~,SHD,~,~,F1_score] = learning_errors(A,B,opt);
fprintf('SHD: %d\nF1-score: %f\n\n',SHD,F1_score);
end

