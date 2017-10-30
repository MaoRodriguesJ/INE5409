function a = f_maclaurin_p3(grau_n)
    a(1) = 0;
    if (grau_n > 1) a(2) = 1; 
    j = 3;
    for i = 3 : grau_n+1
        if (mod(i,2) == 0)
            n = i-j;
            a(i) = (-1)^(n) / (factorial(n)*((2*n)+1));
            j++;
        else
            a(i) = 0;
        end
    end
end