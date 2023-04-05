#! /usr/bin/env python3

from argparse import ArgumentParser
from random import randint, seed

parser = ArgumentParser("Generate random instance")
parser.add_argument("-n", type=int)
parser.add_argument("--min_w", type=int, default=1)
parser.add_argument("--max_w", type=int, default=10**6)
parser.add_argument("--descending", action="store_true")
parser.add_argument("seed", type=int)
args = parser.parse_args()

seed(args.seed)

n = args.n
w = [randint(args.min_w, args.max_w) for _ in range(n)]
if args.descending:
    w = reversed(sorted(w))
print(args.n)
print(*w, sep='\n')
