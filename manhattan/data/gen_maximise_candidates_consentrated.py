#! /usr/bin/env python3

from argparse import ArgumentParser
from random import randint, seed

parser = ArgumentParser("Generate random instance")
parser.add_argument("--n", type=int)
parser.add_argument("--m", type=int)
parser.add_argument("--Q", type=int)
parser.add_argument("--k", type=int)
parser.add_argument("--ccx", type=int)
parser.add_argument("--ccy", type=int)
parser.add_argument("seed", type=int)
args = parser.parse_args()

seed(args.seed)

n = args.n
print(args.n, args.m, args.k, args.Q)
points = set()
d1 = set()
d2 = set()
while len(points) < args.k:
    p = (randint(args.ccx//2 - 50, args.ccx//2 + 50)*2, (randint(args.ccy//2 - 50, args.ccy//2 + 50))*2)

    if p[0] + p[1] in d1 or p[0] - p[1] in d2: continue

    d1.add(p[0] + p[1])
    d2.add(p[0] - p[1])

    points.add(p)

for x, y in points:
    print(x, y)
