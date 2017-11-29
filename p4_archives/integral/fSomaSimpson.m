function sn = fSomaSimpson(a, b, n)
    if mod(n, 2) != 0
        n++;
    end

    h = (b - a)/n;
    
    x = a : h : b;
    y = f(x);
    
    somapar = 0;
    for i = 2 : 2 : n
        somapar += y(i);
    end
    
    somaimpar = 0;
    for i = 3 : 2 : n
        somaimpar += y(i);
    end
    
    sn = (h/3) * (y(1) + (4 * somapar) + (2 * somaimpar) + y(n+1));
end