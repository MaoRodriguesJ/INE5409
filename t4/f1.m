function Y = f1(a)
  
  x = [ 0.2  0.4  0.6  0.8  0.9  1.0];
  y = [0.04 0.14 0.30 0.45 0.61 0.69];
  m = length(x);
  
  Y(1) = 0;
  for k = 1 : m
    Y(1) += ((log(a(1) + (a(2)*x(k)*x(k)))) - y(k)) * (1/(a(1) + (a(2)*x(k)*x(k))));
  end
  
  Y(2) = 0;
  for k = 1 : m
    Y(2) += ((log(a(1) + (a(2)*x(k)*x(k)))) - y(k)) * ((x(k)*x(k))/(a(1) + (a(2)*x(k)*x(k))));;  
  end
  
end