#! /usr/bin/env python3

# Write given tree with node names 0,...,n-1 using
# the nodes to 1, ..., n at random, and in 
# random order

import random

def write_edgelist(edgelist, seed):
    random.seed(seed)

    n = len(edgelist) + 1
    permutation = list(range(1, n + 1))
    random.shuffle(permutation)
    random.shuffle(edgelist)
    for line in edgelist:
        u, v = map(int, line.split())
        assert 0 <= u < v < n
        u = permutation[u]
        v = permutation[v]
        print(min(u, v), max(u, v))
