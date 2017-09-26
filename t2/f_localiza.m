function x_inicial = f_localiza(grau_n, P)

    r_max = 1 + max(abs(P(2:grau_n+1))) / abs(P(1));
    r_min = 1/(1 + max(abs(P(1:grau_n))) / abs(P(grau_n+1)));
    
    r_medio = r_max+r_min/2;
    
    x_inicial = complex(r_medio*cos(pi/4), r_medio*sin(pi/4));
end
