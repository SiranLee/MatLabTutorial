F = [];
n = 20;
for i = 1:n
    F = [F,ffib(i)*ffib(i)];
end
sum(F) == ffib(n)*ffib(n+1)
