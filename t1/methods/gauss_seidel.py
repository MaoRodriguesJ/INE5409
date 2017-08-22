import numpy as np

def f_gauss_seidel(l, criterio, x): # método iterativo
    # l = relaxacao
    # x = matriz com um chute para cada incógnita, por padrão tudo 0
    k = 0 # número de passos
    diff = 9999
    n = len(x)
    xdiff = np.zeros(n)

    while diff > criterio:
        x[0] = ((1-l)*x[0])+l*(1.5 - x[1])

        for i in range(1, int(n/2)):
            x[i] = ((1-l)*x[i])+l*((1 - x[i-1] - x[i+1] - x[i+25])/4)

        for i in range(int(n/2), n-1):
            x[i] = ((1-l)*x[i])+l*((2 - x[i-25] - x[i-1] - x[i+1])/5)

        x[n-1] = ((1-l)*x[n-1])+l*(3 - x[n-2])

        diff = max(abs(np.subtract(x, xdiff)))
        xdiff = np.copy(x)
        k += 1

    return (x, k)
