p = int(ARGS[1]);
ex = 10^p;
println(ex);
y = [0 for i = 1:ex + 1];
f(x, y) = ;

# load functions
try
    tic();
    toq();
    toc();
end

# put tic and toc in try to deal with the
# associated overhead, which is significant
try
    tic();
    for x = 1:ex
        k1 = h*f(x, y[x]);
        k2 = h*f(x + h/2, y[x] + k1/2);
        k3 = h*f(x + h/2, y[x] + k2/2);
        k4 = h*f(x + h, y[x] + k3);
        y[x + 1] = (k1 + k2/2 + k3/2 + k4)/6;
    end
    toc();
end
