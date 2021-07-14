%%
clear all
clc
fib_40 = fibonacci_local(40);
is_prime = isprime(fib_40);
primes = find(is_prime==1)
length(primes);
%%
clear all
clc
syms phi;
A = [1,1;phi,1-phi];
b = [1,1]';
x = A\b;
x

%% 
clear all
clc
fib_40 = fibonacci_local(40);
semilogy(fib_40,'o-');
p = polyfit(1:40,fib_40',1);
p 

%% 
fibonacci_series = @(x) (x+x.^2)./(1-x-x.^2);

%% 
z = [1,2,3+4i,5];
z'
z.'









