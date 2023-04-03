#! /usr/bin/env python3

""" Generate random instance to hide such that the solution changes when d is increased by 1
    Idea: Suppose that we take radiation damage x times. Then increasing d by 1 will increase
    the total damage by x. So if x stays the same, damage is a linear function. We binary search
    for the first d where the answer is different from the linear function.

    This requires the existence of a combiled full solution with file name "full_solution" in
    the current directory. It should be provided (and cleaned up) by the generator script.

    seed is typically provided behind the scenes by the generator script
"""

import random
import subprocess
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument("-b", type=int)
parser.add_argument("-p", type=int)
parser.add_argument("-n", type=int)
parser.add_argument("-d0", type=int)
parser.add_argument(
    "--max_a", type=int, default=None, help="Largest hideout index, default = b - 1"
)
parser.add_argument("seed", type=int, help="seed")

args = parser.parse_args()
max_a = args.max_a or args.b - 1

assert max_a < args.b

random.seed(args.seed)

positions = "\n".join(map(str, sorted(random.sample(range(1, max_a + 1), args.n)))) + "\n"

def solve(c):
    test = " ".join([str(x) for x in [args.b, args.p, c, args.n]]) + "\n" + positions
    proc = subprocess.Popen(["./full_solution"], stdout=subprocess.PIPE, stdin=subprocess.PIPE)
    out, _ = proc.communicate(input=test.encode("utf-8"))
    _ = proc.wait()
    return int(out.decode("utf-8"))

start = solve(args.d0)
diff = solve(args.d0 + 1) - start

lo = args.d0 + 1
hi = 10**6
while lo < hi:
    mid = (lo + hi + 1) // 2
    if solve(mid) == start + (mid - args.d0) * diff:
        lo = mid
    else:
        hi = mid - 1

res = solve(lo+1)
assert lo < 10**6
assert res != start + (lo - args.d0) * diff

print(args.b, args.p, lo, args.n)
print(positions, end="")
