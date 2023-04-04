#! /usr/bin/env python3

from argparse import ArgumentParser
from random import randint, seed

parser = ArgumentParser("Generate random instance")
parser.add_argument("--n", type=int)
parser.add_argument("--m", type=int)
parser.add_argument("--Q", type=int)
parser.add_argument("--k", type=int)
parser.add_argument("seed", type=int)
args = parser.parse_args()

seed(args.seed)

n = args.n
print(args.n, args.m, args.k, args.Q)
points = set()
while len(points) < args.k:
    points.add(
        (randint(0, args.n), (randint(0, args.m)))
    )

for x, y in points:
    print(x, y)
