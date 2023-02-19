#! /usr/bin/env python3

""" Generate random instance to hide

    seed is typically provided behind the scenes by the generator script
"""

import random
from argparse import ArgumentParser

parser = ArgumentParser("Random input")
parser.add_argument("-z", type=int)
parser.add_argument("-m", type=int)
parser.add_argument("-c", type=int)
parser.add_argument("-n", type=int)
parser.add_argument(
    "--max_a", type=int, default=None, help="Largest hideout index, default = z - 1"
)
parser.add_argument("seed", type=int, help="seed")

args = parser.parse_args()
z = args.z
n = args.n
max_a = args.max_a or args.z - 1

assert max_a < z

random.seed(args.seed)

print(z, args.m, args.c, args.n)
if n > 0:
    print(*sorted(random.sample(range(1, max_a + 1), n)), sep="\n")
