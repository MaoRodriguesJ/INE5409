function a = fAjusteSenoidal(m, x, y)
    
    A(1,1) = m;
    A(1,2) = sum(sin(x));
    A(2,1) = A(1,2);
    A(2,2) = sum(sin(x) .* sin(x));

    b = [sum(y)
         sum(y .* sin(x))];
         
    a = A\b;

end