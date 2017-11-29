function tn = fSomaTrapezio(a, b, n)
    h = (b - a)/n;
    
    x = a : h : b;
    y = f(x);
    
    soma = 0;
    for i = 2 : n
        soma += y(i);
    end
    
    tn = 0.5 * h * (y(1) + (2 * soma) + y(n+1));
end