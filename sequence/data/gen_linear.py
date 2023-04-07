#!/usr/bin/env python3

""" Expects n of the form 2**k - 1 """
import sys


n = int(sys.argv[1]) + 1

assert (n & (n-1) == 0) and n != 0, "argument should be 2**k - 1"


# find lo hi such that 2^lo < n // 2
exp = 1
indices = [1, 2]
while indices[-1] ** 2 <= n//2:
    indices.append(indices[-1] ** 2)

while indices[-1] * 2 <= n//2:
    indices.append(indices[-1] * 2)

indices.extend(range(indices[-1] + 1, 2 * indices[-1]))

indices = set(indices)
weights = []
solsize = len(indices)
for i in range(1, n):
    weights.append(solsize if i not in indices else 1)
print(len(weights))
print(*weights, sep='\n')
