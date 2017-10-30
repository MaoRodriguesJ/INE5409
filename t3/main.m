format long

% range [a, b]
a = 0.1;
b = 2.0;

% numero de pontos para o plot
np = 100;

% grau n do interpolador polinomial utilizando a base de la grange
disp(' ---------------------------------------------------------- ')
disp('Lagrange')
disp('Grau')
n_lagrange = 42

% definir pontos no qual o polinomio deve ser amarrado
x_polinomio = a : (b-a) / n_lagrange : b;
y_polinomio = log(x_polinomio);

xp = a : (b-a) / np : b;
y_exato = log(xp);

% y aproximado pelo interpolador utilizando a base de la grange
y_aproximado_lagrange = f_lagrange(n_lagrange, x_polinomio, y_polinomio, xp);

% erro interpolador por la grange
erro_lagrange = abs(y_aproximado_lagrange .- y_exato);
disp('Erro Máximo La Grange')
erromax_lagrange = max(erro_lagrange)

% grafico do erro
% plot(xp, erro_lagrange, 'b')

% grafico exato em azul e aproximado em vermelho
% plot(xp, y_aproximado_lagrange, '--r', xp, y_exato, '-.b')

disp(' ---------------------------------------------------------- ')
disp('MacLaurin')

% o interpolador polinomial nao precisa estar no range [-1, 1]
% mas os proximos interpoladores sim, mudanca de base -> ((b-a)*t + (b+a)) / 2
% f(x(t)) = 0.95t + 1.05 para ln de [0.1, 2] -> [-1, 1]

% grau n do interpolador por serie de maclaurin
disp('Grau')
n_maclaurin = 107

% calculo dos coeficientes da série (derivando ln(0.95t + 1.05))
coef_maclaurin = f_maclaurin_ln(n_maclaurin);

% ajustanto os pontos para o range [-1, 1]
tp = (2 .* xp .- (b .+ a))/(b .- a);

% aplicando horner para obter os y aproximados nos pontos xp ajudatados para [-1,1]
y_aproximado_maclaurin = f_horner(n_maclaurin, coef_maclaurin, tp);

% erro interpolador por serie de maclaurin
erro_maclaurin = abs(y_aproximado_maclaurin .- y_exato);
disp('Erro Máximo MacLaurin')
erromax_maclaurin = max(erro_maclaurin)

% grafico do erro
% plot(xp, erro_maclaurin, 'b')

% grafico exato em azul e aproximado em vermelho
% plot(xp_polinomio, y_aproximado_maclaurin, '--r', xp_polinomio, y_exato, '-.b')

disp(' ---------------------------------------------------------- ')
disp('Tchebyschev')

% grau n do interpolador por tchebyschev
disp('Grau')
n_tchebyschev = 25 

b_tchebyschev = f_coef_tchebyschev(n_tchebyschev, a, b);

y_aproximado_tchebyschev = f_tchebyschev(n_tchebyschev, b_tchebyschev, tp);

% erro interpolador por coeficientes de tchebyschev
erro_tchebyschev = abs(y_aproximado_tchebyschev .- y_exato);
disp('Erro Máximo Tchebyschev')
erromax_tchebyschev = max(erro_tchebyschev)

% grafico do erro
% plot(xp, erro_tchebyschev, 'b')

% grafico exato em azul e aproximado em vermelho
% plot(xp, y_aproximado_tchebyschev, '--r', xp, y_exato, '-.b')

disp(' ---------------------------------------------------------- ')
disp('Padé')

% grau n do interpolador por serie de maclaurin
disp('Grau Numerador')
n_pade = 11

disp('Grau Denominador')
m_pade = 11

% grau para serie de maclaurin = n+m
coef_maclaurin_pade = f_maclaurin_ln(n_pade+m_pade);

% calcula coeficientes dos polinomios a/b da aproximacao de pade
[a_pade b_pade] = f_pade(n_pade, m_pade, coef_maclaurin_pade);

% utilizando horner com os pontos ajustados para [-1,1] nos coeficientes a/b
y_aproximado_pade = f_horner(n_pade, a_pade, tp) ./ f_horner(m_pade, b_pade, tp);

% erro interpolador por serie de maclaurin
erro_pade = abs(y_aproximado_pade .- y_exato);
disp('Erro Máximo Pade')
erromax_pade = max(erro_pade)

% grafico do erro
% plot(xp, erro_pade, 'b')

% grafico exato em azul e aproximado em vermelho
% plot(xp, y_aproximado_pade, '--r', xp, y_exato, '-.b')
