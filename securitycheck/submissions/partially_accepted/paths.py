#! /usr/bin/env python3

# Assumes the edges are 1 -- 2 -- ... -- n
# without even looking at the input

n = int(input())
print(n * (n - 1) // 2)
