p = int(ARGS[1])
ex = 10^p
r = rand(ex)

println("FFT")
tic()
r = fft(r)
toc()

println("iFFT")
tic()
r = ifft(r)
toc()
