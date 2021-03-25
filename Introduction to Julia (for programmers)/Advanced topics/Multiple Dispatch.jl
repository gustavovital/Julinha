# Multiple Dispatch
methods(+) # More than 200 methods
@which 3 + 3
@which 3.0 + 3
@which 3.0 + 3.0

# Creating new methods
import Base: +

# O objetivo é permitir uma operação no estilo python como "hello"+"world"
+(x::String, y::String) = string(x, y)

# Now, trying again:
"Hello " + "world"
@which "Hello " + "world"
