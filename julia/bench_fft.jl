p = int(ARGS[1])
ex = 10^p
println(ex)

r = rand(ex)

tic()
r = fft(r)
toc()
