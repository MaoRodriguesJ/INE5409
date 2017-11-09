function Sn = f_simpson(a, b, n)
    
    if mod(n, 2) != 0
        n++;
    end
    
    h = (b-a) / n ;
    x = a : h : b;
    y = f(x);
    
    somatorio_par = 0;
    for i = 2 : 2 : n
        somatorio_par += y(i);
    end
    
    somatorio_impar = 0;
    for i = 3 : 2 : n
        somatorio_impar += y(i);
    end
    somatorio = y(1) + 4*somatorio_par + 2*somatorio_impar + y(n+1);
    
    Sn = (h/3) * somatorio;
    
endfunction