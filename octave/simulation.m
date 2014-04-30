% Constants
% Constants based on statistics
global cars_on_road = 254000000;
global annual_new_cars = 8000000;
global annual_crashed_cars = 10800000*.9;

global k = 10000;
global l = .1;

global car_cost_mean = 30000;
global car_cost_std  = 35000;

% Manual on manual crash rate
global mm_crash_rate = annual_crashed_cars/cars_on_road;

% Constants that are derived
% Manual on self driver crash rate
global cost_per_accident = 99000000000/annual_crashed_cars;
global am_crash_rate = mm_crash_rate/20;

% IN MODEL: A
% new amount of self driving cars given
% required input from previous year
% REQUIRES: current number of self drivers and self driving cars
function quantity = new_self_drivers(self_drivers, cost)
    global annual_new_cars cars_on_road car_cost_mean car_cost_std;
    quantity = self_drivers + annual_new_cars\
                            * (1 - self_drivers/cars_on_road)\
                            * (1 - normcdf(cost, car_cost_mean, car_cost_std));
end

% IN MODEL: F
% new cost of self driving cars
% REQUIRES: current cost and variable
function cost = new_self_driving_cost(current_cost, variable, t)
    global k l;
    cost = current_cost*(1 - variable);
end

% IN MODEL: X
% new total crash rate for all cars
% REQUIRES: current self drivers
function rate = new_crash_rate(self_drivers)
    global cars_on_road am_crash_rate mm_crash_rate;
    rate = (cars_on_road**-1)*\
    2*am_crash_rate*(self_drivers - self_drivers**2/cars_on_road) + \
      mm_crash_rate*(cars_on_road - 2*self_drivers + self_drivers**2/cars_on_road);
end

function [self_driver_cost self_driver_quantity crashes money_saved] = simulation(r, end_time)
    % Initialize Variables
    self_driver_quantity = [0];
    self_driver_cost = [100000];
    crashes = [];
    global car_cost_mean cost_per_accident;

    % Start Simulation
    for i = 2:end_time + 1
        self_driver_cost = [self_driver_cost new_self_driving_cost(self_driver_cost(i - 1) - car_cost_mean, r(i - 1), i) + car_cost_mean];
        self_driver_quantity = [self_driver_quantity new_self_drivers(self_driver_quantity(i - 1), self_driver_cost(i - 1))];
        crashes = [crashes new_crash_rate(self_driver_quantity(i - 1))];
    end
    delta_sdq = [0];
    for i = 2:length(self_driver_quantity)
        delta_sdq(i) = self_driver_quantity(i) - self_driver_quantity(i - 1);
    end
    money_saved = sum(r.*self_driver_cost.*delta_sdq) - sum(cost_per_accident.*crashes);
end

function r = main()
    args = argv();
    end_time = 50; % In years
    r = [];

    % Parse Args
    if args{1} == '-d'
        for i = 1:length(args) - 1
            r(i) = str2num(args{i + 1});
        end
        if length(args) > end_time
            disp('more than 20 args passed, some not used');
        end
        if length(args) < end_time
            disp('less than 20 args passed, defaulting to 0s for extra values');
            for i = length(args):end_time
                r(i) = 0;
            end
        end
    elseif args{1} == '-c'
        for i = 1:end_time + 1
            r(i) = str2num(args{2});
        end
    elseif args{1} == '-t'
        global cars_on_road
        tol = .5;
        target = .8;
        end_time = str2num(args{2});
        r = .5.+ zeros(1, end_time + 1);
        left = 0;
        right = 2*r(1);
        iter = 1;
        [self_driver_cost self_driver_quantity crashes money_saved] =  simulation(r, end_time);
        while abs(crashes(end)/cars_on_road - target) > tol
            abs(crashes(end)/cars_on_road - target)
            crashes(end)
            iter = iter + 1;
            [self_driver_cost self_driver_quantity crashes money_saved] =  simulation(r, end_time);
            if crashes(end)/cars_on_road - target > 0
                r = r.- right*2^-iter;
            end
            if crashes(end)/cars_on_road - target < 0
                r = r.+ right*2^-iter;
            end
        end
        return
    else
        disp('i dont know how to comprehend your args');
        disp('your first arg should be one of the flags from this list:');
        disp('d');
        disp('...');
        disp('defaulting to all 0s for r');
        r = zeros(1, end_time);
    end

    tol = 100;
    left = 0;
    right = 2*r;
    target = 0;
    money_saved = -10000000000;

    iter = 1;
    while abs(money_saved - target) > tol
        iter = iter + 1;
        [self_driver_cost self_driver_quantity crashes money_saved] =  simulation(r, end_time);
        if money_saved - target < 0
            r = r.+ right*2^-iter
        end
        if money_saved - target > tol
            r = r.- right*2^-iter
        end
    end

    % Plot all data worth plotting
    comet(self_driver_quantity);
    pause;
    comet(self_driver_cost);
    pause;
    comet(crashes);
    pause;
    r = r(1);
end
main()
