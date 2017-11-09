% interpolador de la grange
function Yp = f_lagrange(n, x, y, xp)
    for k = 1: length(xp)
        Yp(k) = 0;
        for i = 1: n + 1
            aux = 1;
            for j = 1: n + 1
                if (j != i) aux = aux * (xp(k) - x(j))/(x(i) - x(j)); end
            end
            Yp(k) = Yp(k) + y(i)*aux;
        end
    end
end