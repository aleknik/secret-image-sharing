function I = unscrambleMatrix(IMG, key)
    rng('default');
    rng(key);
    [x, y] = size(IMG);
    I = zeros(x,y);
    index1   = randperm(y);
    index2   = randperm(x);
    I(index2,index1) = IMG;
end