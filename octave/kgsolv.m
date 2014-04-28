function [uu tt] = kgsolv()
format long
N = 500;
x = linspace(-10,10,N+1);
u = max(0,1-800*x.^2)';
dt = 0.0001;
ii = 0;
sp = 0;
% f = @(u) 100*u*(1-u);
for i = 1:4000
k1=dt*gs4(u(:));
k2=dt*gs4(u(:)+k1/2);
k3=dt*gs4(u(:)+k2/2);
k4=dt*gs4(u(:)+k3);
u=u+(k1+2*k2+2*k3+k4)/6;
%if mod(i-1,10) == 0
%	ii = ii+1;
%	plot(x,u)
%	axis([-10 10 0 1])
%	drawnow
%	tt(ii) = dt*(i-1);
%	uu(:,ii) = u;
%end
end
%imagesc(tt,x,uu);
%m = slopefinder(uu,tt)
%return [uu, tt]
plot(x,u)
end

