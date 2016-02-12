from math import *

def func(x, y):
    return cos(x) - x*x*sin(x) + tan(x) > y + 1.0 / y - log1p(y*y)


print func(1, 1)
print func(1.25, 2.5)
print func(20, 20)
print func(0.5, 0.3)

