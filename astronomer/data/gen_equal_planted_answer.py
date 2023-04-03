#! /usr/bin/env python3

from math import cos, sin, acos
from argparse import ArgumentParser
from random import randint, seed, uniform, gauss
from geometry_lib import Point

parser = ArgumentParser("Generates alot of peaks with one planted answer to break heuristic solutions")
parser.add_argument("--k", type=int)
parser.add_argument("--n", type=int)
parser.add_argument("--s", type=int)
parser.add_argument("--t", type=int)
parser.add_argument("seed", type=int)
args = parser.parse_args()

k, n, s, t = args.k, args.n, args.s, args.t
print(k, n, s, t)

sed = k * n
if s >= 0:
    sed *= s
if t >= 0:
    sed *= t

seed(sed)

c = uniform(0, 1000000000)
x, y = int(uniform(-1000000000,1000000000)), int(uniform(-1000000000,1000000000))
seed(args.seed)

points = set()

for i in range(int(k**0.5)):
    for j in range(int(k**0.5)):
        cu = Point(int(x + i), int(y + j))
        if abs(cu.x) > 10**9 or abs(cu.y) > 10**9:
            continue
        points.add(cu)

while len(points) < n:
    radius = gauss(c, c / 2)
    angle = uniform(0,2*acos(-1))
    cu = Point(int(radius * cos(angle)), int(radius * sin(angle)))
    if abs(cu.x) > 10**9 or abs(cu.y) > 10**9:
        continue
    points.add(cu)

for p in points:
    print(p.x,p.y)
