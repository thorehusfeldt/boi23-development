#! /usr/bin/python3

import re
import sys

from argparse import ArgumentParser

parser = ArgumentParser("Validate input to astronomer")
parser.add_argument("--max_n", type=int, default=700)
parser.add_argument("--s_geq_t",  action='store_true')
parser.add_argument("--k_eq_n",  action='store_true')
parser.add_argument("--s_eq_0",  action='store_true')
args = parser.parse_args()

line = sys.stdin.readline()

assert re.match(r"[1-9][0-9]* [1-9][0-9]* (0|[1-9][0-9]*) (0|[1-9][0-9]*)\n", line), line
k, n, s, t = map(int, line.split())

assert 0 < k <= n <= 700 # constraint:kn
assert n <= args.max_n
assert 0 <= s <= 10**9  and 0 <= t <= 10**9 # constraint:st

assert not args.s_geq_t or s >= t
assert not args.k_eq_n or k == n
assert not args.s_eq_0 or s == 0


points = set()
for _ in range(n):
    line = sys.stdin.readline()
    assert re.match(r"(0|-?[1-9][0-9]*) (0|-?[1-9][0-9]*)\n", line), line
    x, y = map(int, line.split())
    assert -10**9 <= x <= 10**9 and -10**9 <= y <= 10**9 # constraint:xy
    points.add((x,y))

assert len(points) == n, "Duplicate points"
assert sys.stdin.readline() == "", "Extra input"
sys.exit(42)
