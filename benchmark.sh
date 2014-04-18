#!/usr/bin/bash
#
# Aiden Hall, Dustin Zentz, and Will Price
# Umass Amherst, Math 552, Whitaker, spring 2014
echo 'Julia vs Octave Benchmark'
touch julia_times
touch octave_times

$JULIA = /home/aiden/school/552/project/julia
$OCTAVE = /home/aiden/school/552/project/octave

# FFT/iFFT benchmark
for i in {1..8}; do
    echo $i
    echo julia
    julia $JULIA/bench_fft.jl $i >> julia_times
    echo octave
    octave -q $OCTAVE/bench_fft.m $i >> octave_times
done
