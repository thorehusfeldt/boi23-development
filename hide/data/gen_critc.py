#! /usr/bin/env python3

""" Generate random instance to hide

    seed is typically provided behind the scenes by the generator script
"""

import random
import subprocess
import os
import sys
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument("-z", type=int)
parser.add_argument("-m", type=int)
parser.add_argument("-n", type=int)
parser.add_argument("-c0", type=int)
parser.add_argument(
    "--max_a", type=int, default=None, help="Largest hideout index, default = z - 1"
)
parser.add_argument("seed", type=int, help="seed")

args = parser.parse_args()
max_a = args.max_a or args.z - 1

assert max_a < args.z

random.seed(args.seed)

# os.system("g++ -O2 ../submissions/accepted/lucas_impl_seg.cpp -o full_solution")
positions = "\n".join(map(str, sorted(random.sample(range(1, max_a + 1), args.n)))) + "\n"

def solve(c):
    test = " ".join([str(x) for x in [args.z, args.m, c, args.n]]) + "\n" + positions
    proc = subprocess.Popen(["./full_solution"], stdout=subprocess.PIPE, stdin=subprocess.PIPE)
    (out, err) = proc.communicate(input=test.encode("utf-8"))
    exit_code = proc.wait()
    return int(out.decode("utf-8"))

start = solve(args.c0)
diff = solve(args.c0 + 1) - start

lo = args.c0 + 1
hi = 10**6
while lo < hi:
    mid = (lo + hi + 1) // 2
    if solve(mid) == start + (mid - args.c0) * diff:
        lo = mid
    else:
        hi = mid - 1

res = solve(lo+1)
assert lo < 10**6
assert res != start + (lo - args.c0) * diff

print(args.z, args.m, lo, args.n)
print(positions, end="")