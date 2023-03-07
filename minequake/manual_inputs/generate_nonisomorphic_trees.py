#! /usr/bin/env python3

# Use networx library to generate nonismorphic trees

import networkx as nx


for n in range(3, 11):
    for i, T in enumerate(nx.nonisomorphic_trees(n)):
        f = open(f"tree-{n}-{i}.in", "w")
        f.write(f"{n}\n")
        for u, v in T.edges:
            u, v = min(u, v) + 1, max(u, v) + 1
            f.write(f"{u} {v}\n")
        f.close()
