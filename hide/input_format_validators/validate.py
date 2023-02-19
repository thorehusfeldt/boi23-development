#! /usr/bin/env python3

import re
import sys

line = sys.stdin.readline()
assert re.match(r"[1-9][0-9]* [1-9][0-9]* (0|[1-9][0-9]*) (0|[1-9][0-9]*)\n", line), line
z, m, c, n  = map(int, line.split())
assert 0 < z <= 10**12
assert 0 < m <= 10**12
assert 0 <= c <= 10**6
assert 0 <= n <= 10**5

a = []
for _ in range(n):
    line = sys.stdin.readline()
    assert re.match(r"(0|[1-9][0-9]*)\n", line), line
    a.append(int(line))
if a:
    assert a == sorted(a), "Unsorted hideouts"
    assert len(set(a)) == n, "Duplicate hideouts"
    assert min(a) >= 0, "Negative hideout" # redundant, caught by regex
    assert max(a) <= 10**12, "Invalid hideout"

assert sys.stdin.readline() == ""
sys.exit(42)
