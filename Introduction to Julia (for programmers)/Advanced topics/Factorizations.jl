#  Factorizations
using LinearAlgebra

A = randn(3,3)

# LU factorization
l,u,p = lu(A)

display(norm(l*u - A))
display(norm(l*u - A[p,:]))

# l,u,p = lufact(A)
#
# display(norm(l*u - A))
# display(norm(l*u - A[p,:]))
x = ones(3)
b = A*x

println(A\b)
println(det(A))
println(qr(A))

# Eingenvalues
As = A + A'
Aeig = eigen(A)
println(diag(A))
println(Diagonal(diag(A)))

# More...
n = 1000
A = randn(n, n)
Asym1 = A + A'
Asym2 = copy(Asym1)
Asym2[1,2] += 5eps()
println("Is Asym1 symmetric? ", issymmetric(Asym1))
println("Is Asym2 symmetric? ", issymmetric(Asym2))

@time eigen(Asym1)
@time eigen(Asym2)

rand(1:10, 3,3)
