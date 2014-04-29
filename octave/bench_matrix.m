args = argv();
p = str2num(args{1});
n = str2num(args{2});
ex = 100*10**p;
printf('%d\n', ex);

A = rand(n);
B = rand(n);

tic;
for i = 1:ex
    A*B;
end
toc;
