format long

% numero de pontos
np = 100;

% range
a = -1.;
b = +1.;

% calculo dos pontos e do y exato para estes pontos
xp = a : (b-a) / np : b;
y_exato = f(xp);


disp(' ---------------------------------------------------------- ')
disp('Interpolador Polinimial')

grau_n_interpolador = 15

% pontos de amarracao do interpolador polinomial
x_polinomio = a : (b-a) / grau_n_interpolador : b;
y_polinomio = f(x_polinomio);

% coeficientes do polinomio interpolador e y aproximado
coef_polinomio = f_interpolador_polinomial(grau_n_interpolador, x_polinomio, y_polinomio);
y_aprox_polinomio = f_horner(grau_n_interpolador, coef_polinomio, xp);

% erros para cada ponto e erro maximo
erro_polinomio = abs(y_aprox_polinomio .- y_exato);
disp('Erro Máximo Interpolador Polinimial e ponto X do erro')
[erromax_polinomio, index_p] = max(erro_polinomio);
erromax_polinomio
p_erromax_polinomio = xp(index_p)

% grafico do erro
% plot(xp, erro_polinomio, 'b');

% grafico exato em azul e aproximado em vermelho
% plot(xp, y_aprox_polinomio, '--r', xp, y_exato, '.b');

disp(' ---------------------------------------------------------- ')
disp('La Grange')

grau_n_lagrange = 11

% pontos de amarracao do interpolador pela base de la grange
x_lagrange = a : (b-a) / grau_n_lagrange : b;
y_lagrange = f(x_lagrange);

% y aproximado pelo interpolador utilizando a base de la grange
y_aprox_lagrange = f_lagrange(grau_n_lagrange, x_lagrange, y_lagrange, xp);

% erro interpolador por la grange
erro_lagrange = abs(y_aprox_lagrange .- y_exato);
disp('Erro Máximo La Grange e ponto X do erro')
[erromax_lagrange, index_l] = max(erro_lagrange);
erromax_lagrange
p_erromax_lagrange = xp(index_l)

% grafico do erro
% plot(xp, erro_lagrange, 'b');

% grafico exato em azul e aproximado em vermelho
% plot(xp, y_aprox_lagrange, '--r', xp, y_exato, '.b')

disp(' ---------------------------------------------------------- ')
disp('MacLaurin')

grau_n_maclaurin = 11

coef_maclaurin = transpose(f_maclaurin_p3(grau_n_maclaurin));

y_aprox_maclaurin = f_horner(grau_n_maclaurin, coef_maclaurin, xp);

% erro interpolador por serie de maclaurin
erro_maclaurin = abs(y_aprox_maclaurin .- y_exato);
disp('Erro Máximo MacLaurin e ponto X do erro')
[erromax_maclaurin, index_m] = max(erro_maclaurin);
erromax_maclaurin
p_erromax_maclaurin = xp(index_m)

% grafico do erro
% plot(xp, erro_maclaurin, 'b')

% grafico exato em azul e aproximado em vermelho
% plot(xp, y_aprox_maclaurin, '--r', xp, y_exato, '.b')

disp(' ---------------------------------------------------------- ')
disp('Tchebyschev')

grau_n_tchebyschev = 11 

coef_tchebyschev = f_coef_tchebyschev(grau_n_tchebyschev, a, b);

y_aprox_tchebyschev = f_tchebyschev(grau_n_tchebyschev, coef_tchebyschev, xp);

% erro interpolador por coeficientes de tchebyschev
erro_tchebyschev = abs(y_aprox_tchebyschev .- y_exato);
disp('Erro Máximo Tchebyschev e ponto X do erro')
[erromax_tchebyschev, index_t] = max(erro_tchebyschev);
erromax_tchebyschev
p_erromax_tchebyschev = xp(index_t)

% grafico do erro
% plot(xp, erro_tchebyschev, 'b')

% grafico exato em azul e aproximado em vermelho
% plot(xp, y_aproximado_tchebyschev, '--r', xp, y_exato, '.b')

disp(' ---------------------------------------------------------- ')
disp('Padé')

n_pade = 6
m_pade = 5

% grau para serie de maclaurin = n+m
coef_maclaurin_pade = f_maclaurin_p3(n_pade+m_pade);

% calcula coeficientes dos polinomios a/b da aproximacao de pade
[a_pade b_pade] = f_pade(n_pade, m_pade, coef_maclaurin_pade);

% utilizando horner com os pontos ajustados para [-1,1] nos coeficientes a/b
y_aproximado_pade = f_horner(n_pade, a_pade, xp) ./ f_horner(m_pade, b_pade, xp);

% erro interpolador por serie de maclaurin
erro_pade = abs(y_aproximado_pade .- y_exato);
disp('Erro Máximo Pade e ponto X do erro')
[erromax_pade, index_p] = max(erro_pade);
erromax_pade
p_erromax_pade = xp(index_p)

% grafico do erro
% plot(xp, erro_pade, 'b')

% grafico exato em azul e aproximado em vermelho
% plot(xp, y_aproximado_pade, '--r', xp, y_exato, '.b')