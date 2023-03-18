#! /usr/bin/env python3

from math import acos, cos, sin
from argparse import ArgumentParser
from random import randint, seed, uniform
from geometry_lib import Point

parser = ArgumentParser("Generates c circle where each circle is distance d away with radius r")
parser.add_argument("--k", type=int)
parser.add_argument("--n", type=int)
parser.add_argument("--s", type=int)
parser.add_argument("--t", type=int)
parser.add_argument("--c", type=int)
parser.add_argument("--d", type=int)
parser.add_argument("--r", type=int)
parser.add_argument("seed", type=int)
args = parser.parse_args()

seed(args.seed)

k, n, s, t = args.k, args.n, args.s, args.t
print(k, n, s, t)
c, d, r = args.c, args.d, args.r

v = []
while len(v) < c:
    angle = uniform(0,2*acos(-1))
    cu = Point(d * cos(angle), d * sin(angle)) 
    v.append(cu)

points = set()
while len(points) < n:
    id = randint(0,c-1)
    angle = uniform(0,2*acos(-1))
    cu = Point(int(v[id].x + r * cos(angle)), int(v[id].y + r * sin(angle)))
    points.add(cu)

for p in points:
    print(p.x,p.y)
