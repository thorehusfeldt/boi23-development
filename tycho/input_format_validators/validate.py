#! /usr/bin/env python3

import re
import sys

from argparse import ArgumentParser

parser = ArgumentParser("Validate input to hide")
parser.add_argument("--max_z", type=int, default=10**12)
parser.add_argument("--max_m", type=int, default=10**12)
parser.add_argument("--max_c", type=int, default=10**6)
parser.add_argument("--max_n", type=int, default=10**5)
args = parser.parse_args()


line = sys.stdin.readline()
assert re.match(r"[1-9][0-9]* [1-9][0-9]* (0|[1-9][0-9]*) (0|[1-9][0-9]*)\n", line), line
z, m, c, n  = map(int, line.split())
assert 0 < z <= args.max_z
assert 0 < m <= args.max_m
assert 0 <= c <= args.max_c
assert 0 <= n <= args.max_n

a = []
for _ in range(n):
    line = sys.stdin.readline()
    assert re.match(r"[1-9][0-9]*\n", line), line
    a.append(int(line))
if a:
    assert a == sorted(a), "Unsorted hideouts"
    assert len(set(a)) == n, "Duplicate hideouts"
    assert min(a) > 0, "Negative hideout" # redundant, caught by regex
    assert max(a) < z, "hideout out of bounds"

assert sys.stdin.readline() == ""
sys.exit(42)
