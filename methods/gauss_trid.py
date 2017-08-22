import numpy as np
from residuo_trid import f_residuo_trid

def f_gauss_trid(t, r, d, b):
    #Otimizado para matriz tridiagonal
    #TRID - r = diagonal
    #       t = antes da diagonal
    #       d = após a diagonal
    #       b = vetor resultado (igual gauss normal)
    
    n = len(t)
    x = np.zeros(n)
    
    for i in range(1,n):
        
        aux = t[i]/r[i-1]
        t[i] = 0
        r[i] -= aux*d[i-1]
        b[i] -= aux*b[i-1]
        
    k = n-1
    x[k] = b[k]/r[k]
    k -= 1
    while k >= 0:
        x[k] = (b[k] - (x[k+1]*d[k]))/r[k]
        k -= 1
    
    return x

if __name__ == "__main__":

    t = np.zeros(50)
    r = np.zeros(50)
    d = np.zeros(50)
    b = np.zeros(50)
    
    t[0] = np.nan
    r[0] = 1
    d[0] = -1
    b[0] = 1
    
    n = len(t)
    for i in range(1, n-1):
        t[i] = -1
        r[i] = 2
        d[i] = -1
        b[i] = 2
        
    t[n-1] = -1
    r[n-1] = -1
    d[n-1] = np.nan
    b[n-1] = 3
    
    result = f_gauss_trid(np.copy(t), np.copy(r), np.copy(d), np.copy(b))
    residuo = f_residuo_trid(np.copy(t), np.copy(r), np.copy(d), np.copy(b), result)
    print(result)
    print(residuo)
