args = argv();
p = str2num(args{1});
ex = 10**p;
r = rand(ex, 1);

tic;
r = fft(r);
toc;
