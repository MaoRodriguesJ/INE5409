disp(' ---------------------------------------------------------- ')
disp('7.1 - Ajuste Direto')
x = [ 0.2  0.4  0.6  0.8  0.9  1.0];
y = [0.04 0.14 0.30 0.45 0.61 0.69];
disp('-- As equções podem ser encontradas no arquivo f1 --')
ai = [1
      1];
r = f_newton_f1(length(ai), ai);
disp('-- Parâmetros --')
a = r(1)
b = r(2)
disp('-- Desvio e R^2 --')
for i = 1 : length(x)
  d(i) = abs((log(r(1) + (r(2)*x(i)*x(i)))) - y(i));
end
d = transpose(d)
R2 = 1 - sum(((log(r(1) + (r(2).*x.*x))) .- y).^2)/sum((mean(y).-y).^2)

disp('-- Para visualizar o gráfico retire o comentário --')
% interpolador polinomial de grau 4
n = length(x)-1;
np = 100;
xp = min(x) : (max(x)-min(x))/np : max(x);
coef = f_interpolador_polinomial(n, x, y);
y_aprox_polinomial = f_horner(n, coef, xp);
y_aprox_ajuste = log(r(1) .+ (r(2).*xp.*xp));
%plot(xp, y_aprox_polinomial, '--r', xp, y_aprox_ajuste, '.b');
%for i = 1 : length(y)
%  hold on
%  plot(x(i), y(i), 'g*');
%end

disp(' ---------------------------------------------------------- ')
disp('7.6 - Ajuste Polinomial')
x = [13.9 37.0 67.8 79.0 85.5 93.1 99.2];
y = [1.04 1.18 1.29 1.35 1.28 1.21 1.06];
m = length(x);
np = 100;
xp = min(x) : (max(x)-min(x))/np : max(x);

coef_ajuste1 = f_ajuste(m, 1, x, y)
y_ajuste1 = f_horner(1, coef_ajuste1, xp);

coef_ajuste2 = f_ajuste(m, 2, x, y)
y_ajuste2 = f_horner(2, coef_ajuste2, xp);

coef_polinomio = f_interpolador_polinomial(length(x)-1, x, y)
y_ajuste_polinomio = f_horner(length(x)-1, coef_polinomio, xp);

%plot(xp, y_ajuste1, '--r', xp, y_ajuste2, '.b', xp, y_ajuste_polinomio, '-.-k');
%for i = 1 : length(y)
%  hold on
%  plot(x(i), y(i), 'g*');
%end

R2_ajuste1 = 1 - sum((f_horner(1, coef_ajuste1, x) .- y).^2)/sum((mean(y).-y).^2)
R2_ajuste2 = 1 - sum((f_horner(2, coef_ajuste2, x) .- y).^2)/sum((mean(y).-y).^2)
R2_ajuste_polinomio = 1 - sum((f_horner(length(x)-1, coef_polinomio, x) .- y).^2)/sum((mean(y).-y).^2)

disp('-- Conforme os gráficos o melhor é ajuste polinomial com grau 2 --')

disp(' ---------------------------------------------------------- ')
disp('7.7 - Ajuste Polinomial')