# Major Differences #
# matlab --> g(i)   julia --> g[i]
# julia return statements and function definition

function kgsolv()
N = 500;
x = linspace(-10,10,N+1);
u = max(0,1-800*x.^2)';
tt = zeros(500);
uu = zeros(501,500);
dt = 0.0001;
ii = 0;
sp = 0;
# f(u) = 100*u*(1-u); #functions much more idiomatic to declare
for i = 1:4000
k1=dt*tumour(u);
k2=dt*tumour(u+k1/2);
k3=dt*tumour(u+k2/2);
k4=dt*tumour(u+k3);
u=u+(k1+2*k2+2*k3+k4)/6;
 #if mod(i-1,10) == 0
  #     ii = ii+1;
  #     plot(x,u)
  #     #axis([-10 10 0 1])
  #     drawnow
  #     tt[ii] = dt*(i-1);
  #     uu[:,ii] = u;
#end
end
#imagesc(tt,x,uu);
#m = slopefinder(uu,tt)
#return [uu, tt]
plot(x,u)
return plot(x,u)
end
