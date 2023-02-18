#! /usr/bin/python3

import re
import sys

MAX_N = 400

line = sys.stdin.readline()

assert re.match(r"[1-9][0-9]* [1-9][0-9]* (0|[1-9][0-9]*) (0|[1-9][0-9]*)\n", line), line
k, n, s, t = map(int, line.split())

assert 0 < k <= n <= MAX_N
assert 0 <= s <= 10**9
assert 0 <= t <= 10**9

points = set()
for _ in range(n):
    line = sys.stdin.readline()
    assert re.match(r"(0|-?[1-9][0-9]*) (0|-?[1-9][0-9]*)\n", line), line
    x, y = map(int, line.split())
    assert -10**9 <= x <= 10**9
    assert -10**9 <= y <= 10**9
    points.add((x,y))

assert len(points) == n, "Duplicate points"
assert sys.stdin.readline() == "", "Extra input"
sys.exit(42)
