p = int(ARGS[1])
n = int(ARGS[2])
ex = 100*10^p
println(ex)

A = rand(n, n)
B = rand(n, n)

# load functions
try
    tic();
    toq();
    toc();
end

# put tic and toc in try to deal with the
# associated overhead, which is significant
try
    tic()
    for i = 1:ex
        A*B
    end
    toq()

    tic()
    for i = 1:ex
        B*A
    end
    toc()
end
