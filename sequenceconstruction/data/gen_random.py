#! /usr/bin/env python3

from argparse import ArgumentParser
from random import randint, seed

parser = ArgumentParser("Generate random instance")
parser.add_argument("-n", type=int)
parser.add_argument("--min_w", type=int, default=1)
parser.add_argument("--max_w", type=int, default=10**6)
parser.add_argument("seed", type=int)
args = parser.parse_args()

seed(args.seed)

n = args.n
print(args.n)
for _ in range(n):
    print(randint(args.min_w, args.max_w))
