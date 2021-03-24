# Functions
function sayHi(name)
    println("Hi, $name !!")
end

sayHi("gustavo")

function exponencial(x)
    x^2
end

println(exponencial(4))

sayHi2(name) = println("Hi, $name, how are you?")
sayHi2("gustavo")

sayHi3 = (name1, name2) -> println("Hey $name1 and $name2, how are you??")
sayHi3("Gustavo", "Makhno")
