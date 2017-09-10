function [I, key] = scrambleMatrix(I)
    [rows, cols] = size(I);
    key = rand()*1000;
    key = int32(key);
    rng('default');
    rng(key);
    index1   = randperm(cols);
    index2   = randperm(rows);
    I = I(index2,index1);
end