function key = Shamir(fileName, k, N)
    key = 0;
    P = 251;
    I = imread(fileName);
    %I = rgb2gray(I);
    %supress to 250
    L = I > 250; 
    I(L) = 250;
    
    %add column if odd
    [rows, cols] = size(I);
    if(rem(cols, k) ~= 0)
        add = ceil(cols/k);
        add = k*add - cols;
        add = zeros(rows,add);
        I = [I,add];
        [rows, cols] = size(I);
    end
    
    [I, key] = scrambleMatrix(I);
    for i=1:N
        for j=1:rows
            p = 1;
           for q=1:k:(cols - k + 1)
               pol = double(I(j,q:q+k-1));
               S(j, p) = mod(polyval(pol,i),P);
               p = p + 1;
           end
        end
        name = strcat(num2str(i), fileName);
        S = uint8(S);
        imwrite(S,name);
        %imwrite(S,name, 'Mode', 'lossless');
    end

 
end