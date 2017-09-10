function f = linterp(x, y, prime)
    n = length(x);
    f = zeros(1, n);
    for i=1:n
        p = 1;
        b = 1;
        for j = 1:n
            if(j~=i)
                p = mconv(p, [1 -x(j)]);
                b = b*(x(i)-x(j));
            end
        end
        binv = modInv(b, prime);
        f = f+(y(i)*binv)*p;
        f = mod(f, prime);
    end
end