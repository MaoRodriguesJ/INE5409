function Y=Fa(a)

x = [1 1.1 1.3 1.5 1.7 1.9 2.1 2.4 2.8 3.1];
y = [8 7.5 6   5   4.5   4.5 5   5.9 6.9 7.8];
m = length(x);

%As quatro derivadas feitas a mão

Y(1)=0;
for k=1:m Y(1)=Y(1)+((a(1) + a(2) * sin(a(3) + a(4) * x(k)))-y(k)); end

Y(2)=0;
for k=1:m Y(2)=Y(2)+((a(1) + a(2) * sin(a(3) + a(4) * x(k)))-y(k)) * sin(a(3) + a(4)*x(k)); end

Y(3)=0;
for k=1:m Y(3)=Y(3)+((a(1) + a(2) * sin(a(3) + a(4) * x(k)))-y(k)) * cos(a(3) + a(4) * x(k)); end

Y(4)=0;
for k=1:m Y(4)=Y(4)+((a(1) + a(2) * sin(a(3) + a(4) * x(k)))-y(k)) * cos(a(3) + a(4) * x(k)) * x(k); end

end