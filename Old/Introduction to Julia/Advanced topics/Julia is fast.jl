a = rand(10^7)
sum(a)

# Pkg.add("BenchmarkTools")
using BenchmarkTools

Pkg.add("PyCall")
using PyCall

# Comparson with python
apy_list = PyCall.array2py(a)
pysum = pybuiltin("sum")

pysum(a) ≈ sum(a)

py_list_bench = @benchmark $pysum($apy_list)

d = Dict("Python Base" => minimum(py_list_bench.times)/1e6)

# Pkg.add("Conda")
using Conda

numpy_sum = pyimport("numpy")["sum"]
apy_numpy = PyObject(a)

py_numpy_bench = @benchmark $numpy_sum($apy_numpy)

d["Python Numpy"] = minimum(py_numpy_bench.times)/1e6

print(d)

# Creating by hand the python sum:

py"""
def py_sum(a):
    s = 0.0
    for x in a:
        s += x
    return s
"""
sum_py = py"py_sum"

py_hand = @benchmark $sum_py($apy_list)
d["Python by hand"] = minimum(py_hand.times)/1e6

julia_bench = @benchmark sum($a)
d["Julia"] = minimum(julia_bench.times)/1e6

# hand write julia:

function soma(lista)
    s = 0.0
    for x in lista
        s += x
    end
    return s
end

julia_hand = @benchmark soma($a)
d["Julia by hand"] = minimum(julia_hand.times)/1e6

# Summary:
for (key, value) in sort(collect(d))
    println(rpad(key, 20, "."), lpad(value, 8, "."))
end
