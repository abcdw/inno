#!/usr/bin/python3

def func(n, m):
    count = 0
    prod = 1
    for i in range(1, n + 1):
        prod = i
        dv = divmod(prod, m)
        while dv[1] == 0:
            count += 1
            prod = dv[0]
            dv = divmod(prod, m)

    return count

n = 24
m = 2

print(func(n, m))

