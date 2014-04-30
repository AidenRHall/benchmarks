#! /usr/local/bin/octave 

% Program 9.1  Quasi-random number generator
% Halton sequence in base p
% Input: prime number p, random numbers required n
% Output: array u of quasi-random numbers in [0,1]
% Example usage: halton(2,100)

% Used for bench_mc*.m files 

function u=halton(p,n)
b=zeros(ceil(log(n)/log(p)),1);
for j=1:n
  i=1;
  b(1)=b(1)+1;
  while b(i)>p-1+eps
    b(i)=0;
    i=i+1;
    b(i)=b(i)+1;
  end
  u(j)=0;
  for k=1:length(b(:))
    u(j)=u(j)+b(k)*p^(-k);
  end
end
