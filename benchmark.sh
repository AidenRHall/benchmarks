#!/usr/bin/bash
#
# Aiden Hall, Dustin Zentz, and Will Price
# Umass Amherst, Math 552, Whitaker, spring 2014
echo 'Julia vs Octave Benchmark'

rm julia_times
rm octave_times

# pass title, number of iterations, and file locations (julia then octave)
# pass any other arguments necessary as well, but they should be identical
# for the octave and julia scripts - if you have none thats fine too
function bench {
    echo "
$1" | tee -a julia_times octave_times
    for (( i=1; i<=$2; i++)); do
        echo $i | tee -a julia_times octave_times
        julia $3 $i $5 $6 >> julia_times
        octave -q $4 $i $5 $6 >> octave_times
    done
}

bench 'FFT' 8 ./julia/bench_fft.jl ./octave/bench_fft.m
bench 'iFFT' 8 ./julia/bench_ifft.jl ./octave/bench_ifft.m

python parser.py julia_times octave_times | less
