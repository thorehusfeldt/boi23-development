#! /usr/bin/env python3

from argparse import ArgumentParser
from random import randint, seed
import utilities

parser = ArgumentParser("Generate random instance")
parser.add_argument("-n", type=int)
parser.add_argument("--min_w", type=int, default=1)
parser.add_argument("--max_w", type=int, default=10**6)
parser.add_argument("--avoid_short_solution", action="store_true", help="""
                    Ensure that the instance is not solved by a shortest-length
                    good sequence.
                    (Tries 1000 times, then gives up, because no such instance may 
                    exist if min_w and max_w are very restrictive. Use with care.)
                    """
                    )
parser.add_argument("seed", type=int)
args = parser.parse_args()

seed(args.seed)

n = args.n
attempts = 0
while True:
    attempts += 1
    assert attempts < 100, "Fatal: too many attempts, try making weight range wider"
    w = [randint(args.min_w, args.max_w) for _ in range(n)]
    if args.avoid_short_solution:
        opt_all, _, opt_shortest = utilities.check(w)
        if opt_all < opt_shortest:
            break
    else:
        break

print(args.n)
print(*w, sep='\n')
