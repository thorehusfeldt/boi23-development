#! /usr/bin/env python3

""" Generate random tree

    Starting from T being a single node, randomly attaches new
    vertex u to uniform random choice v from T.

    TODO:

    - Choose v in constant time, current implementation is probably very slow

    - Allow more distributions for choice of v

    seed is typically provided behind the scenes by the generator script
"""

import random
from argparse import ArgumentParser

parser = ArgumentParser("Random input")
parser.add_argument("seed", type=int, help="seed")
parser.add_argument("-n", type=int)

args = parser.parse_args()

random.seed(args.seed)

print(args.n)

remaining_vertices = list(range(1, args.n + 1))
random.shuffle(remaining_vertices)
T = [remaining_vertices.pop()]
for v in remaining_vertices:
    print (v, random.choice(T))
    T.append(v)
