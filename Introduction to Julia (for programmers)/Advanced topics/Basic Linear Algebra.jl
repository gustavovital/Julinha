A = rand(1:4, 3, 3)
B = A
C = copy(A)
[ B C]

A[1] = 17

x = ones(3)

b = A*x

A'
# A'A = A'*A same thing
# A\b = x same as matlab
