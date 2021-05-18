# About portfolio optimization
# Gustavo Vital
# using Pkg
# Pkg.add("Convex")
# Pkg.add("SCS")

using Convex, SCS

## First example
# Starting the example - generating random numbers and data
m = 4
n = 5

A = randn(m, n)
b = randn(m, 1)
x = Variable(n)

## Minimization
problem = minimize(sumsquares(A * x - b), [x >= 0])
solve!(problem, SCS.Optimizer)

print(problem.status)
print(problem.optval)
