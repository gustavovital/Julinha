using LinearAlgebra, Statistics, Plots, LaTeXStrings

randn()
n = 100;
ep = randn(n);
plot(1:n, ep)

## types
typeof(ep)
ep[1:5]

n = 100;
ep = zeros(n)
for i in 1:n
    ep[i] = randn()
end

plot(ep)
# or even:
for i in eachindex(ep)
    ep[i] = randn()
end

plot(ep)

ep_sum = 0.0 # careful to use 0.0 here, instead of 0
m = 5
for ep_val in ep[1:m]
    ep_sum = ep_sum + ep_val
end
ep_mean = ep_sum / m

# lets define functions then
function generatedata(n)
    ep = randn(n)
    return ep.^2
end

data = generatedata(5)

# or:
generatedata(n) = randn(n) .^2
generatedata(5)

# or even:
f(x) = x^2
generatedata(n) = f.(randn(n))

data = generatedata(3)

#
n = 3000;
x = randn(n);

f(x) = x^2;

plot(x)
plot!(f.(x))

# more..
import Pkg
using Distributions

function plothist(distribution, n)
    ep = rand(distribution, n)
    histogram(ep)
end

lp = Laplace()
plothist(lp, 500)