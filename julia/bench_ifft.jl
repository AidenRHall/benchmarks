p = int(ARGS[1])
ex = 10^p
r = rand(ex)
r = fft(r)

tic()
r = ifft(r)
toc()
