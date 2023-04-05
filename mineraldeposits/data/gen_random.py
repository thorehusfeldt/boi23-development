#! /usr/bin/env python3

from argparse import ArgumentParser
from random import randint, seed

parser = ArgumentParser("Generate random instance")
parser.add_argument("--b", type=int)
parser.add_argument("--w", type=int)
parser.add_argument("--k", type=int)
parser.add_argument("seed", type=int)
args = parser.parse_args()

seed(args.seed)

print(args.b, args.k, args.w)
points = set()
while len(points) < args.k:
    points.add(
        (randint(-args.b, args.b), (randint(-args.b, args.b)))
    )

for x, y in points:
    print(x, y)
