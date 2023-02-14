#! /usr/bin/env python3

import re
import sys
from argparse import ArgumentParser

parser = ArgumentParser("Validate input to terraforming")
parser.add_argument("--same", action="store_true", help="both integers are the same")
args = parser.parse_args()

line = sys.stdin.readline()
assert re.fullmatch(r"(0|-?[1-9][0-9]*) (0|-?[1-9][0-9]*)\n", line)
x, y = map(int, line.split())
assert -1000 <= x <= 1000
assert -1000 <= y <= 1000
if args.same:
    assert x == y

assert sys.stdin.readline() == '' # make sure there's no extra input

sys.exit(42) # 42 means ok
