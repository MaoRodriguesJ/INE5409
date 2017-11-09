function a = f_maclaurin_p3(grau_n)
    a(1) = 1;
    j = 0;
    % i = grau-1 em cada iteracao 
    for i = 2 : grau_n+1
        if (mod(i,2) == 0)
            a(i) = 0;
        else
            a(i) = (-1)^(i-j) / factorial(i-1);
            j++;
        end
    end
end