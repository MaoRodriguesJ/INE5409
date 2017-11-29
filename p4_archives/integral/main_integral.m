format long;
a = 1
b = 6
ordemErro = 1e-8
integExata = log(1 + b) - log(1 + a)

% Método dos Trapézios
printf("\nMetodo dos Trapezios\n");
% n calculado pelo resto da série de Taylor (erro máximo)
% h = sqrt(12e-8 / (0.25 * 6))
% n = floor((b - a)/h)
n = 4000
Tn = fSomaTrapezio(a, b, n)
erroExaTrapezio = abs(Tn - integExata)
erroEstTrapezio = abs(Tn - fSomaTrapezio(a, b, 2 * n))

% Método de Simpson
printf("\nMetodo de Simpson\n");
% n calculado pelo resto da série de Taylor (erro máximo)
% h = sqrt(sqrt(180e-8 / (0.75 * 5)));
% n = ceil((b - a)/h)
n = 80
Sn = fSomaSimpson(a, b, n)
erroExaSimpson = abs(Sn - integExata)
erroEstSimpson = abs(Sn - fSomaSimpson(a, b, 2 * n))

% Método de Gauss-Legendre
printf("\nMetodo de Gauss-Legendre\n");
m = 8
Gm = fSomaGauss(a, b, m)
erroExaGauss = abs(Gm - integExata)
erroEstGauss = abs(Gm - fSomaGauss(a, b, m+1))	 	  	  	  		     	   		  	 	
