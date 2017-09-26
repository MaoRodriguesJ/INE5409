function M = f_multiplicidade(R, R_lim)
    M = 1;
    soma = abs(R(1)) + abs(R(2));
    while(soma < R_lim)
        M++;
        soma += abs(R(M+1));
    end
end
