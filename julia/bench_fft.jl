p = int(ARGS[1]);
ex = 10^p;
println(ex);

r = rand(ex);

# load functions
try
    tic();
    toq();
    toc();
end

fft(r + 1);
try
    tic();
    r = fft(r);
    toc();
end
