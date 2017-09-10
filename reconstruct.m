function I = reconstruct(Ss, X, key)
    prime = 251;
    k = length(Ss);
    S = imread(Ss{1});
    
    for i=2:k
       S(:,:,:,i) = imread(Ss{i});
    end
    [rows, cols] = size(S(:,:,:,1));
    
    I = zeros(rows, cols*k);
    x = zeros(length(X));
    for i=1:rows
       for j=1:cols
           for y=1:k
               x(y) = single(S(i, j, y));
           end

          pol = linterp(X, x, prime);

          for q=1:k
              I(i,(j-1)*k + q) = pol(q);
          end
       end
    end
    I = unscrambleMatrix(I, key);

    I = uint8(I);
end