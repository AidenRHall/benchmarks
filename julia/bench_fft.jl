p = int(ARGS[1])
ex = 10^p
println(ex)
fft([1])

# load functions
try
    tic();
    toq();
    toc();
end

r = rand(ex)

tic()
r = fft(r)
toc()
