#! /usr/bin/env python3

from argparse import ArgumentParser
from random import randrange, seed

parser = ArgumentParser("Generate random instance")
parser.add_argument("--k", type=int)
parser.add_argument("--n", type=int)
parser.add_argument("--s", type=int)
parser.add_argument("--t", type=int)
parser.add_argument("--min_x", type=int, default=-(10**9))
parser.add_argument("--max_x", type=int, default=10**9)
parser.add_argument("--min_y", type=int, default=-(10**9))
parser.add_argument("--max_y", type=int, default=10**9)
parser.add_argument("seed", type=int)
args = parser.parse_args()

seed(args.seed)

n = args.n
print(args.k, n, args.s, args.t)
points = set()
while len(points) < n:
    points.add(
        (randrange(args.min_x, args.max_x + 1), (randrange(args.min_y, args.max_y + 1)))
    )

for x, y in points:
    print(x, y)
