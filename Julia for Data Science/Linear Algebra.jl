using LinearAlgebra
using SparseArrays
using Images
using MAT

# Comecando...

A = rand(10, 10)
Atranspose = A'
A = A*Atranspose
@show A[11] == A[1, 2]

# Escrevendo a [11] ele conta por linhas.. como sao 10 linhas, a 11 seria a
# primeira da segunda linha!

b = rand(10) # vetor de coef
x = A\b
@show x

@show norm(A*x - b) # aqui se minimiza os erros ols..

# We also could use the inv function, but no.

@show typeof(A)
@show typeof(b)
@show typeof(rand(1, 10))
@show typeof(Atranspose)

# ?Adjoint just work on shit jupyter
