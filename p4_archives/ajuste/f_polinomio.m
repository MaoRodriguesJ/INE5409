function yp = f_polinomio(n, coefs, x)
    %Pn(xi)=a(1)+a(2)*x+a(3)*x^2+...+a(n)*x^(n-1)+a(n+1)*x^n
    %Pn(xi)=a(1)+x*(a(2)+x*(a(3)+...+x*(a(n)+x*a(n+1))...))% HORNER  (ordem crescente de grau)

    for i = 1 : length(x)
        aux = coefs(n+1);
        for j = n : -1 : 1 
            aux = coefs(j) + aux * x(i); 
        end
        yp(i) = aux;
    end

end