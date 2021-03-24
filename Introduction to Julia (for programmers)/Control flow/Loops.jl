#  - while and for

# While loop

n = 0
while n < 10
    n += 1
    println(n)
end

# with a list
myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]
i = 1

while i <= length(myfriends)
    friend = myfriends[i]
    println("Hi, $friend, it's great to see you!")
    i += 1
end

# for loops
for i in 1:10
    println(i)
end

# Now using a list again
myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

for friend in myfriends
    println("Hey, $friend, how are you?")
end

for friend ∈ myfriends
    println("Here we go again, $friend")
end

#  How to fill a matrix:
m, n = 5, 5
A = zeros(m, n)

for i in 1:m
    for j in 1:n
        A[i, j] = i + j
    end
end

B = zeros(m, n)

for i in 1:m, j in 1:n
    B[i,j] = i + j
end

println(A == B)

# Array comprehension
C = [i + j + k for i in 1:m, j in 1:n, k in 1:m]
