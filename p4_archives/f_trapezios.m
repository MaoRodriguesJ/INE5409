function Tn = f_trapezios(a,b,n)
    
    h = (b-a) / n ;
    x = a : h : b;
    y = f(x);
    
    somatorio = 0;
    for i = 2 : n
        somatorio += y(i);
    end
    
    somatorio *= 2;
    
    somatorio += y(1);
    somatorio += y(n+1);
    
    Tn = h*0.5*somatorio;
    
endfunction