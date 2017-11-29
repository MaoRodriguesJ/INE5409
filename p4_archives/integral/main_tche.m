format long;

%É sempre de -1 a 1
m = 8;

GTm = f_gauss_tchebychev(m, "f0")
b0 = (1/pi) * GTm
b1 = (2/pi) * f_gauss_tchebychev(m, "f1")

%erroEx = abs(GTm - Iex)

erroEst = abs(GTm - f_gauss_tchebychev(2*m, "f0"))