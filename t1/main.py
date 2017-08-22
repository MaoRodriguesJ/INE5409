import numpy as np
from methods.gauss import f_gauss
from methods.residuo import f_residuo
from methods.convergencia import avalia_convergencia
from methods.gauss_seidel import f_gauss_seidel
from methods.coeficientes import matriz_coeficientes
    
if __name__ == "__main__":

    n = 50

    print("Letra A: \n")
    
    x = matriz_coeficientes(n) # retorna uma tupla com as matrizes A b

    # Letra A
    result = f_gauss(np.copy(x[0]), np.copy(x[1]))

    # Letra A.1
    print("Primeira: "+str(result[0])+" / Última: "+str(result[49])) 
    print("Resíduo Máximo: "+str(max(f_residuo(np.copy(x[0]), np.copy(x[1]), result))))

    # Letra A.2
    gauss_flops = ((4*n**3) + (9*n**2) - n - 6) / 6
    print("Número total de operações em ponto flutuante: "+str(gauss_flops))

    #Letra B
    print("\nLetra B: \n")

    #Letra B.1
    print("Dominante: "+("Sim" if avalia_convergencia(np.copy(x[0])) else "Não"))

    print("O sistema tem diagonal dominante, ou seja, convergência garantida.\n"+ 
          "As divisões por 4 e 5 em quase todas as linhas fazem o erro diminuir.\n"+
          "3/4 para i=2:n/2 e 3/5 para i=n/2+1:n-1.\n"+
          "Em outras palavras, a soma dos vizinhos da mesma linha é menor ou igual \n"+
          "que a diagonal principal em todas as linhas e menor em pelo menos uma.\n"+
          "Como tem convergência garantida pela diagonal dominante,\n"+
          "podemos usar um fator de sobre relaxação para acelerar o cálculo.\n")
    
    
    # Letra B.2
    criterio = 1e-4
    print("\nTeste 1, lambda=1")
    print("Iterações: "+str(f_gauss_seidel(1, criterio, np.zeros(n))[1]))

    print("Teste 2, lambda=1.1")
    iterative_result = (f_gauss_seidel(1.1, criterio, np.zeros(n)))
    print("Iterações: "+str(iterative_result[1]))

    print("Teste 2, lambda=1.2")
    print("Iterações: "+str(f_gauss_seidel(1.2, criterio, np.zeros(n))[1]))

    print("\nFator de relaxação 1.1 pois tem convergência garantida pela diagonal dominante,"+
          "\npodendo acelerar o cálculo.")

    # Letra B.3
    print("Primeira: "+str(iterative_result[0][0])+" / Última: "+str(iterative_result[0][49]))
    print("Resíduo Máximo: "+str(max(f_residuo(np.copy(x[0]), np.copy(x[1]), iterative_result[0]))))

    # Letra B.4
    gauss_seidel_flops = iterative_result[1]*(5 + ((n-2)*8) + 5 + n)
    print("Número total de operações em ponto flutuante: "+str(gauss_seidel_flops))

    # Letra B.5
    criterio_pow = criterio**2
    better_iterative_result = f_gauss_seidel(1.1, criterio_pow, np.copy(iterative_result[0]))   
    truncamento = max(abs(np.divide(np.subtract(iterative_result[0], better_iterative_result[0]), 
                          better_iterative_result[0])))

    print("Erro de truncamento: "+str(truncamento))
