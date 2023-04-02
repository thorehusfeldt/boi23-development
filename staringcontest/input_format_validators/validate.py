#! /usr/bin/env python3

import re
import sys
from argparse import ArgumentParser

parser = ArgumentParser("Validate input to staringcontest")
parser.add_argument("--min_n", type=int, default=2)
parser.add_argument("--max_n", type=int, default=1225)
args = parser.parse_args()


line = sys.stdin.readline()
assert re.match(r"([1-9][0-9]* )*[1-9][0-9]*\n", line), line
a = list(map(int, line.split()))
for i in range(len(a)):
    assert 1 <= a[i] <= 86_400, 'Skill out of bounds' # constraint:skillbounds

n = len(a)
assert args.min_n <= n <= args.max_n
assert 2 <= n <= 1225 # constraint:n
assert len(set(a)) == len(a) # constraint:allskillsdifferent
assert sys.stdin.readline() == ""
sys.exit(42)
