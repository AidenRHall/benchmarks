p = int(ARGS[1])
ex = 10^p
println(ex)
s = 1 + 1

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
        s += 1
    end
    toc()
end
