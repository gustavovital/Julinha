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

# Factorization

# LU factorization
luA = lu(A)
@show norm(luA.L*luA.U - luA.P*A)

# Cholensky factorization  - simetrica e definido positivo
isposdef(A)

cholA = cholesky(A)
@show cholA.U

factorize(A) == cholA.U # false? precisiono?

# more stuff ..
diagm(diag(A)) # cria uma matriz diagonal com os valores array
@show I(3)

S = sprand(5, 5, 2/5)
S.rowval
Matrix(S)

S.colptr

# Working w images
X1 = load("Julia for Data Science\\Data\\khiam-small.jpg")
@show typeof(X1)
X1[1, 1]
X1

Xgray = Gray.(X1)

# mudando tudo.. extraindo RGB da imagem
R = map(i -> X1[i].r, 1:length(X1))
R = Float64.(reshape(R, size(X1)...))

G = map(i -> X1[i].g, 1:length(X1))
G = Float64.(reshape(G, size(X1)...))

B = map(i -> X1[i].b, 1:length(X1))
B = Float64.(reshape(B, size(X1)...))

z = zeros(size(R)...)

RGB.(R, G, B)

# Esse foi o basico de imagens, nao continuo pois tenho zero interesse (por
# enqunato) em manipuilação de imagens. 
