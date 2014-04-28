p = int(ARGS[1])
ex = 10^p
println(ex)
ifft(fft([1]))

# load functions into memory
try
    tic();
    toq();
    toc();
end

r = rand(ex)
r = fft(r)

tic()
r = ifft(r)
toc()
