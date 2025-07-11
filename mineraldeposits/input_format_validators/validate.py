#! /usr/bin/env python3

import re
import sys

from argparse import ArgumentParser
line = sys.stdin.readline()
assert re.match(r"[1-9][0-9]* [1-9][0-9]* [1-9][0-9]*\n", line), line
b, k, w = map(int, line.split())

parser = ArgumentParser("Validate input to manhattan")
parser.add_argument("--max_b", type=int, default=10**8)
parser.add_argument("--max_k",  type=int, default=20)
parser.add_argument("--min_w",  type=int, default=2)
args = parser.parse_args()

assert b <= args.max_b
assert 1 <= b <= 10**8 # constraint:b
assert k <= args.max_k
assert 1 <= k <= 20 # constraint:k

assert w >= args.min_w
assert 2 <= w <= 10**4 # constraint:w

hidden_points = set()
for _ in range(k):
    line = sys.stdin.readline()
    assert re.match(r"(0|-?[1-9][0-9]*) (0|-?[1-9][0-9]*)\n", line), line
    x, y = map(int, line.split())
    assert -b <= x <= b and -b <= y <= b, (x, y, b) # constraint:depositcoords
    hidden_points.add((x, y))

assert len(hidden_points) == k, "Duplicate points"

assert sys.stdin.readline() == "", "Extra input"
sys.exit(42)
