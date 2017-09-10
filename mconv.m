function w = mconv(u,v)
% konvolucija dva polinoma
    prime = 251;
    m = length(u);
    n = length(v);
    wk = m + n -1;
    for k =1:wk
        w(k) = 0;
        j1 = max(1, k+1-n);
        j2 = min(k, m);
        for j=j1:j2
            w(k) = w(k) + u(j)*v(k+1-j);
            w(k) = mod(w(k), prime);
        end
    end
end