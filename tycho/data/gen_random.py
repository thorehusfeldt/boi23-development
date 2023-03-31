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
parser.add_argument("--min_a", type=int, default=None, help="Smallest hideout index, default = 1")
parser.add_argument(
    "--max_a", type=int, default=None, help="Largest hideout index, default = z - 1"
)
parser.add_argument("--strategy", choices=["random", "regular"], default="random")
parser.add_argument("seed", type=int, help="seed")

args = parser.parse_args()
z = args.z
n = args.n
min_a = args.min_a or 1
max_a = args.max_a or args.z - 1

assert max_a < z, "Hideouts must be < z"
assert max_a - min_a + 1 >= n, f"Unable to put {n} hideouts in {min_a}..{max_a}"

random.seed(args.seed)

print(z, args.m, args.c, args.n)
if args.strategy == "random":
    a = random.sample(range(1, max_a + 1), n)
else:
    a_range = max_a - min_a
    assert a_range % (n - 1) == 0
    intervallength = a_range // (n - 1)
    a = list(range(min_a, max_a, intervallength)) + [max_a]
if n > 0:
    print(*sorted(a), sep="\n")
