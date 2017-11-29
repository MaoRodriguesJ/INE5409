function a = fAjusteSinCos(m, x, y)
    
    A(1,1) = m;
    A(1,2) = sum(sin(x));
    A(1,3) = sum(cos(x));
    A(2,1) = A(1,2);
    A(2,2) = sum(sin(x) .* sin(x));
    A(2,3) = sum(sin(x) .* cos(x));
    A(3,1) = A(1,3);
    A(3,2) = A(2,3);
    A(3,3) = sum(cos(x) .* cos(x));

    b = [sum(y)
         sum(y .* sin(x))
         sum(y .* cos(x))];
         
    a = A\b;

end