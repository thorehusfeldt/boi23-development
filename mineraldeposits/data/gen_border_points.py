#! /usr/bin/env python3

from argparse import ArgumentParser
from random import randint, seed, choice

parser = ArgumentParser("Generate random instance of border points")
parser.add_argument("--b", type=int)
parser.add_argument("--k", type=int)
parser.add_argument("--w", type=int)
parser.add_argument("seed", type=int)
args = parser.parse_args()

seed(args.seed)

b = args.b
print(b, args.k, args.w)
points = set([(-b,-b),(-b,b),(b,-b),(b,b)])

d1 = set()
d2 = set()
for p in points:
    d1.add(p[0]+p[1])
    d2.add(p[0]-p[1])
while len(points) < args.k:
    c = 2 * randint(-b // 2, b // 2)
    p = choice([(-b,c),(b,c),(c,-b),(c,b)])

    if p[0] + p[1] in d1 or p[0] - p[1] in d2:
        continue

    d1.add(p[0] + p[1])
    d2.add(p[0] - p[1])

    points.add(p)

for x, y in points:
    print(x, y)
