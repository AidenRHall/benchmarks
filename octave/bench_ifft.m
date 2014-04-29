args = argv();
p = str2num(args{1});
ex = 100*10**p;
printf('%d\n', ex)
r = rand(ex, 1);
r = fft(r);

ifft(r.+1);
tic;
ifft(r);
toc;
