#! /usr/bin/env python3

from math import cos, sin, acos
from argparse import ArgumentParser
from random import randint, seed, uniform
from geometry_lib import Point

parser = ArgumentParser("Generates c circle where each circle has answer d with more than min_dis away from (0,0)")
parser.add_argument("--k", type=int)
parser.add_argument("--n", type=int)
parser.add_argument("--s", type=int)
parser.add_argument("--t", type=int)
parser.add_argument("--c", type=int)
parser.add_argument("--d", type=int)
parser.add_argument("--min_dis", type=int)
parser.add_argument("seed", type=int)
args = parser.parse_args()

seed(args.seed)

k, n, s, t = args.k, args.n, args.s, args.t
print(k, n, s, t)
c, d = args.c, args.d
min_dis = args.min_dis

v = []
while len(v) < c:
    cu = Point(randint(-d//t,d//t), randint(-d//t,d//t)) 
    if cu.dist() * t < min_dis:
        continue
    if cu.dist() * t < d:
        v.append(cu)

points = set()
while len(points) < n:
    id = randint(0,c-1)
    radius = (d - v[id].dist() * t)//s
    cn = len(points)
    while cn == len(points):
        angle = uniform(0,2*acos(-1))
        cu = Point(int(v[id].x + radius * cos(angle)), int(v[id].y + radius * sin(angle)))
        points.add(cu)

for p in points:
    print(p.x,p.y)
