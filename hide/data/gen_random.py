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
    "--max_a", type=int, default=None, help="Largest hideout index, default = 2 * z"
)
parser.add_argument("seed", type=int, help="seed")

args = parser.parse_args()
if args.max_a is None:
    args.max_a = 2 * args.z

random.seed(args.seed)

print(args.z, args.m, args.c, args.n)
if args.n > 0:
    print(*sorted(random.sample(range(args.max_a + 1), args.n)), sep="\n")
