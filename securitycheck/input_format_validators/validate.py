#! /usr/bin/env python3

import re
import sys

MAX_N = 10000

line = sys.stdin.readline()
assert re.match("[1-9][0-9]*\n", line), line
n = int(line)
assert 0 < n <= MAX_N

edges = set()
halls = set()
for _ in range(n - 1):
    line = sys.stdin.readline()
    assert re.match("[1-9][0-9]* [1-9][0-9]*\n", line), line
    u, v = map(int, line.split())
    assert u != v, "Loop"
    u, v = sorted([u, v])
    assert (u, v) not in edges, "Duplicate corridor"
    edges.add((u, v))
    halls.add(u)
    halls.add(v)

assert len(edges) == n - 1, f"{n - 1} different corridors expected"
assert halls == set(range(1, n + 1)), "Unexpected set of hall names"

V = list(range(1, n))
E = {i: [] for i in range(1, n + 1)}
for u, v in edges:
    E[u].append(v)
    E[v].append(u)

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
