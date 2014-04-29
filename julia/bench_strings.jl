p = int(ARGS[1])
ex = 100*10^p
println(ex)

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
        int("69");
    end
    toc()
end
