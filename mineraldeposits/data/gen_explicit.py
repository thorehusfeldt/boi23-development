#! /usr/bin/env python3

"""
    Very simple generator that expects arguments of the form
    n m Q p_1.x p_1.y p_2.x p_2.y ... p_n.x p_n.y
"""
import sys

values = sys.argv[1:-1] # drop first argument (myself) and last (seed)
n, m, Q, *points = values
assert len(points) % 2 == 0
k = len(points) // 2
print (n, m, k, Q)
for x, y in zip(points[::2], points[1::2]):
    print(x, y)
