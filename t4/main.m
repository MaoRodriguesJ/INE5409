format long 

a = 0
b = 1

tn_exato = erf(b) - erf(a);
erroAprox = 1e-6;

disp(' ---------------------------------------------------------- ')
disp('8.6 a - Trapézios')
n = 1;
erro_aprox_trapezio = 1;
while erro_aprox_trapezio > erroAprox
  n++;
  tn = f_trapezios(a, b, n);
  erro_aprox_trapezio = abs(tn - f_trapezios(a, b, 2*n));
end
n
tn
erro_aprox_trapezio
erro_exato_trapezio = abs(tn - tn_exato)

disp(' ---------------------------------------------------------- ')
disp('8.6 b - Simpson')
n = 0;
erro_aprox_simpson = 1;
while erro_aprox_simpson > erroAprox
  n += 2;
  sn = f_simpson(a, b, n);
  erro_aprox_simpson = abs(sn - f_simpson(a, b, 2*n));
end
n
sn
erro_aprox_simpson
erro_exato_simpson = abs(sn - tn_exato)

disp(' ---------------------------------------------------------- ')
disp('8.6 c - Gauss-Legendre')
m = 1;
erro_aprox_gauss = 1;
while erro_aprox_gauss > erroAprox
  m++;
  [gm, x_polinomio] = f_gauss_legendre(a, b, m, "f_erf");
  erro_aprox_gauss = abs(gm - f_gauss_legendre(a, b, m+1, "f_erf"));
end
m
gm
erro_aprox_gauss
erro_exato_gauss = abs(gm - tn_exato)

disp(' ---------------------------------------------------------- ')
disp('8.6 d - Interpolador pelos X(i) de Gauss-Legendre')
y_polinomio = f_erf(x_polinomio);
coef = f_interpolador_polinomial(m-1, x_polinomio, y_polinomio)

disp(' ---------------------------------------------------------- ')
disp('8.6 e - Integral do Polinômio Interpolador')
q = polyint(coef);
I = diff(polyval(q,[a b]))

disp(' ---------------------------------------------------------- ')
disp('8.6 f - Gráfico Exato e Aprox')
disp('Retirar comentário do código')
np = 100;
xp = a : (b-a)/np : b;
y_exato = f_erf(xp);
y_aprox = f_horner(m-1, coef, xp);
%plot(xp, y_aprox, '--r', xp, y_exato, '.b');
%for i = 1 : length(y_polinomio)
%  hold on
%  plot(x_polinomio(i), y_polinomio(i), 'g*');
%end

disp(' ---------------------------------------------------------- ')
disp('8.7 - Gauss-Legendre e Tchebyschev')
% Como a função possui descontinuidade no ponto gauss-legendre não
% é tão adequado e como possui um fator peso sqrt((1-x)^2) gauss
% tchebyschev é mais adequado
valor_exato = -pi * log(2)
erro_max = 1e-7;

disp('-- Gauss-Legendre Limitado a m = 10 --')
% é possível continual usando composição de integrais mas gauss
% legendre não é adequado
a = -1
b = 1
m_ln = 1;
erro_exato_gauss_ln = 1;
while erro_exato_gauss_ln > erro_max && m_ln < 10
  m_ln++;
  [gm_ln, x] = f_gauss_legendre(a, b, m_ln, "f_ln");
  erro_exato_gauss_ln = abs(gm_ln - valor_exato);
end

m_ln
gm_ln
erro_exato_gauss_ln

disp('-- Tchebyschev Limitado a m = 100 --')
m = 1;
erro_exato_tchebyschev = 1;
while erro_exato_tchebyschev > erro_max && m < 100
  m++;
  gtm = f_gauss_tchebychev(m, "f_ln2");
  erro_exato_tchebyschev = abs(gtm - valor_exato);
end
m
gtm
erro_exato_tchebyschev
% tchebyschev também não é adequado e seria necessário um M muito grande
% para obter erro 10^-7

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