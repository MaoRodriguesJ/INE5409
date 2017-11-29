function coef = f_interpolador_polinomial(n, x, y)
    A( i = 1 : n+1 , 1 ) = 1;
    
    for i = 1 : n+1
        for j = 2: n+1
            A(i, j) = A(i,j-1) * x(i);    
        end
    end
    
    b = transpose(y);
    coef = A\b;
end