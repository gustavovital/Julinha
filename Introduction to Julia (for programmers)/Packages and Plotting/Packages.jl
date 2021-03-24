# Packages
Pkg.add("Example")
Pkg.add("Colors")
using Example
using Colors

hello("it's me!")
palette = distinguishable_colors(1000);
rand(palette, 20, 20)
