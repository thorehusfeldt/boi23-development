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
assert 1 <= n <= args.max_n, (n, args.max_n)
for _ in range(n):
    line = sys.stdin.readline()
    assert re.match(r"[1-9][0-9]*\n", line)
    assert 1 <= int(line) <= args.max_w, (int(line), args.max_w)

assert sys.stdin.readline() == "", "Extra input"

sys.exit(42)
