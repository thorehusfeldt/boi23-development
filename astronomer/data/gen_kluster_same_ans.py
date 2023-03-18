#! /usr/bin/env python3

from argparse import ArgumentParser
from random import randint, seed
from geometry_lib import Point

parser = ArgumentParser("Generates c clusters of of points where each cluster has almost same answer with max answer d")
parser.add_argument("--k", type=int)
parser.add_argument("--n", type=int)
parser.add_argument("--s", type=int)
parser.add_argument("--t", type=int)
parser.add_argument("--c", type=int)
parser.add_argument("--d", type=int)
parser.add_argument("seed", type=int)
args = parser.parse_args()

seed(args.seed)

k, n, s, t = args.k, args.n, args.s, args.t
print(k, n, s, t)
c, d = args.c, args.d

v = []
while len(v) < c:
    cu = Point(randint(-d//t,d//t), randint(-d//t,d//t)) 
    if cu.dist() * t < d:
        v.append(cu)

points = set()
while len(points) < n:
    id = randint(0,c-1)
    offset = (d - v[id].dist() * t)//s
    cn = len(points)
    while cn == len(points):
        cu = Point(v[id].x + randint(-offset,offset), v[id].y + randint(-offset,offset))
        points.add(cu)

for p in points:
    print(p.x,p.y)
