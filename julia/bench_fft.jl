p = int(ARGS[1])
ex = 10^p
r = rand(ex)

tic()
r = fft(r)
toc()
