#! /usr/local/bin/octave -qf

% Author: Dustin Zentz 
% -- Test 1 --
% Generate N, psuedo-random numbers on [0,1]
% ------------
format long; % to match 64-bit precision of Julia script

N = 1*10^6;
disp('Test 1: Generate a million psuedo-rand numbers.');

tic;
	for i=1:N
		rand;
	end
toc;

% -- Test 2 --
% Generate High-Dimensional!, Uniform, psuedo-random tuples
% ------------

D = 100; % dimensions
n = 1000000; % number of tuples 

disp('Test 2: Generate a million uniform, 100-dimensional, psuedo-rand tuples');
tic;
for i=1:D
	rand(n, 1);
end
toc;

% -- Test 3 --
% Sample High-Dimensional Monte Carlo integration
% ------------

disp('Test 3: Multidimensional integral approx w/ Monte Carlo simulation.');
tic();

% surface function
rad = @(x,y) sqrt(x^2 + y^2) + eps;
zz = @(x, y) abs(sin(rad(x,y))./rad(x,y) );

N = 25000;
randX = 16.*(rand(N, 1)).-8;
randY = 16.*(rand(N, 1)).-8;
randZ = rand(N, 1);

count = 0;
for i=1:N
if( randZ(i) <= zz(randX(i), randY(i)) )
count = count + 1; % this pt. lies under the surface 
end
end
toc();

total_vol = 16^2; disp('Total number of sample points: 10,000.');
disp('Total Volume under the surface: ');
integral_vol = total_vol*(count/N)

% Simulation
disp('Launching Simulation... hit ENTER for each graph.');
monte_carlo_sim1(25000);
