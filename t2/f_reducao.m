function [grau_n, P] = f_reducao(grau_n, P, X, M)
    for j = 1: M
        b(1) = P(1);
        for i = 2: grau_n+1
            b(i) = P(i) + (X * b(i-1));
        end
        P = b;
        grau_n--;
    end
    aux = P(1: grau_n+1);
    P = aux;
end