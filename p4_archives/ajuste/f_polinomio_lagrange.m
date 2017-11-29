function yal = f_polinomio_lagrange(n, x,y, xp)
    for ip = 1 : length(xp)
        soma = 0;
        for i = 1 : n+1
            prd = 1;
            
            for j = 1 : n+1
                if j != i
                    prd *= (xp(ip) - x(j)) / (x(i) - x(j));
                end
            end
            
            soma += y(i) * prd;
        end
        yal(ip) = soma;
    end
end