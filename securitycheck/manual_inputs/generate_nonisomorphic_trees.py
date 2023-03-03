#! /usr/bin/env python3

# Use networx library to generate nonismorphic trees

import networkx as nx


for n in range(3, 11):
    for i, T in enumerate(nx.nonisomorphic_trees(n)):
        f = open(f"tree-{n}-{i}.in", "w")
        f.write(f"{n}\n")
        for u, v in T.edges:
            f.write(f"{u + 1} {v + 1}\n")
        f.close()
