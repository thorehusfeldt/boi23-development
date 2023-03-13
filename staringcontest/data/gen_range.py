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


    --plantfirst 7 means plant the first (highest) a in position 7
    --plantsecond 8 means plant the first (highest) a in position 8
"""
)
parser.add_argument("--n", type=int)
parser.add_argument("--shuffled", action="store_true")
parser.add_argument("--min_a", type=int, default=1)
parser.add_argument("--max_a", type=int, default=None)
parser.add_argument("--plantfirst", type=int)
parser.add_argument("--plantsecond", type=int)
parser.add_argument("seed", type=int)
args = parser.parse_args()

if args.max_a is None:
    args.max_a = args.n + args.min_a - 1
assert args.max_a <= 86400.

random.seed(args.seed)
assert args.max_a - args.min_a >= args.n - 1

a = sorted(random.sample(range(args.min_a, args.max_a + 1), args.n))
second, first = a[-2:]
if args.shuffled:
    random.shuffle(a)

first_id = a.index(first)
second_id = a.index(second)
if args.plantfirst and args.plantsecond:
    assert args.plantfirst != args.plantsecond
if args.plantfirst is not None:
    a[first_id], a[args.plantfirst] = a[args.plantfirst], a[first_id]
# this is a bit naive (because it may re-swap with first. But ok for now:
if args.plantsecond is not None:
    a[second_id], a[args.plantsecond] = a[args.plantsecond], a[second_id]

print(*a)
