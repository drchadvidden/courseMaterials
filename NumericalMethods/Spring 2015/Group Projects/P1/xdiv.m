function x = xdiv(x,a,base)
% Calculate X/A to N digits in base BASE
clc
x=[1; 0; 0;]
a=6
base=1e5
r = 0
base/a
t = floor(base/a) % truncate as distinguished by base
u = base - a*t % error, remainder
for k = 1:numel(x)
    k
	v = x(k) + r*u % error / remainder
    v/a
	q = floor(v/a) % divide error by divisor
	x(k) = q + r*t % take digits for k, k=1 means number to left of dec pt
	r = v - a*q % remainder
end