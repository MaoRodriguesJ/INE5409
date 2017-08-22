import numpy as np

def f_residuo_trid(t, r, d, b, x):
    
    n = len(t)
    residuo = np.zeros(n)
    residuo[0] = abs((r[0]*x[0]) + (d[0]*x[1]) - b[0])
    
    for i in range(1,n-1):
        residuo[i] = abs((t[i] * x[i-1]) + (r[i] * x[i]) + (d[i]*x[i+1]) - b[i])
    
    residuo[n-1] = abs((t[n-1]*x[n-2])+(r[n-1]*x[n-1]) - b[n-1])
    
    return max(residuo)
