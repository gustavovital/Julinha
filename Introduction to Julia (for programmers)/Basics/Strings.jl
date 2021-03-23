# Strings manipulation
s1 = "I am a string"
s2 = """I am a string"""
println(typeof(s1),' ', typeof(s2))

#  String interpolation

name = "Jane"
num_fingers = 10
num_toes = 10

println("Hello, my name is $name")
println("I have $num_fingers fingers and $num_toes toes. That is $(num_toes + num_fingers) digits in all")

# The string function
string("How many cats ", "are too many cats?")
string("I don't know, but ", 10, " are too many!")

s3 = "How many cats "
s4 = "Are too many cats?"

s3*s4
"$s3$s4"

#  ---------------------------------------------------------------------------
