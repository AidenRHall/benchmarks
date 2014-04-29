args = argv();
p = str2num(args{1});
ex = 100*(10**p);
h = 100/ex;
printf('%d\n', ex);
y = zeros(ex, 1);
gs = @(x, y) x*y;
y(1) = 1;

tic;
for x = 1:ex
    k1 = gs(x, y(x));
    k2 = gs(x + h/2, y(x) + k1/2);
    k3 = gs(x + h/2, y(x) + k2/2);
    k4 = gs(x + h, y(x) + k3);
    y(x + 1) = y(x) + h*(k1 + k2/2 + k3/2 + k4)/6;
end
toc;
