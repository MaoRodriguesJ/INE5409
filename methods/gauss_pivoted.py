import numpy as np

def f_gauss_pivoted(A, b):
    
    n = len(A)
    if b.size != n:
        raise ValueError("Invalid argument: incompatible sizes between A & b.", b.size, n)
        
    for pivot_row in range(n-1):
        
        maxindex = abs(A[pivot_row][pivot_row:]).argmax() + pivot_row
        
        if A[maxindex][pivot_row] == 0:
            raise ValueError("Matrix is singular")
            
        if maxindex != pivot_row:
            A[[pivot_row, maxindex]] = A[[maxindex, pivot_row]]
            b[[pivot_row, maxindex]] = b[[maxindex, pivot_row]]
        
        for row in range(pivot_row+1, n):
            multiplier = A[row][pivot_row]/A[pivot_row][pivot_row]
            
            for col in range(n):
                A[row][col] = A[row][col] - multiplier*A[pivot_row][col]
                
            b[row] = b[row] - multiplier*b[pivot_row]
    
    x = np.zeros(n)
    k = n-1
    x[k] = b[k]/A[k][k]
    k = k-1
    while k >= 0:
        x[k] = (b[k] - np.dot(A[k][k+1:],x[k+1:]))/A[k][k]
        k = k-1
        
    return x
