import numpy as np

def matriz_coeficientes(n): # gera a matriz de coeficientes para ser utilizado no método direto
    x = np.zeros((n,n))
    b = np.zeros(n)
    x[0,0] = 1
    x[0,1] = 1
    b[0] = 1.5
    for i in range(1, int(n/2)):
        x[i,i] = 4
        x[i, i+25] = 1
        x[i, i+1] = 1
        x[i, i-1] = 1
        b[i] = 1
    
    for i in range(int(n/2), n-1):
        x[i,i] = 5
        x[i, i-25] = 1
        x[i, i+1] = 1
        x[i, i-1] = 1
        b[i] = 2

    x[n-1, n-1] = 1
    x[n-1, n-2] = 1
    b[n-1] = 3
    
    return (x, b)
