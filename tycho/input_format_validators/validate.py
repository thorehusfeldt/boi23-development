#! /usr/bin/env python3

import re
import sys

from argparse import ArgumentParser

parser = ArgumentParser("Validate input to hide")
parser.add_argument("--max_b", type=int, default=10**12)
parser.add_argument("--max_p", type=int, default=10**12)
parser.add_argument("--max_d", type=int, default=10**6)
parser.add_argument("--max_n", type=int, default=10**5)
args = parser.parse_args()


line = sys.stdin.readline()
assert re.match(r"[1-9][0-9]* [1-9][0-9]* (0|[1-9][0-9]*) (0|[1-9][0-9]*)\n", line), line
b, p, d, n  = map(int, line.split())

assert b <= args.max_b
assert p <= args.max_p
assert d <= args.max_d
assert n <= args.max_n

assert n < b # constraint:sheltersfit
assert p < b # constraint:pulsehappens

assert 1 <= b <= 10**12 # constraint:b
assert 0 <= d <= 10**6  # constraint:d
assert 0 <= n <= 10**5  # constraint:n

a = []
for _ in range(n):
    line = sys.stdin.readline()
    assert re.match(r"[1-9][0-9]*\n", line), line
    a_i = int(line)
    assert 0 < a_i < b, "hideout out of bounds" # constraint:shelterbounds
    a.append(a_i)

if a:
    assert a == sorted(a), "Unsorted hideouts" # constraint:sortedshelters
    assert len(set(a)) == n, "Duplicate hideouts"

assert sys.stdin.readline() == ""
sys.exit(42)
