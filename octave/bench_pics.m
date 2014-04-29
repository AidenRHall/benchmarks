args = argv();
p = str2num(args{1});
ex = 100*10**p;
printf('%d\n', ex);
r = rand(ex, 1);

warning('off', '')

fft(1:ex);
tic;
w = imread(args{2});
round(real(ifft(fft(w))));
toc;
