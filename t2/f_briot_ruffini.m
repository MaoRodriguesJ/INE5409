function R = f_briot_ruffini(grau_n, P, x_inicial)
    saved_N = grau_n;
    
    for k = 1: saved_N
        b(1) = P(1);
        for i = 2: grau_n+1
            b(i) = P(i) + (x_inicial * b(i-1));
        end
        R(k) = b(grau_n+1);
        P = b(1:grau_n);
        grau_n--;
    end
    R(saved_N + 1) = 1;
end
