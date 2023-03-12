#! /usr/bin/env python3

import re
import sys
from argparse import ArgumentParser

parser = ArgumentParser("Validate input to staringcontest")
parser.add_argument("--min_n", type=int, default=3)
parser.add_argument("--max_n", type=int, default=1225)
args = parser.parse_args()


line = sys.stdin.readline()
assert re.match(r"([1-9][0-9]* )*[1-9][0-9]*\n", line), line
tokens = line.split()
for token in tokens:
    assert int(token) > 0, 'Skills must be positive'

n = len(tokens)
assert args.min_n <= n <= args.max_n
assert len(set(tokens)) == n, 'Duplicate skills'
assert sys.stdin.readline() == ""
sys.exit(42)
