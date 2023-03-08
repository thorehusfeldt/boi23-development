#! /usr/bin/env python3

from argparse import ArgumentParser
from random import randint, seed
from geometry_lib import Point

parser = ArgumentParser("Generate points described by p + cq for points p=(px,py), q=(qx,qy) and integers c")
parser.add_argument("--k", type=int)
parser.add_argument("--n", type=int)
parser.add_argument("--s", type=int)
parser.add_argument("--t", type=int)
parser.add_argument("--px", type=int)
parser.add_argument("--py", type=int)
parser.add_argument("--qx", type=int)
parser.add_argument("--qy", type=int)
parser.add_argument("--min_c", type=int)
parser.add_argument("--max_c", type=int)
parser.add_argument("seed", type=int)
args = parser.parse_args()

seed(args.seed)

n = args.n
print(args.k, n, args.s, args.t)
px,py,qx,qy = args.px, args.py, args.qx, args.qy

p1 = Point(px,py)
p2 = Point(qx,qy)

points = set()
while len(points) < n:
    c = randint(args.min_c,args.max_c)
    points.add(p1 + p2*c)

for p in points:
    print(p.x,p.y)
