p = 1.0;
β = 0.9;
maxiter = 1000;
tolerance = 1.0E-7;
v_iv = 0.8;

v_old = v_iv;
normdiff = Inf;
iter = 1;

while normdiff > tolerance && iter < maxiter
    v_new = p + β * v_old;
    normdiff = norm(v_new - v_old);

    v_old = v_new;
    iter = iter + 1
end 
println("Fixed point = $v_old
|f(x) - x| = $normdiff in $iter iterations")

# doing w for
v_old = v_iv
normdiff = Inf
iter = 1

for i in 1:maxiter
    v_new = p + β * v_old;
    normdiff = mean(v_new - v_old)

    if normdiff < tolerance
        iter = i
        break
    end
    v_old = v_new
end
println("Fixed point = $v_old
|f(x) - x| = $normdiff in $iter iterations")

# defining a function 
function v_fp(β, p, v_iv, tolerance, maxiter)
    v_old = v_iv
    normdiff = Inf
    iter = 1

    while normdiff > tolerance && iter <= maxiter
        v_new = p + β * v_old
        normdiff = mean(v_new - v_old)

        v_old = v_new
        iter = iter + 1
    end
    return (v_old, normdiff, iter)
end

p = 1.0 # note 1.0 rather than 1
β = 0.9
maxiter = 1000
tolerance = 1.0E-7
v_initial = 0.8 # initial condition

v_star, normdiff, iter = v_fp(β, p, v_initial, tolerance, maxiter)
println("Fixed point = $v_star
  |f(x) - x| = $normdiff in $iter iterations")

# for a generic function
function fixedpointmap(f, iv, tolerance, maxiter)
    x_old = iv
    normdiff = Inf
    iter = 1

    while normdiff > tolerance && iter <= maxiter
        x_new = f(x_old)
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end
    return (x_old, normdiff, iter)
end

p = 1.0
beta = 0.9
f(v) = p + beta * v # note that p and beta are used in the function!

maxiter = 1000
tolerance = 1.0E-7
v_initial = 0.8 # initial condition

v_star, normdiff, iter = fixedpointmap(f, v_initial, tolerance, maxiter)
println("Fixed point = $v_star
  |f(x) - x| = $normdiff in $iter iterations")

using NLsolve

p = 1.0
beta = 0.9
f(v) = p .+ beta * v # broadcast the +
sol = fixedpoint(f, [0.8]; m = 0)
normdiff = norm(f(sol.zero) - sol.zero)
println("Fixed point = $(sol.zero)
  |f(x) - x| = $normdiff in $(sol.iterations) iterations")