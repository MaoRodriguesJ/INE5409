function [X, M] = f_newton(grau_n, P, x_inicial)
    diff = 1;
    k = 0;
    
    while(diff > 1e-12 && k < 120)
        k++;
        
        R = f_briot_ruffini(grau_n, P, x_inicial);
        M = f_multiplicidade(R, 0.1);
        delta_x = - R(M)/(M * R(M+1));
        X = x_inicial + delta_x;
        
        diff = abs(delta_x);
        x_inicial = X;
    end
end
