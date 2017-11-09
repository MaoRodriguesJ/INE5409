format long

a = 1;
b = 6;
I_exato = log(1 + b) - log(1 + a)

printf("________________ Trapézios: ______________\n\n");

% n = 16138; % numero de trapezios estimado pela serie de taylor (superestimado)
n = 4000;

Tn = f_trapezios(a, b, n)
erro_exato = abs(Tn - I_exato)
erro_estimado = abs(Tn - f_trapezios(a, b, 2*n))

printf("\n________________ Simpson (Parábolas): ______________\n\n");

% n = 190; % numero de parabolas estimado pela serie de taylor (superestimado)
n = 80;

Sn = f_simpson(a, b, n)
erro_exato = abs(Sn - I_exato)
erro_estimado = abs(Sn - f_simpson(a, b, 2*n))