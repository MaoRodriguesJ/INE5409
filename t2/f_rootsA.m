%esse froots é apenas para questão A pois força um M=1
function X = f_rootsA(P)
    grau_n = length(P)-1;
    k = 1;
    
    n_original = grau_n;
    p_original = P;
    x_inicial(k) = 0;
    
    %extrair a raiz 0 de multitplicidade 3
    [X(k), M(k)] = f_newton(grau_n, P, x_inicial(k));
    [X(k), M(k)] = f_newton(n_original, p_original, X(k));
    [grau_n, P] = f_reducao(grau_n, P, X(k), M(k));
    
    while(grau_n > 0)
        k++;
        x_inicial(k) = f_localiza(grau_n, P);
        
        [X(k), M(k)] = f_newton(grau_n, P, x_inicial(k));
        M(k)=1;
        
        [X(k), M(k)] = f_newton(n_original, p_original, X(k));
        M(k)=1;
        
        [grau_n, P] = f_reducao(grau_n, P, X(k), M(k));
    end
end
        