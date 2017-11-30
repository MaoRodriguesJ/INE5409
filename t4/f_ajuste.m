function a = f_ajuste(m, n, x, y)

    
    for i = 1 : n+1
        for j = 1 : n+1
            A(i,j) = 0;
            for k = 1 : m
                A(i,j) += x(k) ^ (i + j - 2);
            end
        end
        
        
        b(i) = 0;
        for k = 1 : m
            b(i) += (x(k) ^ (i - 1)) * y(k);
        end
        
        
    end

    a = A\transpose(b);
    

end