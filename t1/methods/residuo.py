import numpy as np
    
def f_residuo(A, b, x): # cálculo do resíduo
    
    n = len(A)
    r = np.zeros(n)
    
    for i in range(n):
        r[i] = abs(sum(A[i]*x)-b[i])
        
    return r