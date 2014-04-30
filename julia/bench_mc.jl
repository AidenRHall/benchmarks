#! /bin/julia 

# Testing Julia Language runtime performance of random number generation 
#	and Monte Carlo Integration in higher dimensions.
# Author: Dustin Zentz 

# Probably just hard code everything...
# N = int(ARGS[1])

### Test 1 
# Psuedo-Random Number generation for N-iterations
### 

N = 1*10^6 # 10 million iters
println("Test 1: Generate $N Psuedo-rand numbers.")
try
	tic()
	for i=1:N
		rand()
	end
end
toc()

### Test 2
# Generate N uniform, psuedo-rand, D-dimensional tuples (as used in Monte Carlo Integration)
###
D = 100 # dimensions
n = 1000000 # one million tuples 
println("Test 2: Generate $n uniform, psuedo-rand, $D-dimensional tuples.")
try
tic()
for i=1:D
	rand(n)
end
end
toc()

### Test 3 
# Sample High-Dimensional Monte Carlo integration
### 
println("Test 3: Multidimensional integral approx w/ Monte Carlo simulation.")
tic()

# surface function
rad(x::Float64, y::Float64) = sqrt(x^2 + y^2) + eps()
zz(x::Float64, y::Float64) = abs(sin(rad(x,y))./rad(x,y))

N = 25000
randX = 16.*(rand(N)).-8
randY = 16.*(rand(N)).-8
randZ = rand(N)

c = 0
for i=1:N
if( randZ[i] <= zz(randX[i], randY[i]) )
	c = c + 1 
end
end

total_vol = 16^2
integral_vol = total_vol*(c/N)
println("Number of random points: $N")
println("Total Volume under the surface: $integral_vol")
toc()
