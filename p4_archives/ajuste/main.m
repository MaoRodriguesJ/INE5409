format long

x = [1 1.1 1.3 1.5 1.7 1.9 2.1 2.4 2.8 3.1];
y = [8 7.5 6   5   4.5   4.5 5   5.9 6.9 7.8];
m = length(x)

xp = min(x) : 0.01 : max(x);

%interpolacao da muito problema

%n_interpolador = m-1;
%yal = f_polinomio_lagrange(n_interpolador, x, y, xp);

%Ajuste
printf("AJUSTE POLINOMIAL\n");

n_ajuste = 4
a = fAjuste(m, n_ajuste, x, y);

%O ponto eh minimo ou maximo se nao pudermos mexer de jeito nenhum em nenhum coeficiente
%a(1) = a(1) * 1.1;

%horner
yp = f_polinomio(n_ajuste, a, xp);

D2 = sum((f_polinomio(n_ajuste, a,x) .- y) .* (f_polinomio(n_ajuste, a,x) .- y))

R2 = 1 - sum((f_polinomio(n_ajuste, a,x) .- y).^2)/sum((mean(y).-y).^2)

%Ajuste nao polinomial
printf("AJUSTE NAO POLINOMIAL\n");
%G(x) = a(1) + a(2) * sin(x)


a = fAjusteSenoidal(m, x, y);
yp2 = a(1) .+ a(2) .* sin(xp);

D2 = sum((a(1) .+ a(2) .* sin(x) .- y) .* (a(1) .+ a(2) .* sin(x) .- y))

R2 = 1 - sum((a(1) .+ a(2) .* sin(x) .- y).^2)/sum((mean(y).-y).^2)

printf("AJUSTE SENO COSSENO\n");

a = fAjusteSinCos(m,x,y);
yp3 = a(1) .+  a(2) .* sin(xp) .+ a(3) .* cos(xp);

D2 = sum((a(1) .+ a(2) .* sin(x) .+ a(3) .* cos(x) .- y) .* (a(1) .+ a(2) .* sin(x) .+ a(3) .* cos(x) .- y))

printf("AJUSTE NAO LINEAR SENO\n");

ai = [1
      1
      1
      1];
      
a = fNewtonNnumFa(length(ai),ai);

yp4 = a(1) .+  a(2) .* sin(a(3) .+ a(4) .* xp);

D2 = sum((a(1) .+  a(2) .* sin(a(3) .+ a(4) .* x) .- y) .* (a(1) .+  a(2) .* sin(a(3) .+ a(4) .* x) .- y))

R2 = 1 - sum((a(1) .+  a(2) .* sin(a(3) .+ a(4) .* x) .- y).^2)/sum((mean(y).-y).^2)

printf("AJUSTE RACIONAL NAO LINEAR (NAO FUNCIONOU BEM)\n");

ai = [0.9
      1.516
      0.1];
      
a = fNewtonNnumFb(length(ai),ai)
yp5 = (a(1) .+ a(2) .* (xp .* xp))/ (1 .+ a(3) .* xp);

D2 = sum((((a(1) .+ a(2) .* (x .* x))/ (1 .+ a(3) .* x)) .- y) .* (((a(1) .+ a(2) .* (x .* x))/ (1 .+ a(3) .* x)) .- y))

R2 = 1 - sum((((a(1) .+ a(2) .* (x .* x))/ (1 .+ a(3) .* x)) .- y).^2)/sum((mean(y).-y).^2)
	 	  	  	  		     	   		  	 	
