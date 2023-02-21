#! /usr/bin/env python3

import re
import sys

line = sys.stdin.readline()
assert re.match(r"[1-9][0-9]* [1-9][0-9]* [1-9][0-9]* [1-9][0-9]*\n", line), line
n, m, k, Q = map(int, line.split())

assert 1 <= n <= 10**9
assert 1 <= m <= 10**9
assert 1 <= k <= 50
assert 1 <= Q <= 10**4

hidden_points = set()
for _ in range(k):
    line = sys.stdin.readline()
    assert re.match(r"(0|[1-9][0-9]*) (0|[1-9][0-9]*)\n", line), line
    x, y = map(int, line.split())
    assert 0 <= x <= n
    assert 0 <= y <= m
    hidden_points.add((x, y))

assert len(hidden_points) == k, "Duplicate points"

assert sys.stdin.readline() == "", "Extra input"
sys.exit(42)
