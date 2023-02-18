#! /usr/bin/env python3

""" Generate paths attached to a single node, including the n-star

    seed is typically provided behind the scenes by the generator script
"""

import random
from argparse import ArgumentParser

parser = ArgumentParser("Starlike tree, including the n-star")
parser.add_argument("seed", type=int, help="seed")
parser.add_argument("-n", type=int)
parser.add_argument(
    "--degree", type=int, default=-1, help="Outdegree of central node, default n - 1"
)

args = parser.parse_args()
if args.degree == -1:
    args.degree = args.n - 1

random.seed(args.seed)
n = args.n
print(n)

neighbours = [2] + sorted(random.sample(range(3, n + 1), args.degree - 1)) + [n + 1]

for u, v in zip(neighbours, neighbours[1:]):
    print(1, u)
    for w in range(u + 1, v):
        print(w - 1, w)
