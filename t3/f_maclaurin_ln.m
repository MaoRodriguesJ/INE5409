% calculcar coeficientes de maclaurin para ln no range [a, b] com grau n
function a = f_maclaurin_ln(n)
    % f = ln(0.95t + 1.05)
    % f(t=0) = ln(1.05)
    a(1) = log(1.05);
    for i = 2 : n+1
        % derivada generica para ln(0.95t + 1.05)
        a(i) = (0.95^(i-1)*(-1)^i*(1.05)^(-(i-1)))/(i-1);
    end
end