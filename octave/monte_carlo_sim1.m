#! /usr/local/bin/octave -qf
% called from bench_mc.m

% Author: Dustin Zentz
% Monte-Carlo simulation for testing Octave v. Julia
% Approximates multidimension integrals w/ Quasi-Random numbers

function monte_carlo_sim1 (num_samples)

% Test plot of 3-d "Sombrero"
% ------------ Web Example code ---------------
tx = ty = linspace(-8, 8, 41)';
[xx, yy] = meshgrid(tx, ty);
r = sqrt(xx.^2 + yy.^2) + eps;
tz = abs(sin(r)./r);
% --------------------------------------------

% surface function
rad = @(x,y) sqrt(x^2 + y^2) + eps;
zz = @(x, y) abs(sin(rad(x,y))./rad(x,y) );

pause();
% line 'mesh' graph over linspace
figure;
mesh(tx, ty, tz);
title("Mesh Plot");

pause();
% surface plot from matrix output of meshgrid
figure;
surf(tx, ty, tz);
title("Surface Plot");

pause();
% 3D Scatter plot of surface
figure;
scatter3(xx, yy, tz);
title("Surface Scatter Plot"); pause();

% -------- Quasi-Random Monte Carlo for volume under irregular surface ---------
N = num_samples
%tic();
% generate halton sequences for (x,y,z) coordinates
randX = (16.*(halton(3,N))).-8;
randY = (16.*(halton(5,N))).-8;
randZ = halton(7, N); % f(x,y) = z values are between 0 and 1
%toc();

% Evaluate N q-rand tuples and save which points lie under the surface
count = 0;
% Vectors to store coordinates of sample points which are contained in the volume space
x_in = [];
y_in = [];
z_in = [];

for n=1:N
if( randZ(n) <= zz(randX(n), randY(n)) )
% if(0.00005 >= (zz(randX(n), randY(n)) - randZ(n) ) ) % Reminder: do a scatter plot of all the sampling space to show a cube
count = count + 1; % this pt. lies under the surface
x_in(count+1) = randX(n); y_in(count+1) = randY(n); z_in(count+1) = randZ(n); % store the coordinates of a contained pt.
end
end

% Try to scatter plot rand pts under the surface
figure; hold on;
%scatter3(xx, yy, tz, 'b'), drawnow;
scatter3(x_in, y_in, z_in, 'r'); drawnow; title("Volume Approximation: satisfying Monte Carlo coordinates.");
hold off; pause();
total_vol = 16^2;
disp('Total Volume under the surface: ');
integral_vol = total_vol*(count/N)

disp('Percent Volume of the total sampled space: ')
count/N

end %endfunction
