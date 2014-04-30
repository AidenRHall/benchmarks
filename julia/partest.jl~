function partest(n)
        include("kgsolv.jl")
        include("tumour.jl")
        include("kgsolvpar.jl")
        if n == 0
                println("Creating 3 1000x1000 matrices...")
                println("Using 1 core:")
                tic();
                A = rand(1000,1000)^2;
                B = rand(1000,1000)^2;
                C = rand(1000,1000)^2;
                s = toc();
                println("Using 3 cores:")
                tic();
                A = @spawnat 1 rand(1000,1000)^2;
                B = @spawnat 2 rand(1000,1000)^2;
                C = @spawnat 3 rand(1000,1000)^2;
                t = toc();
        elseif n == 1
                println("Flipping a billion coins...")
                println("in serial:")
                tic();
                for i = 1:1000000000
                        randbool();
                        end
                s = toc();
                println("in parallel:")
                tic();
                @parallel for i = 1:1000000000
                        randbool();
                        end
                t = toc();
        end
        end
