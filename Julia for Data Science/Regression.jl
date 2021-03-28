using Plots
using Statistics
using DataFrames
using GLM
using StatsBase
using PyCall
using Tables

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

# Doing w python
np = pyimport("numpy")
