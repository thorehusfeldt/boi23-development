#! /usr/bin/env python3

from argparse import ArgumentParser
from random import randint, seed

parser = ArgumentParser("Generate random instance that, possibly concentrated around ccx and ccy")
parser.add_argument("--b", type=int)
parser.add_argument("--k", type=int)
parser.add_argument("--w", type=int)
parser.add_argument("--ccx", type=int)
parser.add_argument("--ccy", type=int)
parser.add_argument("seed", type=int)
args = parser.parse_args()

seed(args.seed)

if args.ccx is not None:
    assert args.ccy is not None


b = args.b
print(b, args.k, args.w)
points = set()
d1 = set()
d2 = set()
while len(points) < args.k:
    p = (
        (2 * randint(-b // 2, b // 2), 2 * randint(-b // 2, b // 2))
        if args.ccx is None
        else (
            2 * randint(args.ccx // 2 - 50, args.ccx // 2 + 50),
            2 * (randint(args.ccy // 2 - 50, args.ccy // 2 + 50)),
        )
    )

    if p[0] + p[1] in d1 or p[0] - p[1] in d2:
        continue

    d1.add(p[0] + p[1])
    d2.add(p[0] - p[1])

    points.add(p)

for x, y in points:
    print(x, y)
