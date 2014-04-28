function tumour(u)
        n = length(u);
        du = zeros(n);
        dx2 = (2*10/500)^2;
        du[1] = 0;
        du[n] = 0;
        for i = 2:n-1
                du[i] = (u[i+1] - 2*u[i] + u[i-1])/dx2 + 100*u[i]*(1-u[i]);
        end
        du = du';
end
