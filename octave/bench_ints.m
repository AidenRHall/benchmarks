args = argv();
p = str2num(args{1});
ex = 100*10**p;
printf('%d\n', ex);

tic;
for i = 1:ex
	num2str(69);
end
toc;
