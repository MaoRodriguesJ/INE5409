import numpy as np

def avalia_convergencia(x):

    n = len(x)
    dominante = False
    for row in range(n):
        if x[row][row] < sum(x[row][0:row])+sum(x[row][row+1:n]):
            return False 
        if x[row][row] > sum(x[row][0:row])+sum(x[row][row+1:n]):
            dominante = True
        
    return dominante
