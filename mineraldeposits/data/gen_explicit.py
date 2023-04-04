#! /usr/bin/env python3

"""
    Very simple generator that expects arguments of the form
    b w p_1.x p_1.y p_2.x p_2.y ... p_k.x p_k.y
"""
import sys

values = sys.argv[1:-1] # drop first argument (myself) and last (seed)
b, w, *points = values
assert len(points) % 2 == 0
k = len(points) // 2
print (b, k, w)
for x, y in zip(points[::2], points[1::2]):
    print(x, y)
