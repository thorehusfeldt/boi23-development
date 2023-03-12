#! /usr/bin/env python3

from argparse import ArgumentParser
import random

parser = ArgumentParser("Generate random instance")
parser.add_argument("--n", type=int)
parser.add_argument("--random", action="store_true")
parser.add_argument("seed", type=int)
args = parser.parse_args()

random.seed(args.seed)

values = list(range(1, args.n + 1))
if args.random:
    random.shuffle(values)
print(*values)
