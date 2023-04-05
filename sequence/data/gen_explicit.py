#! /usr/bin/env python3

"""
    Very simple generator that expects arguments of the form
    w_1 ... w_n
"""
import sys

print(len(sys.argv) - 2)
for w in map(int, sys.argv[1:-1]): # drop first argument (myself) and last (seed)
    print(w)
