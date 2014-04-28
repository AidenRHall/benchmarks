args = argv();
p = str2num(args{1});
ex = 10**p;
printf('%d\n', ex);
s = 1;

tic;
for i = 1:ex
    s = s + 1;
end
toc;
