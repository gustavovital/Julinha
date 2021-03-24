# Plotting
# Pkg.add("Plots")
Pkg.add("PlotlyJS")
using Plots

x = -3:0.1:3
f(x) = x^2
y = f.(x)

# Plot
gr()
plot(x, y, label="line")
scatter!(x, y, label="points")

plotlyjs()
plot(x, y, label="line")
scatter!(x, y, label="points")

# Another plot
globalTemperatures = [14.4, 14.5, 14.8, 15.2, 15.5, 15.8]
numPirates = [45000, 20000, 15000, 5000, 400, 17]

gr()
plot(numPirates, globalTemperatures, legend=false)
scatter!(numPirates, globalTemperatures, legend=false)
xflip!()
xlabel!("Numbers of pirates")
ylabel!("Global temperature")
title!("Influence of pirates on global temperatures")

# Subplots
p1 = plot(x, x)
p2 = plot(x, x.^2)
p3 = plot(x, x.^3)
p4 = plot(x, x.^4)
plot(p1, p2, p3, p4, legend = false, layout=(2,2))
