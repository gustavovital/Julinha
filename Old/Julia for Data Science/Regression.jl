
using Plots
using Statistics
using DataFrames
using GLM
using StatsBase
using PyCall
using Tables

Pkg.add("Plots")

xval = repeat(1:.5:10, inner=2)
yval = 3 .+ xval .+ 2 .*rand(length(xval)) .- 1

scatter(xval, yval, leg=false, color="black")

# Creating a function to solve a ols w two variables:
function ols(x, y)

    meanx = mean(x)
    meany = mean(y)
    stdx = std(x)
    stdy = std(y)
    r = cor(x, y)
    β = r*stdy/stdx
    α = meany - β*meanx

    return β, α
end

# ols(xval, yval)
β, α = ols(xval, yval)
y_predict = α .+ β.* xval

# scatter(xval, yval, leg=false, color="black")
# plot!(xval, y_predict)

# Doing w python
np = pyimport("numpy")

xdata = copy(xval)
ydata = copy(yval)

@time myfit = np.polyfit(xdata, ydata, 1)

y_predict_2 = myfit[2] .+ myfit[1].*xval

# New Graph
scatter(xval, yval)
plot!(xval, y_predict)
plot!(xval, y_predict_2)

# Fitting as R:
data = DataFrame(X = xval, Y = yval)
ols_fit = lm(@formula(Y ~ X), data)
plot!(xval, predict(ols_fit))
