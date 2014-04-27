p = int(ARGS[1])
ex = 10^p
println(ex)
s = 1

tic()
for i = 1:ex
    s += 1
end
toc()
