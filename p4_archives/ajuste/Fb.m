function Y=Fb(a)

x = [1 1.1 1.3 1.5 1.7 1.9 2.1 2.4 2.8 3.1];
y = [8 7.5 6   5   4.5   4.5 5   5.9 6.9 7.8];
m = length(x);

%As derivadas feitas a mão

Y(1)=0;
for k=1:m Y(1)=Y(1)+(((a(1) + a(2) * (x(k) * x(k)))/ (1 + a(3) * x(k))) - y(k))                 /(1 + a(3) * x(k)); end

Y(2)=0;
for k=1:m Y(2)=Y(2)+(((a(1) + a(2) * (x(k) * x(k)))/ (1 + a(3) * x(k))) - y(k)) * ((x(k) * x(k)) /(1 + a(3) * x(k))); end

Y(3)=0;
for k=1:m Y(3)=Y(3)+(((a(1) + a(2) * (x(k) * x(k)))/ (1 + a(3) * x(k))) - y(k)) * (((a(1) + a(2) * (x(k) * x(k))) * x(k)) / ((1+ a(3) * x(k)) * (1+ a(3) * x(k)))); end


end