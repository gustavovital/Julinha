# Data structures

# Dictionary
myphonebook = Dict("Janny"=>"867-5309",
                  "Ghostbusters"=>"555-2368")
myphonebook["Kramer"] = "555-FILK"
myphonebook
myphonebook["Janny"]

pop!(myphonebook, "Kramer")
myphonebook

# Tuples
myfavoriteanimals = ("Penguins", "Cats", "Sugargliders")
myfavoriteanimals[1]

# Arrays
myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]
myfriends[2]

fibonacci = [1, 1, 2, 3, 5, 8, 13]

mix = [1, 2, "hi", 3.0]

myfriends[3] = "Baby Pop"
myfriends

push!(fibonacci, 21)
fibonacci
pop!(fibonacci)
fibonacci

# Multidimentional arrays:
numbers = [[1,2,3], [4,5,6], [7,8,9]]
numbers

rand(4, 3)
rand(4, 3, 2)
