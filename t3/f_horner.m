% com os coeficientes retornar o valor de y para cada ponto xp
function y = f_horner(n, a, xp)
    
    for ip = 1: length(xp) 
        aux = a(n+1);
         for i = n : -1 : 1
            aux = a(i) + aux*xp(ip);
        end
        y(ip) = aux;
    end
    
end