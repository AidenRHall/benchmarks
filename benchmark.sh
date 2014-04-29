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
        octave -q $4 $i $5 $6 >> octave_times
    done
}

# Aiden
#bench 'FFT' 7 ./julia/bench_fft.jl ./octave/bench_fft.m
#bench 'iFFT' 7 ./julia/bench_ifft.jl ./octave/bench_ifft.m
#bench 'Iterative Addition' 7 ./julia/bench_iteration.jl ./octave/bench_iteration.m
bench 'RK4' 3 ./julia/bench_rk4.jl ./octave/bench_rk4.m

python parser.py julia_times octave_times | less

if [ -f julia_times ]; then
    rm julia_times
fi
if [ -f octave_times ]; then
    rm octave_times
fi


# Will
sleep 2
echo ''
echo 'your turn Will!'
read

time julia -q -p 4 ./julia/kgsolv.jl
time octave -q ./octave/kgsolv.m
time julia -q -p 4 ./julia/partest.jl
time julia -q -p 4 ./julia/tumour.jl


# Dustin
sleep 2
echo ''
echo 'your turn Dustin!'
read
