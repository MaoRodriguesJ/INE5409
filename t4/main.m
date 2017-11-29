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
  [gm, x_polinomio] = f_gauss_legendre(a, b, m);
  erro_aprox_gauss = abs(gm - f_gauss_legendre(a, b, m+1));
end
m
gm
erro_aprox_gauss
erro_exato_gauss = abs(gm - tn_exato)

disp(' ---------------------------------------------------------- ')
disp('8.6 d - Interpolador pelos X(i) de Gauss-Legendre')
y_polinomio = f_erf(x_polinomio);
coef = f_interpolador_polinomial(m-1, x, y_polinomio)

disp(' ---------------------------------------------------------- ')
disp('8.6 e - Integral do Polinômio Interpolador')
q = polyint(coef);
I = diff(polyval(q,[a b]))

disp(' ---------------------------------------------------------- ')
disp('8.6 f - Gráfico Exato e Aprox')
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

m_ln = 1;
erro_exato_gauss_ln = 1;
while erro_exato_gauss_ln > erro_max && m_ln < 10
  m_ln++;
  gm_ln = f_gauss_legendre_ln(a, b, m_ln);
  erro_exato_gauss_ln = abs(gm_ln - valor_exato);
end
disp('Limitado a m = 10')
% é possível continual usando composição de integrais mas gauss
% legendre não é adequado
m_ln
gm_ln
erro_exato_gauss_ln

m = 1;
erro_exato_tchebyschev = 1;
while erro_exato_tchebyschev > erro_max && m < 100
  m++;
  gtm = f_gauss_tchebychev(m, "f_ln2");
  erro_exato_tchebyschev = abs(gtm - valor_exato);
end
disp('Limitado a m = 100')
m
gtm
erro_exato_tchebyschev




