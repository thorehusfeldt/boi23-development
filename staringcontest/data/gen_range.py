#! /usr/bin/env python3

from argparse import ArgumentParser
import random

parser = ArgumentParser(
    """
Generate random instance

n values are chosen from min_a..max_a

Default for max_a is min_a + n. Default for min_a is 1

    --n 3          : pick 1, 2, 3
    --n 3 --min_a 5: pick 5, 6, 7
    --n 3 --min_a 5 --max_a 10: pick 3 values from 5..10

    With argument --shuffled, the values are shuffled
"""
)
parser.add_argument("--n", type=int)
parser.add_argument("--shuffled", action="store_true")
parser.add_argument("--min_a", type=int, default=1)
parser.add_argument("--max_a", type=int, default=None)
parser.add_argument("seed", type=int)
args = parser.parse_args()

if args.max_a is None:
    args.max_a = args.n + args.min_a - 1
assert args.max_a <= 86400.

random.seed(args.seed)
assert args.max_a - args.min_a >= args.n - 1

values = sorted(random.sample(range(args.min_a, args.max_a + 1), args.n))
if args.shuffled:
    random.shuffle(values)
print(*values)
