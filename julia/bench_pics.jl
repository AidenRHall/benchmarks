using Images

p = int(ARGS[1]);
ex = 100*10^p;
println(ex);

# load functions
try
    tic();
    toq();
    toc();
end

w = data(imread(ARGS[2]))
round(real(ifft(fft(w))))

try
    tic();
    w = data(imread(ARGS[2]));
    round(real(ifft(fft(w))));
    toc();
end
