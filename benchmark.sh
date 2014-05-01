#!/usr/bin/bash
#
# Aiden Hall, Dustin Zentz, and Will Price
# Umass Amherst, Math 552, Whitaker, spring 2014
#
# Start by clearing the screen
printf "\033c"
echo 'Julia vs Octave Benchmark'

# pass title, number of iterations, and file locations (julia then octave)
# pass any other arguments necessary as well, but they should be identical
# for the octave and julia scripts - if you have none thats fine too
function bench {
    echo "
$1" | tee -a julia_times octave_times
    for (( i=1; i<=$2; i++)); do
        echo "iteration $i"
        julia -q $3 $i $5 $6 >> julia_times
        octave -q --jit-compiler $4 $i $5 $6 >> octave_times
    done
}

# Aiden
bench 'FFT' 5 ./julia/bench_fft.jl ./octave/bench_fft.m
bench 'iFFT' 5 ./julia/bench_ifft.jl ./octave/bench_ifft.m
bench 'Iterative Addition' 5 ./julia/bench_iteration.jl ./octave/bench_iteration.m
bench 'RK4' 3 ./julia/bench_rk4.jl ./octave/bench_rk4.m
bench '2x2 matrix' 3 ./julia/bench_matrix.jl ./octave/bench_matrix.m 2
bench '10x10 matrix' 3 ./julia/bench_matrix.jl ./octave/bench_matrix.m 10
bench '50x50 matrix' 3 ./julia/bench_matrix.jl ./octave/bench_matrix.m 50
bench '100x100 matrix' 2 ./julia/bench_matrix.jl ./octave/bench_matrix.m 100
bench 'String to Int' 3 ./julia/bench_strings.jl ./octave/bench_strings.m
bench 'Int to String' 2 ./julia/bench_ints.jl ./octave/bench_ints.m
eog pictures/Whitaker.jpg
bench 'Image FFT' 1 ./julia/bench_pics.jl ./octave/bench_pics.m pictures/Whitaker.jpg

python parser.py julia_times octave_times | tee output.txt | less

if [ -f julia_times ]; then
    rm julia_times
fi
if [ -f octave_times ]; then
    rm octave_times
fi
