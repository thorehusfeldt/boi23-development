#! /usr/bin/env python3

import re
import sys

from argparse import ArgumentParser
line = sys.stdin.readline()
assert re.match(r"[1-9][0-9]* [1-9][0-9]* [1-9][0-9]* [1-9][0-9]*\n", line), line
n, m, k, Q = map(int, line.split())

parser = ArgumentParser("Validate input to manhattan")
parser.add_argument("--max_nm", type=int, default=10**9)
parser.add_argument("--max_k",  type=int, default=50)
parser.add_argument("--Q",  type=int)
args = parser.parse_args()

assert n <= args.max_nm
assert 1 <= n <= 10**9 # constraint:n
assert m <= args.max_nm
assert 1 <= m <= 10**9 # constraint:m
assert k <= args.max_k
assert 1 <= k <= 30 # constraint:k

assert Q == args.Q
assert 2 <= Q <= 10**4 # constraint:Q

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
