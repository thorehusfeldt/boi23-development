#! /usr/bin/env python3

import re
import sys
from argparse import ArgumentParser

parser = ArgumentParser("Validate input to astronomer")
parser.add_argument("--max_n", type=int, default=30000)
parser.add_argument("--max_w", type=int, default=10**6)
args = parser.parse_args()

line = sys.stdin.readline()
assert re.match(r"[1-9][0-9]*\n", line)
n = int(line)
assert n <= args.max_n, (n, args.max_n)
assert 1 <= n <= 30_000 # constraint:n
for _ in range(n):
    line = sys.stdin.readline()
    assert re.match(r"[1-9][0-9]*\n", line)
    wi = int(line)
    assert wi <= args.max_w
    assert 1 <= wi <= 10**6 # constraint:wi

assert sys.stdin.readline() == "", "Extra input"

sys.exit(42)
