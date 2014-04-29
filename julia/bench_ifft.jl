p = int(ARGS[1]);
ex = 100*10^p;
println(ex);

r = rand(ex);
r = fft(r);

# load functions into memory
ifft(fft([1]));
try
    tic();
    toq();
    toc();
end

try
    ifft(r + 1);
    tic();
    ifft(r);
    toc();
end
