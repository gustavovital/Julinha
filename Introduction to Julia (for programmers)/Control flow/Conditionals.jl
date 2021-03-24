# Conditional if
x = 3
y = 70

if x > y
    println("$x is larger than $y")
elseif y > x
    println("$y is larger than $x")
else
    println("$x is equal $y")
end

x = 4596
y = 4596

if x > y
    println(x)
else
    println(y)
end

(x > y) ? println(x) : (x < y) ? println(y) : println("They are equal")
