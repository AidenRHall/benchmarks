args = argv();
p = str2num(args{1});
ex = 10**p;
printf('%d\n', ex);
r = rand(ex, 1);

fft(1:ex);
tic;
fft(r);
toc;
