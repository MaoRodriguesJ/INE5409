% calculcar coeficientes de maclaurin para ln no range [a, b] com grau n
function a = f_maclaurin_ln(n, a, b)
    % f = ln(0.95t + 1.05)
    % f(t=0) = ln(1.05)
    aux1 = (b-a)/2; % 0.95
    aux2 = (b+a)/2; % 1.05
    a(1) = log(aux2);
    for i = 2 : n+1
        % derivada generica para ln(0.95t + 1.05)
        a(i) = (aux1^(i-1)*(-1)^i*(aux2)^(-(i-1)))/(i-1);
    end
end