#! /usr/bin/env python3

import re
import sys

from argparse import ArgumentParser

parser = ArgumentParser("Validate input")
parser.add_argument("--max_n", type=int, default=1000000)
parser.add_argument("--structure", choices=["path", "starlike"])
args = parser.parse_args()

line = sys.stdin.readline()
assert re.match("[1-9][0-9]*\n", line), line
n = int(line)
assert 0 < n <= args.max_n

V = list(range(1, n + 1))
edges = set()
halls = set([1])
for _ in range(n - 1):
    line = sys.stdin.readline()
    assert re.match("[1-9][0-9]* [1-9][0-9]*\n", line), line
    u, v = map(int, line.split())
    assert u < v
    assert (u, v) not in edges, "Duplicate corridor"
    edges.add((u, v))
    halls.add(u)
    halls.add(v)

assert len(edges) == n - 1, f"{n - 1} different corridors expected"
assert n == 1 or halls == set(V), "Unexpected set of hall names"

E = {i: [] for i in range(1, n + 1)}
for u, v in edges:
    E[u].append(v)
    E[v].append(u)

if args.structure == "path":
    assert n == 1 or sum(1 for v in V if len(E[v]) == 1) == 2, "Expected a path"

if args.structure == "starlike":
    assert sum(1 for v in V if len(E[v]) > 2) <= 1, "Expected a starlike graph"

Q = [1]
visited = set([1])
while Q:
    R = []
    for u in Q:
        for v in E[u]:
            if v in visited:
                continue
            visited.add(v)
            R.append(v)
    Q = R
assert len(visited) == n, "Expected a connected graph"



assert sys.stdin.readline() == "", "Extra input"
sys.exit(42)
